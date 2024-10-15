<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무장애 정보</title>
<link rel="stylesheet" href="/resources/dc/css/api.css">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
var url;
var serviceKey;
var numOfRows;
var pageNo;
var MobileOS;
var MobileApp;
var _type;
var arrange;
/* var contentTypeId; */
var contentId;

var items; //json 데이타
var resultMsg;

$(document).ready(function() {
	$('#getDisable').click(getDisable);
	$('#saveDisable').click(saveDisable);
	$('#autoDisable').click(autoDisable);

});
function autoDisable(){
	//"처리 중" 이미지와 배경을 표시
  document.getElementById('loading').style.display = 'block';
  document.getElementById('overlay').style.display = 'block';
	let resultMsg1;
	let resultCode1;
	let numOfRows1;
	let pageNo1;
	let totalCount1;

	alert("클릭");
	//입력값 확인
	url = $('#url').val();
	serviceKey = $("#serviceKey").val();
	numOfRows = $("#numOfRows").val();
	pageNo = $("#pageNo").val();
	MobileOS = $("#MobileOS").val();
	MobileApp = $("#MobileApp").val();
	_type = $("#_type").val();
	contentId = $("#contentId").val();

	var myUrl = url + "?serviceKey=인증키&numOfRows=" + numOfRows + "&pageNo="
			+ pageNo + "&MobileOS=" + MobileOS + "&MobileApp=" + MobileApp
			+ "&_type=" + _type + "&contentId=" + contentId;
	$(".url").text(myUrl);
	$.ajax({ 
		url : '/api/API_disable_proxy', // 
		type : 'get',
		contentType : 'application/json; charset=UTF-8',
		dataType : "JSON",
		data : {
			mode: 2,
			url : url,
			serviceKey : serviceKey,
			numOfRows : numOfRows,
			pageNo : pageNo,
			contentId: contentId
		},
		success : function(json) {
			alert('Data get successfully!');
			//공공데이타 조회 결과값 표시 
			resultCode1 = json.response.header.resultCode;
			resultMsg1 = json.response.header.resultMsg;
			$(".resultCode1").text("response.header.resultMsg :" + resultCode1);
			$(".resultMsg1").text("response.header.resultMsg :" + resultMsg1);

			if (resultMsg1 == "OK") {

				numOfRows1 = json.response.body.numOfRows;
				pageNo1 = json.response.body.pageNo;
				totalCount1 = json.response.body.totalCount;
				//console.log(numOfRows1,pageNo1,totalCount1);
				$(".numOfRows1").text("response.body.numOfRows :" + numOfRows1);
				$(".pageNo1").text("response.body.pageNo :" + pageNo1);
				$(".totalCount1").text("response.body.totalCount :" + totalCount1);

				items = json.response.body.items.item;
				console.log("response itemJson: ",items);
				var tableBody = $('#ajaxTable');
				$('#ajaxTable').empty();
				var thead =$("<thead><tr>"
										+"<th>CONTENTID    </th>"
				            +"<th>IMGNAME      </th>"
				            +"<th>ORIGINIMGURL </th>"
				            +"<th>SERIALNUM    </th>"
				            +"<th>CPYRHTDIVCD  </th>"
				            +"<th>SMALLIMAGEURL</th>"	
				            +"</tr></thead>");
				tableBody.append(thead);

				$.each(items, function(index, item) {
					var newRow = $('<tr></tr>');
					newRow.append($('<td></td>').text(item.contentid    ));
					newRow.append($('<td></td>').text(item.imgname      ));
					newRow.append($('<td></td>').text(item.originimgurl ));
					newRow.append($('<td></td>').text(item.serialnum    ));
					newRow.append($('<td></td>').text(item.cpyrhtDivCd  ));
					newRow.append($('<td></td>').text(item.smallimageurl));
					tableBody.append(newRow);
				});
			}
			document.getElementById('loading').style.display = 'none';
		  document.getElementById('overlay').style.display = 'none';
		},
		error : function(xhr, textStatus, errorThrown) {
			alert('Error: ' + errorThrown);
			$(".error1").html(
					"<div>" + textStatus + " (HTTP-" + xhr.status + " / " + errorThrown
							+ ")</div>");
			document.getElementById('loading').style.display = 'none';
		  document.getElementById('overlay').style.display = 'none';
		}
	});
}


