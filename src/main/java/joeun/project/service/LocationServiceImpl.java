package joeun.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import joeun.project.dao.LocationMapper;
import joeun.project.dto.API_cat_code;
import joeun.project.dto.BolgguriViewDto;
import joeun.project.dto.Location;

@Service
public class LocationServiceImpl implements LocationService {

	@Autowired
	SqlSession sqlSession;

	public List<BolgguriViewDto> getNearbyLocations(double centerX, double centerY, double radius) {
		LocationMapper locationMapper = sqlSession.getMapper(LocationMapper.class);
		Map<String, Object> params = new HashMap<>();
		params.put("centerX", centerX);
		params.put("centerY", centerY);
		params.put("radius", radius);

		return locationMapper.findNearbyLocations(params);
	}

	@Override
	public List<BolgguriViewDto> getAllGpsPoints() {
		LocationMapper locationMapper = sqlSession.getMapper(LocationMapper.class);
		return locationMapper.getAllGpsPoints();
	}

	@Override
	public List<API_cat_code> selectBolgguriCat() {
		LocationMapper locationMapper = sqlSession.getMapper(LocationMapper.class);
		
		return locationMapper.selectBolgguriCat();
	}

	@Override
	public List<API_cat_code> selectMukgguriCat() {
		LocationMapper locationMapper = sqlSession.getMapper(LocationMapper.class);
		
		return locationMapper.selectMukgguriCat();
	}

	@Override
	public List<BolgguriViewDto> getNearbyMukgguri(double centerX, double centerY, double radius) {
		LocationMapper locationMapper = sqlSession.getMapper(LocationMapper.class);
		Map<String, Object> params = new HashMap<>();
		params.put("centerX", centerX);
		params.put("centerY", centerY);
		params.put("radius", radius);

		return locationMapper.findNearbyMukgguri(params);
	}

	@Override
	public List<API_cat_code> selectJalgguriCat() {
		LocationMapper locationMapper = sqlSession.getMapper(LocationMapper.class);
		
		return locationMapper.selectJalgguriCat();
	}

	@Override
	public List<BolgguriViewDto> getNearbyJalgguri(double centerX, double centerY, double radius) {
		LocationMapper locationMapper = sqlSession.getMapper(LocationMapper.class);
		Map<String, Object> params = new HashMap<>();
		params.put("centerX", centerX);
		params.put("centerY", centerY);
		params.put("radius", radius);

		return locationMapper.findNearbyJalgguri(params);
	}

	@Override
	public List<BolgguriViewDto> getNearbyKeyword(double centerX, double centerY, double radius, String keyword) {
		LocationMapper locationMapper = sqlSession.getMapper(LocationMapper.class);
		Map<String, Object> params = new HashMap<>();
		params.put("centerX", centerX);
		params.put("centerY", centerY);
		params.put("radius", radius);
		params.put("keyword", keyword);

		return locationMapper.findNearbyKeyword(params);
	}
	
	@Override
	public String getMsg() {
		LocationMapper locationMapper = sqlSession.getMapper(LocationMapper.class);
		return locationMapper.getMsg();
	}

	@Override
	public String getAppMsg() {
		LocationMapper locationMapper = sqlSession.getMapper(LocationMapper.class);
		return locationMapper.getAppMsg();
	}
}
