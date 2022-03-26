<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커넥트MBTI</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;900&display=swap" rel="stylesheet">
</head>
<style>

.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}
.container pt-5{
	justify-content :center;
}
body{
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
<body>
<jsp:include page="Nav.jsp"/>

<div class="container">
<div class="row">
<div class="btn-group">
  <button type="button" class="btn btn-primary" onclick="location.href='getParty.do?PARTY_ID=${param.party_id}'">소개글</button>
  <button type="button" class="btn btn-primary" onclick="location.href='getBoardList.do?party_id=${param.party_id}'">게시판</button>
  <button type="button" class="btn btn-primary" onclick="location.href='getAlbumList.do?party_id=${param.party_id}'">앨범</button>
  <button type="button" class="btn btn-primary" onclick="location.href='calendar.do?party_id=${param.party_id}'">일정</button>
  <button type="button" class="btn btn-primary" onclick="location.href='chatting.do?party_id=${param.party_id }'">채팅</button>
  <c:if test="${party.PARTY_CREATOR eq user.user_Id}">
  <button type="button" class="btn btn-primary" onclick="location.href='getPartyUserList.do?PARTY_ID=${param.PARTY_ID}'">회원관리</button>
  </c:if>
</div>
</div>
</div>
<c:forEach items="${SchDetail}" var="sDetail">

<div class="container pt-5">
<div class="row" >
<div class="col-sm-3" style="float:none; margin:0 auto">

 <c:if test="${pages.hasBoard()}">
<ul class="pagination">
<c:if test="${pages.startPage > pages.pageSize}">
  <li class="page-item"><a class="page-link" href="calendar2.do?year=${param.year}&month=${param.month}&day=${param.day}&party_id=${param.party_id }&pageNo=${pages.startPage - pages.pageSize}">&#9664;</a></li>
  </c:if>
 <!--  ${sDetail.sch_title }-->
 <c:if test="${pages.endPage < pages.totalPages }" >
  <li class="page-item"><a class="page-link" href="calendar2.do?year=${param.year}&month=${param.month}&day=${param.day}&party_id=${param.party_id }&pageNo=${pages.startPage + pages.pageSize}">&#9654;</a></li>
  </c:if>  
</ul>
</c:if>

</div>
</div>
</div>

	<div class="container">
		<div class="row">
			<div class="col-sm">
			
			
			<div class="map_wrap">
						<div id="map"
							style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

						
					</div>
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8159dce1cf59e2e917f7411a46d56597&libraries=services"></script>
<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = { 
		    center: new kakao.maps.LatLng(<c:out value="${sDetail.location_y}"/>, <c:out value="${sDetail.location_x+0.0034}"/>), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		};
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		//마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng((<c:out value="${sDetail.location_y}"/>), <c:out value="${sDetail.location_x}"/>); 
		
		//마커를 생성합니다
		var marker = new kakao.maps.Marker({
		position: markerPosition
		});
		
		//마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		var iwContent = '<div style="padding-right:15px; height : 40px; text-align:center;"><c:out value="${sDetail.location_name}"/></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    content : iwContent,
	    removable : iwRemoveable
	});
	infowindow.open(map, marker);  
	// 마커에 클릭이벤트를 등록합니다
	kakao.maps.event.addListener(marker, 'click', function() {
	      // 마커 위에 인포윈도우를 표시합니다
	      infowindow.open(map, marker);  
	});			
		
					
</script>
			</div>
			
			<div class="col-sm">
			
				<ul class="list-group">
				<li class="list-group-item list-group-item-secondary "> 정모이름: ${sDetail.sch_title }</li>
				 <li class="list-group-item list-group-item-secondary ">주최자: ${sDetail.sch_writer}</li>
				 <li class="list-group-item list-group-item-secondary">장소 이름: ${sDetail.location_name}</li>
					<li class="list-group-item list-group-item-secondary">주소 : ${sDetail.location_address}</li>
					<li class="list-group-item list-group-item-secondary ">참가인원:  ${current_count} / ${sDetail.sch_member_count }</li>
				     <c:set var="condition" value="false"/>
				            <c:forEach items="${cntList}" var="cnt" varStatus="status">
				   <c:if test="${cnt.user_id == sessionScope.user.user_Id}">

				    <c:set var="condition" value="true"/>
				    </c:if>
				    </c:forEach>      
				</ul>
				
				
					<div class="btn-group">
				   <c:if test="${condition eq false}">
			      <c:if test="${current_count < sDetail.sch_member_count }"> 
			
  					<button type="button" class="btn btn-primary" onclick="location.href='cntUp.do?user_id=${sessionScope.user.user_Id}&party_id=${sDetail.party_id}&sch_id=${sDetail.sch_id}'">참가하기</button>
  					</c:if>
					</c:if>
					<c:if test="${condition eq true }">
  					<button type="button" class="btn btn-primary" onclick="location.href='cntDown.do?user_id=${sessionScope.user.user_Id}&party_id=${sDetail.party_id}&sch_id=${sDetail.sch_id}'"> 취소하기 </button>
  					</c:if>
  					<c:if test="${sDetail.user_id==sessionScope.user.user_Id||leader.USER_ID==sessionScope.user.user_Id}">
  					<button type="button" class="btn btn-primary" onclick="location.href='deleteSch.do?&sch_id=${sDetail.sch_id}&year=${param.year}&month=${param.month}&day=${param.day}&party_id=${param.party_id}';">정모삭제하기    </button>
  					</c:if>
  				</div>
			</div>
			
		</div>
	</div>
	
	<div class="container pt-5">
		<div class="row">
			
				<textarea class="form-control" rows="5" id="comment" name="text" readonly="readonly">${sDetail.sch_content}</textarea>
			
		</div>
	</div>
	
	<div class="container pt-5">
		<div class="row">
			<ul	class="list-group">
				<li class="list-group-item list-group-item-secondary">${sDetail.sch_note}</li>
			</ul>
		</div>
	</div>
	
	</c:forEach>
	
	
	

<jsp:include page="footer.jsp"/>

</body>
</html>