function getDisable() {
//"처리 중" 이미지와 배경을 표시
  document.getElementById('loading').style.display = 'block';
  document.getElementById('overlay').style.display = 'block';
  
	let resultMsg1;
	let resultCode1;
	let numOfRows1;
	let pageNo1;
	let totalCount1;

	alert("클릭");
	//입력값 확인
	url = $('#url').val();
	serviceKey = $("#serviceKey").val();
	numOfRows = $("#numOfRows").val();
	pageNo = $("#pageNo").val();
	MobileOS = $("#MobileOS").val();
	MobileApp = $("#MobileApp").val();
	_type = $("#_type").val();
	contentId = $("#contentId").val();

	var myUrl = url + "?serviceKey=인증키&numOfRows=" + numOfRows + "&pageNo="
			+ pageNo + "&MobileOS=" + MobileOS + "&MobileApp=" + MobileApp
			+ "&_type=" + _type + "&contentId=" + contentId;
	$(".url").text(myUrl);
	$.ajax({ 
		url : '/api/API_disable_proxy', // 
		type : 'get',
		contentType : 'application/json; charset=UTF-8',
		dataType : "JSON",
		data : {
			mode:1,
			url : url,
			serviceKey : serviceKey,
			numOfRows : numOfRows,
			pageNo : pageNo,
			contentId: contentId
		},
		success : function(json) {
			alert('Data get successfully!');
			//공공데이타 조회 결과값 표시 
			resultCode1 = json.response.header.resultCode;
			resultMsg1 = json.response.header.resultMsg;
			$(".resultCode1").text("response.header.resultMsg :" + resultCode1);
			$(".resultMsg1").text("response.header.resultMsg :" + resultMsg1);

			if (resultMsg1 == "OK") {

				numOfRows1 = json.response.body.numOfRows;
				pageNo1 = json.response.body.pageNo;
				totalCount1 = json.response.body.totalCount;
				//console.log(numOfRows1,pageNo1,totalCount1);
				$(".numOfRows1").text("response.body.numOfRows :" + numOfRows1);
				$(".pageNo1").text("response.body.pageNo :" + pageNo1);
				$(".totalCount1").text("response.body.totalCount :" + totalCount1);

				items = json.response.body.items.item;
				console.log("response itemJson: ",items);
				var tableBody = $('#ajaxTable');
				$('#ajaxTable').empty();
				var thead =$("<thead><tr>"
										+"<th>CONTENTID         </th>"
				            +"<th>PARKING           </th>"
				            +"<th>ROUTE             </th>"
				            +"<th>PUBLICTRANSPORT   </th>"
				            +"<th>TICKETOFFICE      </th>"
				            +"<th>PROMOTION         </th>"
				            +"<th>WHEELCHAIR        </th>"
				            +"<th>EXIT              </th>"
				            +"<th>ELEVATOR          </th>"
				            +"<th>RESTROOM          </th>"
				            +"<th>AUDITORIUM        </th>"
				            +"<th>ROOM              </th>"
				            +"<th>HANDICAPETC       </th>"
				            +"<th>BRAILEBLOCK       </th>"
				            +"<th>HELPDOG           </th>"
				            +"<th>GUIDEHUMAN        </th>"
				            +"<th>AUDIOGUIDE        </th>"
				            +"<th>BIGPRINT          </th>"
				            +"<th>BRAILEPROMOTION   </th>"
				            +"<th>GUIDESYSTEM       </th>"
				            +"<th>BLINDHANDICAPETC  </th>"
				            +"<th>SIGNGUIDE         </th>"
				            +"<th>VIDEOGUIDE        </th>"
				            +"<th>HEARINGROOM       </th>"
				            +"<th>HEARINGHANDICAPETC</th>"
				            +"<th>STROLLER          </th>"
				            +"<th>LACTATIONROOM     </th>"
				            +"<th>BABYSPARECHAIR    </th>"
				            +"<th>INFANTSFAMILYETC  </th>"
				            +"</tr></thead>");
				tableBody.append(thead);

				$.each(items, function(index, item) { 
					var newRow = $('<tr></tr>');
					newRow.append($('<td></td>').text(item.contentid));
					newRow.append($('<td></td>').text(item.parking));
					newRow.append($('<td></td>').text(item.route));
					newRow.append($('<td></td>').text(item.publictransport));
					newRow.append($('<td></td>').text(item.ticketoffice));
					newRow.append($('<td></td>').text(item.promotion));
					newRow.append($('<td></td>').text(item.wheelchair));
					newRow.append($('<td></td>').text(item.exit));
					newRow.append($('<td></td>').text(item.elevator));		
					newRow.append($('<td></td>').text(item.restroom));		
					newRow.append($('<td></td>').text(item.auditorium));	
					newRow.append($('<td></td>').text(item.room));
					newRow.append($('<td></td>').text(item.handicapetc));		
					newRow.append($('<td></td>').text(item.braileblock));		
					newRow.append($('<td></td>').text(item.helpdog));		
					newRow.append($('<td></td>').text(item.guidehuman));		
					newRow.append($('<td></td>').text(item.audioguide));		
					newRow.append($('<td></td>').text(item.bigprint));		
					newRow.append($('<td></td>').text(item.brailepromotion));		
					newRow.append($('<td></td>').text(item.guidesystem));		
					newRow.append($('<td></td>').text(item.blindhandicapetc));		
					newRow.append($('<td></td>').text(item.signguide));		
					newRow.append($('<td></td>').text(item.videoguide));		
					newRow.append($('<td></td>').text(item.hearingroom));		
					newRow.append($('<td></td>').text(item.hearinghandicapetc));		
					newRow.append($('<td></td>').text(item.stroller));		
					newRow.append($('<td></td>').text(item.lactationroom));		
					newRow.append($('<td></td>').text(item.babysparechair));		
					newRow.append($('<td></td>').text(item.infantsfamilyetc));		

					tableBody.append(newRow);
				});

			}
			document.getElementById('loading').style.display = 'none';
		  document.getElementById('overlay').style.display = 'none';

		},
		error : function(xhr, textStatus, errorThrown) {
			alert('Error: ' + errorThrown);
			$(".error1").html(
					"<div>" + textStatus + " (HTTP-" + xhr.status + " / " + errorThrown
							+ ")</div>");
			document.getElementById('loading').style.display = 'none';
		  document.getElementById('overlay').style.display = 'none';
		}
	});

}

