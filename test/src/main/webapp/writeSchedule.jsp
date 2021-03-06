<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>스케쥴 작성</title>
</head>

<script>
function dateSelect() {
	var div = document.getElementById("date");
	var modalInput = document.getElementById("modalInput");
	div.innerHTML = modalInput.value;
}
function preSubmit(){
	var titleDummy = document.getElementById("titleDummy");
	var trueTitle = document.getElementById("trueTitle");
	trueTitle.value=titleDummy.value;
	console.log(trueTitle.value);
}
function check() {
	var f = document.sch_form;
	if (f.location_address.value == "") {
		alert("지도에서 주소를 입력해주세요");
		f.location_address.focus();
		return false;
	}
	if (f.content.value == "") {
		alert("내용을 입력해주세요");
		f.content.focus();
		return false;
	}
	if (f.note.value == "") {
		alert("메모를 입력해주세요");
		f.note.focus();
		return false;
	}
	
	if (f.location_x.value == "") {
		alert("지도에서 주소를 입력해주세요");
		f.location_x.focus();
		return false;
	}
	
	if (f.location_y.value == "") {
		alert("지도에서 주소를 입력해주세요");
		f.location_y.focus();
		return false;
	}
	
	if (f.trueTitle.value == "") {
		alert("제목을 입력해주세요");
		var titleDummy = document.getElementById("titleDummy");
		titleDummy.focus();
		return false;
	}
	if (isNaN(f.member_count.value)) {
		alert("참가인원수를 골라주세요");
		f.member_count.focus();
		return false;
	}
	
	if (document.getElementById("date").innerHTML == "") {
		alert("날짜를 입력해주세요");
		return false;
	}
	
	var now = new Date();
	var date1 = new Date(document.getElementById("date").innerHTML);
	if (date1 < now) {
		alert("일정은 다음날부터 잡을 수 있습니다.");
		return false;
	}
}
</script>

<style>
#date {
border: 1px solid black;
width: 10%;
height: 25px;
text-align: center;
}
.map_wrap, .map_wrap * {
margin: 0;
padding: 0;
font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
font-size: 12px;
}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
color: #000;
text-decoration: none;
}
.map_wrap {
position: relative;
width: 100%;
height: 500px;
}
#menu_wrap {
position: absolute;
top: 0;
left: 0;
bottom: 0;
width: 250px;
margin: 10px 0 30px 10px;
padding: 5px;
overflow-y: auto;
background: rgba(255, 255, 255, 0.7);
z-index: 1;
font-size: 12px;
border-radius: 10px;
}
.bg_white {
background: #fff;
}
#menu_wrap hr {
display: block;
height: 1px;
border: 0;
border-top: 2px solid #5F5F5F;
margin: 3px 0;
}
#menu_wrap .option {
text-align: center;
}
#menu_wrap .option p {
margin: 10px 0;
}
#menu_wrap .option button {
margin-left: 5px;
}
#placesList li {
list-style: none;
}
#placesList .item {
position: relative;
border-bottom: 1px solid #888;
overflow: hidden;
cursor: pointer;
min-height: 65px;
}
#placesList .item span {
display: block;
margin-top: 4px;
}
#placesList .item h5, #placesList .item .info {
text-overflow: ellipsis;
overflow: hidden;
white-space: nowrap;
}
#placesList .item .info {
padding: 10px 0 10px 55px;
}
#placesList .info .gray {
color: #8a8a8a;
}
#placesList .info .jibun {
padding-left: 26px;
background:
	url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
	no-repeat;
}
#placesList .info .tel {
color: #009900;
}
#placesList .item .markerbg {
float: left;
position: absolute;
width: 36px;
height: 37px;
margin: 10px 0 0 10px;
background:
	url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
	no-repeat;
}
#placesList .item .marker_1 {
background-position: 0 -10px;
}
#placesList .item .marker_2 {
background-position: 0 -56px;
}
#placesList .item .marker_3 {
background-position: 0 -102px
}
#placesList .item .marker_4 {
background-position: 0 -148px;
}
#placesList .item .marker_5 {
background-position: 0 -194px;
}
#placesList .item .marker_6 {
background-position: 0 -240px;
}
#placesList .item .marker_7 {
background-position: 0 -286px;
}
#placesList .item .marker_8 {
background-position: 0 -332px;
}
#placesList .item .marker_9 {
background-position: 0 -378px;
}
#placesList .item .marker_10 {
background-position: 0 -423px;
}
#placesList .item .marker_11 {
background-position: 0 -470px;
}
#placesList .item .marker_12 {
background-position: 0 -516px;
}
#placesList .item .marker_13 {
background-position: 0 -562px;
}
#placesList .item .marker_14 {
background-position: 0 -608px;
}
#placesList .item .marker_15 {
background-position: 0 -654px;
}
#pagination {
margin: 10px auto;
text-align: center;
}
#pagination a {
display: inline-block;
margin-right: 10px;
}
#pagination .on {
font-weight: bold;
cursor: default;
color: #777;
}
</style>

