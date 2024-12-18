package joeun.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import joeun.project.dto.API_cat_code;
import joeun.project.dto.BolgguriViewDto;
import joeun.project.dto.GpsKeyword;
import joeun.project.dto.GpsPoint;
import joeun.project.dto.Location;
import joeun.project.service.LocationService;
import joeun.project.service.VisitorService;

@Controller
public class LocationController {
	private static final Logger logger = LoggerFactory.getLogger(LocationController.class);

	@Autowired
	private LocationService locationService;
	@Autowired
    private VisitorService visitorService;

	@GetMapping("/locations")
	public String getNearbyLocations(Model model) {
//		public String getNearbyLocations(@RequestParam double startX, @RequestParam double startY, @RequestParam double endX,
//				@RequestParam double endY, @RequestParam double radius, Model model) {		

		double startX = 126.6640687601;
		double startY = 37.5805775647;
		double endX = 128.7285401922;
		double endY = 38.0219924170;
		double radius = 0.1;

		// 5개의 중간 지점 계산 (단순 선형 보간법)
		List<double[]> intermediatePoints = calculateIntermediatePoints(startX, startY, endX, endY, 5, radius);
		List<Location> nearbyLocations = new ArrayList<>();

		// 각 중간 지점에서 근처 지점 검색
		for (double[] point : intermediatePoints) {
			// List<Location> locations = locationService.getNearbyLocations(point[0],
			// point[1], radius);
			// nearbyLocations.addAll(locations);
		}
		logger.debug("nearbyLocations:" + nearbyLocations);
		model.addAttribute("locations", nearbyLocations);

		return "dc/locationsView2"; // Your JSP view name
	}

	private List<double[]> calculateIntermediatePoints(double startX, double startY, double endX, double endY,
			int numPoints, double radius) {
		List<double[]> points = new ArrayList<>();
		double deltaX = (endX - startX) / (numPoints + 1);
		double deltaY = (endY - startY) / (numPoints + 1);
		logger.debug("deltaX :" + deltaX + ",deltaY" + deltaY);
		for (int i = 1; i <= numPoints; i++) {
			double[] point = new double[2];
			point[0] = startX + i * deltaX;
			point[1] = startY + i * deltaY;
			points.add(point);
		}
		// 목적지 주변을 찾을 수 있도록 목적지를 경로에 포함
		// 마지막 지점에서 radius만큼 떨어진 지점 계산
		double distance = Math.sqrt(deltaX * deltaX + deltaY * deltaY);
		double lastX = endX - (deltaX / distance) * radius;
		double lastY = endY - (deltaY / distance) * radius;
		points.add(new double[] { lastX, lastY });

		return points;
	}