function saveDisable() {
	alert("sending....");
	//"처리 중" 이미지와 배경을 표시
  document.getElementById('loading').style.display = 'block';
  document.getElementById('overlay').style.display = 'block';
	//event.preventDefault();
	// Ajax 
	$.ajax({
		url : '/ajax/insertAPI_disable', // 
		type : 'POST',
		contentType : 'application/json',
		data : JSON.stringify(items),
		//dataType : "JSON",
		success : function(response) {
			alert('Data insert successfully!');
			document.getElementById('loading').style.display = 'none';
		  document.getElementById('overlay').style.display = 'none';
		},
		error : function(xhr, Status, error) {
			alert('Error: ' + error);
			document.getElementById('loading').style.display = 'none';
		  document.getElementById('overlay').style.display = 'none';
		}
	});
}
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header_adm.jsp"%>
<div class="content_section">
	<h1>API_DISABLE(무장애 정보)-contentType 사용안함</h1>
	<hr>
	<div id="form1">
		url:<input id="url" size=90 value="http://apis.data.go.kr/B551011/KorWithService1/detailWithTour1" readonly><br> 
		serviceKey:<input id="serviceKey" size=100 value="KyKlcn82QcUpq39lKg0eLESMZb9SG+PcmYrQWzSAHY7C2CR0JYlhtyO1Ka5Aam6bU0W5KiXHsJq/L9j5y6kbUA=="><br>
		numOfRows:<input id="numOfRows" value="1"><br> 
		pageNo:<input id="pageNo" value="1"><br> 
		MobileOS: <select id="MobileOS">
			<option value="IOS">IOS (아이폰)</option>
			<option value="AND">AND (안드로이드)</option>
			<option value="WIN">WIN (윈도우폰)</option>
			<option value="ETC" selected>ETC</option>
		</select><br> 
		MobileApp: <select id="MobileApp">
			<option value="AppTest">AppTest</option>
		</select><br> <!-- contentTypeId:<input id="contentTypeId" value="12"><br> --> 
		<strong>contentId:</strong><input id="contentId" value='129619'><br>
		_type: 
		<select id="_type">
			<option value="json">json</option>
		</select><br>

		<button type="button" id="getDisable" class="getImage">무장애 정보가져오기(proxy)</button>
		<button type="button" id="saveDisable" class="saveImage">DB 저장</button>
		<button type="button" id="autoDisable" class="autoImage">자동 저장</button>
	</div>

	<div id="content1" class="contentsBox">
		<div class="url"></div>
		<hr>
		<div class="resultCode1">resultCode:</div>
		<div class="resultMsg1">resultMsg:</div>
		<div class="numOfRows1">numOfRows:</div>
		<div class="pageNo1">pageNo:</div>
		<div class="totalCount1">totalCount:</div>
		<div class="error1">error:</div>
		<table id="ajaxTable" border=1></table>
	</div>
	<div id="overlay"></div>
  <img id="loading" src="/resources/dc/image/processing.gif" alt="처리 중...">
</div>	
</body>
</html>