<body>
<jsp:include page="Nav.jsp" />

<div class="container">
	<div class="row">
		<div class="btn-group">
			<button type="button" class="btn btn-primary"
				onclick="location.href='getParty.do?PARTY_ID=${param.party_id}'">소개글</button>
			<button type="button" class="btn btn-primary"
				onclick="location.href='getBoardList.do?party_id=${param.party_id}'">게시판</button>
			<button type="button" class="btn btn-primary"
				onclick="location.href='getAlbumList.do?party_id=${param.party_id}'">앨범</button>
			<button type="button" class="btn btn-primary"
				onclick="location.href='calendar.do?party_id=${param.party_id}'">일정</button>
			<button type="button" class="btn btn-primary"
				onclick="location.href=''">채팅</button>
			<c:if test="${party.PARTY_CREATOR eq user.user_Id}">
				<button type="button" class="btn btn-primary"
					onclick="location.href='getPartyUserList.do?PARTY_ID=${param.party_id}'">회원관리</button>
			</c:if>
		</div>
	</div>
</div>



<div class="container pt-5">
	<div class="row">
		<div class="mb-3 mt-3">
			
				<label for="email" class="form-label">제목 :</label> <input
					class="form-control" type="text" placeholder="제목을 작성해주세요."
					name="sch_title" id="titleDummy" /> 
				<label for="email" class="form-label">위치 :</label>
				<div class="map_wrap">
					<div id="map"
						style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

					<div id="menu_wrap" class="bg_white">
						<div class="option">
							<div>
								<form onsubmit="searchPlaces(); return false;">
									키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15">
									<button type="submit">검색하기</button>
								</form>
							</div>
						</div>
						<hr>
						<ul id="placesList"></ul>
						<div id="pagination"></div>
					</div>
				</div>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1c6ef14c76df7571d654fbbc97b66b63&libraries=services"></script>

<script>
		// 마커를 담을 배열입니다
		var markers = [];
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();  
		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		// 키워드로 장소를 검색합니다
		searchPlaces();
		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {
		    var keyword = document.getElementById('keyword').value;
		    if (!keyword.replace(/^\s+|\s+$/g, '')) {
		        alert('키워드를 입력해주세요!');
		        return false;
		    }
		    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		    ps.keywordSearch( keyword, placesSearchCB); 
		}
		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
		        // 정상적으로 검색이 완료됐으면
		        // 검색 목록과 마커를 표출합니다
		        displayPlaces(data);
		        // 페이지 번호를 표출합니다
		        displayPagination(pagination);
		    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
		        alert('검색 결과가 존재하지 않습니다.');
		        return;
		    } else if (status === kakao.maps.services.Status.ERROR) {
		        alert('검색 결과 중 오류가 발생했습니다.');
		        return;
		    }
		}
		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {
		    var listEl = document.getElementById('placesList'), 
		    menuEl = document.getElementById('menu_wrap'),
		    fragment = document.createDocumentFragment(), 
		    bounds = new kakao.maps.LatLngBounds(), 
		    listStr = '';
		    
		    // 검색 결과 목록에 추가된 항목들을 제거합니다
		    removeAllChildNods(listEl);
		    // 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
		    
		    for ( let i=0; i<places.length; i++ ) {
		        // 마커를 생성하고 지도에 표시합니다
		        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
		            marker = addMarker(placePosition, i), 
		            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        bounds.extend(placePosition);
		        // 마커와 검색결과 항목에 mouseover 했을때
		        // 해당 장소에 인포윈도우에 장소명을 표시합니다
		        // mouseout 했을 때는 인포윈도우를 닫습니다
		        (function(marker, title) {
		            kakao.maps.event.addListener(marker, 'mouseover', function() {
		                displayInfowindow(marker, title);
		            });
		            kakao.maps.event.addListener(marker, 'mouseout', function() {
		                infowindow.close();
		            });
		            
		            kakao.maps.event.addListener(marker, 'click', function() {
		            	location_address = document.getElementById('location_address');
		            	location_name = document.getElementById('location_name');
		            	location_x = document.getElementById('location_x');
		            	location_y = document.getElementById('location_y');
		            	location_name.value=places[i].road_address_name;
		            	location_address.value=places[i].place_name;
		            	location_x.value=places[i].x;
		            	location_y.value=places[i].y;
		            	});
		            itemEl.onmouseover =  function () {
		                displayInfowindow(marker, title);
		            };
		            itemEl.onmouseout =  function () {
		                infowindow.close();
		            };
		            itemEl.onclick =  function () {
		            	location_address = document.getElementById('location_address');
		            	location_name = document.getElementById('location_name');
		            	location_x = document.getElementById('location_x');
		            	location_y = document.getElementById('location_y');
		            	location_name.value=places[i].road_address_name;
		            	location_address.value=places[i].place_name;
		            	location_x.value=places[i].x;
		            	location_y.value=places[i].y;
		            };
		            
		            marker.onclick =  function () {
		            	
		            };
		            
		        })(marker, places[i].place_name);
		        fragment.appendChild(itemEl);
		    }
		    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
		    listEl.appendChild(fragment);
		    menuEl.scrollTop = 0;
		    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		    map.setBounds(bounds);
		}
		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {
		    var el = document.createElement('li'),
		    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
		                '<div class="info">' +
		                '   <h5>' + places.place_name + '</h5>';
		    if (places.road_address_name) {
		        itemStr += '    <span>' + places.road_address_name + '</span>' +
		                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
		    } else {
		        itemStr += '    <span>' +  places.address_name  + '</span>'; 
		    }
		                 
		      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
		                '</div>';           
		    el.innerHTML = itemStr;
		    el.className = 'item';
		    return el;
		}
		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
		    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
		        imgOptions =  {
		            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
		            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker = new kakao.maps.Marker({
		            position: position, // 마커의 위치
		            image: markerImage 
		        });
		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
		    
		    
		    return marker;
		}
		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}
		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
		    var paginationEl = document.getElementById('pagination'),
		        fragment = document.createDocumentFragment(),
		        i; 
		    // 기존에 추가된 페이지번호를 삭제합니다
		    while (paginationEl.hasChildNodes()) {
		        paginationEl.removeChild (paginationEl.lastChild);
		    }
		    for (i=1; i<=pagination.last; i++) {
		        var el = document.createElement('a');
		        el.href = "#";
		        el.innerHTML = i;
		        if (i===pagination.current) {
		            el.className = 'on';
		        } else {
		            el.onclick = (function(i) {
		                return function() {
		                    pagination.gotoPage(i);
		                }
		            })(i);
		        }
		        fragment.appendChild(el);
		    }
		    paginationEl.appendChild(fragment);
		}
		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
		    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
		    infowindow.setContent(content);
		    infowindow.open(map, marker);
		    
		}
		 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {   
		    while (el.hasChildNodes()) {
		        el.removeChild (el.lastChild);
		    }
		}