	@RequestMapping("/map")
	public String showMap(Model model) {
		double startX = 37.5805775647;
		double startY = 126.6640687601;
//		double endX = 128.7285401922;//강원도 양양
//		double endY = 38.0219924170;
		double endX = 35.1870282870;
		double endY = 129.0917658723;// 부산
		double radius = 0.1;

		// 5개의 중간 지점 계산 (단순 선형 보간법)
		List<double[]> intermediatePoints = calculateIntermediatePoints(startX, startY, endX, endY, 5, radius);
		// 지도상 경로지점 좌표 jsp에 전달
		model.addAttribute("intermediatePoints", intermediatePoints);
		// 지도상 중간 center 좌표 표시
		double center_x = intermediatePoints.get(2)[0];
		double center_y = intermediatePoints.get(2)[1];
		logger.debug("center_x:" + center_x + ",center_y:" + center_y);
		model.addAttribute("center_x", center_x);
		model.addAttribute("center_y", center_y);

		// 중간경로 좌표 표시
		List<GpsPoint> points = intermediatePoints.stream().map(arr -> new GpsPoint(arr[0], arr[1]))
				.collect(Collectors.toList());// Point 객체 리스트로 변환

		ObjectMapper objectMapper1 = new ObjectMapper();// ObjectMapper를 이용하여 JSON으로 변환
		try {
			String routePointjson = objectMapper1.writeValueAsString(points);
			model.addAttribute("routePoint", routePointjson);
			logger.debug(routePointjson);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		// 주변 관광지 작업
		List<BolgguriViewDto> nearbyLocations = new ArrayList<>();

		// 각 중간 지점에서 근처 지점 검색
		for (double[] point : intermediatePoints) {
			List<BolgguriViewDto> locations = locationService.getNearbyLocations(point[0], point[1], radius);
			nearbyLocations.addAll(locations);
		}
		logger.debug("nearbyLocations:" + nearbyLocations);
		model.addAttribute("locations", nearbyLocations);
		// JSON으로 변환하여 모델에 추가
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			String nearbyLocationsJson = objectMapper.writeValueAsString(nearbyLocations);
			model.addAttribute("nearbyLocationsJson", nearbyLocationsJson);
			logger.debug("nearbyLocationsJson: " + nearbyLocationsJson);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "dc/map";
	}

	@RequestMapping("/kakao_car")
	public String kakao_car(Model model) {
		
		String kakaoApiKey="a7faa1b5042e8cffab85500d73eb2605";
		model.addAttribute("kakaoApiKey",kakaoApiKey);
		
		return "dc/kakao_car";
	}

	@RequestMapping("/ajax/map") // api_sigungu_code 입력하기
	@ResponseBody
	public String ajax_map(@RequestBody List<GpsPoint> data, @RequestParam double startLat, @RequestParam double startLng,
			@RequestParam double endLat, @RequestParam double endLng) {
		Map<String, Object> response = new HashMap<>();
		response.put("status", "success");
		// 예제 좌표 데이터
		double[][] coordinates = { { 37.5651, 126.98955 }, // 서울 시청 근처
				{ 37.5510, 126.9882 }, // 남산 타워 근처
				{ 37.5042, 127.0246 }, // 강남역 근처
				{ 35.1796, 129.0756 }, // 부산 해운대
				{ 35.1598, 126.8514 } // 광주 송정역 근처
		};
		response.put("coordinates", coordinates);

//    return response;
		return "Data saved successfully";
	}

	@RequestMapping("/nearBolgguri")
	public String nearBolgguri(Model model) {
		List<API_cat_code> catList = locationService.selectBolgguriCat();
		logger.debug("catList : "+catList);
		model.addAttribute("catList", catList);
		
		String kakaoApiKey="a7faa1b5042e8cffab85500d73eb2605";
		model.addAttribute("kakaoApiKey",kakaoApiKey);
		
		return "dc/nearBolgguri";
	}

//	@CrossOrigin(origins = "http://localhost:3000")
//	@RequestMapping(value = "/processArray", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
//	@ResponseBody
//	public ResponseEntity<String> processArray(@RequestBody List<GpsPoint> coordinate) {
//		logger.debug("coordinateString;" + coordinate);
//		Set<BolgguriViewDto> nearBolgguri = new HashSet<>();
//		// 각 지점에서 근처 지점 검색
//		for (GpsPoint point : coordinate) {
//			List<BolgguriViewDto> locations = locationService.getNearbyLocations(point.getX(), point.getY(),Double.parseDouble(point.getTitle())/100);
//			nearBolgguri.addAll(locations);
//		}
//		logger.debug("nearBolgguri:" + nearBolgguri);
//
//		// 결과를 JSON 형태로 반환
////		return ResponseEntity.ok(new JSONArray(nearBolgguri).toString());
//		return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON_UTF8)
//				.body(new JSONArray(nearBolgguri).toString());
//	}
	
	@CrossOrigin(origins = "http://localhost:3000")
	@RequestMapping(value = "/getNearBolgguri", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<String> getNearBolgguri(@RequestBody List<GpsPoint> coordinate) {
		logger.debug("coordinateString;" + coordinate);
		Set<BolgguriViewDto> nearBolgguri = new HashSet<>();
		// 각 지점에서 근처 지점 검색
		for (GpsPoint point : coordinate) {
			List<BolgguriViewDto> locations = locationService.getNearbyLocations(point.getX(), point.getY(),Double.parseDouble(point.getTitle())/100);
			nearBolgguri.addAll(locations);
		}
		logger.debug("nearBolgguri:" + nearBolgguri);

		// 결과를 JSON 형태로 반환
//		return ResponseEntity.ok(new JSONArray(nearBolgguri).toString());
		return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON_UTF8)
				.body(new JSONArray(nearBolgguri).toString());
	}	
	@RequestMapping("/nearMukgguri")
	public String nearMukgguri(Model model) {
		List<API_cat_code> catList = locationService.selectMukgguriCat();
		logger.debug("catList : "+catList);
		model.addAttribute("catList", catList);
		
		String kakaoApiKey="a7faa1b5042e8cffab85500d73eb2605";
		model.addAttribute("kakaoApiKey",kakaoApiKey);
		
		return "dc/nearMukgguri";
	}
	@RequestMapping(value = "/getNearMukgguri", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<String> getNearMukgguri(@RequestBody List<GpsPoint> coordinate) {
		logger.debug("coordinateString;" + coordinate);
		Set<BolgguriViewDto> nearMukgguri = new HashSet<>();
		// 각 지점에서 근처 지점 검색
		for (GpsPoint point : coordinate) {
			List<BolgguriViewDto> locations = locationService.getNearbyMukgguri(point.getX(), point.getY(),Double.parseDouble(point.getTitle())/100);
			nearMukgguri.addAll(locations);
		}
		logger.debug("nearMukgguri:" + nearMukgguri);

		// 결과를 JSON 형태로 반환
//		return ResponseEntity.ok(new JSONArray(nearBolgguri).toString());
		return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON_UTF8)
				.body(new JSONArray(nearMukgguri).toString());
	}
	@RequestMapping("/nearJalgguri")
	public String nearJalgguri(Model model) {
		List<API_cat_code> catList = locationService.selectJalgguriCat();
		logger.debug("catList : "+catList);
		model.addAttribute("catList", catList);
		
		String kakaoApiKey="a7faa1b5042e8cffab85500d73eb2605";
		model.addAttribute("kakaoApiKey",kakaoApiKey);
		
		return "dc/nearJalgguri";
	}
	@RequestMapping(value = "/getNearJalgguri", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<String> getnearJalgguri(@RequestBody List<GpsPoint> coordinate) {
		logger.debug("coordinateString;" + coordinate);
		Set<BolgguriViewDto> nearJalgguri = new HashSet<>();
		// 각 지점에서 근처 지점 검색
		for (GpsPoint point : coordinate) {
			List<BolgguriViewDto> locations = locationService.getNearbyJalgguri(point.getX(), point.getY(),Double.parseDouble(point.getTitle())/100);
			nearJalgguri.addAll(locations);
		}
		logger.debug("nearJalgguri:" + nearJalgguri);

		// 결과를 JSON 형태로 반환
//		return ResponseEntity.ok(new JSONArray(nearBolgguri).toString());
		return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON_UTF8)
				.body(new JSONArray(nearJalgguri).toString());
	}
	
	@RequestMapping("/nearKeyword")
	public String nearKeyword(Model model) {
//		List<API_cat_code> catList = locationService.selectMukgguriCat();
//		logger.debug("catList : "+catList);
//		model.addAttribute("catList", catList);
		
		String kakaoApiKey="a7faa1b5042e8cffab85500d73eb2605";
		model.addAttribute("kakaoApiKey",kakaoApiKey);
		
		return "dc/nearKeyword";
	}
	@RequestMapping(value = "/getNearKeyword", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<String> getNearKeyword(@RequestBody List<GpsKeyword> coordinate) {
		System.out.println("keyword:"+coordinate);
		logger.debug("coordinateString;" + coordinate);
		Set<BolgguriViewDto> nearKeyword = new HashSet<>();
		// 각 지점에서 근처 지점 검색
		for (GpsKeyword point : coordinate) {
			System.out.println("point.getKeyword():"+point.getKeyword());
			if(point.getKeyword() != "") {
				List<BolgguriViewDto> locations = locationService.getNearbyKeyword(point.getX(), point.getY(),Double.parseDouble(point.getRadius())/100, point.getKeyword());
				nearKeyword.addAll(locations);
			}
		}
		logger.debug("nearKeyword:" + nearKeyword);

		// 결과를 JSON 형태로 반환
//		return ResponseEntity.ok(new JSONArray(nearBolgguri).toString());
		return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON_UTF8)
				.body(new JSONArray(nearKeyword).toString());
	}
	
	@RequestMapping("/nearBolgguriApp")
	public String nearBolgguriApp(Model model) {
	      // 방문자 카운트 증가
        visitorService.incrementNearBolgguriCnt();
//		List<API_cat_code> catList = locationService.selectBolgguriCat();
//		logger.debug("catList : "+catList);
//		model.addAttribute("catList", catList);
		String msg = locationService.getMsg();
		model.addAttribute("appMsg", msg);
		
		
		String kakaoApiKey="a7faa1b5042e8cffab85500d73eb2605";
		model.addAttribute("kakaoApiKey",kakaoApiKey);
		
		return "dc/nearBolgguriApp";
	}
	@RequestMapping("/nearMukgguriApp")
	public String nearMukgguriApp(Model model) {
//		List<API_cat_code> catList = locationService.selectMukgguriCat();
//		logger.debug("catList : "+catList);
//		model.addAttribute("catList", catList);
		String msg = locationService.getMsg();
		model.addAttribute("appMsg", msg);
		
		String kakaoApiKey="a7faa1b5042e8cffab85500d73eb2605";
		model.addAttribute("kakaoApiKey",kakaoApiKey);
		
		return "dc/nearMukgguriApp";
	}
	@RequestMapping("/nearJalgguriApp")
	public String nearJalgguriApp(Model model) {
//		List<API_cat_code> catList = locationService.selectJalgguriCat();
//		logger.debug("catList : "+catList);
//		model.addAttribute("catList", catList);
		String msg = locationService.getMsg();
		model.addAttribute("appMsg", msg);
		
		String kakaoApiKey="a7faa1b5042e8cffab85500d73eb2605";
		model.addAttribute("kakaoApiKey",kakaoApiKey);
		
		return "dc/nearJalgguriApp";
	}
	@RequestMapping("/nearKeywordApp")
	public String nearKeywordApp(Model model) {
//		List<API_cat_code> catList = locationService.selectMukgguriCat();
//		logger.debug("catList : "+catList);
//		model.addAttribute("catList", catList);
		String msg = locationService.getMsg();
		model.addAttribute("appMsg", msg);
		
		String kakaoApiKey="a7faa1b5042e8cffab85500d73eb2605";
		model.addAttribute("kakaoApiKey",kakaoApiKey);
		
		return "dc/nearKeywordApp";
	}
	@RequestMapping("/kakao_carApp")
	public String kakao_carApp(Model model) {
		String msg = locationService.getMsg();
		model.addAttribute("appMsg", msg);
		
		String kakaoApiKey="a7faa1b5042e8cffab85500d73eb2605";
		model.addAttribute("kakaoApiKey",kakaoApiKey);
		
		return "dc/kakao_carApp";
	}
	@RequestMapping(value = "/getAppMsg", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<String> getAppMsg() {
		String getAppMsg = locationService.getAppMsg();
		System.out.println("getAppMsg:"+getAppMsg);
		// 결과를 JSON 형태로 반환
//		return ResponseEntity.ok(new JSONArray(nearBolgguri).toString());
//		return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON_UTF8).body(new JSONArray(nearKeyword).toString());
//		return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON_UTF8).body(new JSONArray(getAppMsg).toString());
		JSONObject json = new JSONObject(); // JSONObject 객체 생성
	    json.put("message", getAppMsg); // JSON 객체에 데이터 추가
	    return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON_UTF8).body(json.toString()); // JSON 객체를 문자열로 변환하여 반환
	}

}