</script>			
<form action="insertSchedule.do" method="POST" name="sch_form" onsubmit="return check()">
				<br /><br /><p>장소 이름</p>
				<input type="hidden" name="sch_writer" id="sch_writer" value=${sessionScope.user.name }> 
					<input type="hidden" name="user_id" value=${sessionScope.user.user_Id }>
				<input class="form-control" type="text" placeholder="약속장소를 지도에서 검색해주세요"
					name="location_address" id="location_address" /> <br /> 
					<p>장소 주소</p>
				<input class="form-control" type="text" placeholder="장소를 입력해주세요."
					name="location_name" id="location_name" /> <br /> 
				<input type="hidden" id="location_x" name="location_x"/>
				<input type="hidden" id="location_y" name="location_y"/>
				<div id="date"></div>
				<button type="button" class="btn btn-primary"
					data-bs-toggle="modal" data-bs-target="#myModal">모임날짜 정하기
				</button>
				<input type="hidden" name="sch_title" id="trueTitle"/>
				<!-- The Modal -->
				<div class="modal" id="myModal">
					<div class="modal-dialog">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">날짜를 선택해주세요</h4>
								<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
							</div>

							<!-- Modal body -->
							<div class="modal-body">
								<input class="form-control" type="Date" name="sch_date"
									id="modalInput" />
							</div>

							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-danger"
									data-bs-dismiss="modal" onclick="dateSelect()">확인</button>
							</div>

						</div>
					</div>
				</div>

				<br /> <br /> <select class="form-select" id="member_count"
					name="sch_member_count">
					<option value="null">-참가인원수-</option>
					<%
						for (int i = 1; i <= 10; i++) {
					%>
					<option value="<%=i%>"><%=i + "명"%></option>
					<%
						}
					%>
				</select> <br /> <br />


				<textarea class="form-control" cols="50" rows="10"
					placeholder="내용을 작성해주세요." id="content" name="sch_content"></textarea>
				<br /> <br /> 
				<input class="form-control" type="text"
					placeholder="간단한 메모는 여기에~!" name="sch_note" id="note"/> <br /> <br /> <input
					class="btn btn-primary" type="submit" value="정모 생성하기" onclick="preSubmit()"/> <input
					type="hidden" name="party_id" value="${param.party_id }" />
					

			</form>
		</div>
	</div>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>