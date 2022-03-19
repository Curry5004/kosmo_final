<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세페이지 -모달창 활용할 jsp </title>
</head>

<body>
<jsp:include page="Nav.jsp"/>

<div class="container">
<div class="row">
<div class="btn-group">
  <button type="button" class="btn btn-primary" onclick="location.href='getParty.do?PARTY_ID=${param.party_id}'">소개글</button>
  <button type="button" class="btn btn-primary" onclick="location.href='getBoardList.do?party_id=${param.party_id}'">게시판</button>
  <button type="button" class="btn btn-primary" onclick="location.href='getAlbumList.do?party_id=${param.party_id}'">앨범</button>
  <button type="button" class="btn btn-primary" onclick="location.href='calendar.do?party_id=${param.party_id}'">일정</button>
  <button type="button" class="btn btn-primary" onclick="location.href=''">채팅</button>
  <c:if test="${party.PARTY_CREATOR eq user.user_Id}">
  <button type="button" class="btn btn-primary" onclick="location.href='getPartyUserList.do?PARTY_ID=${param.PARTY_ID}'">회원관리</button>
  </c:if>
</div>
</div>
</div>

<section>
<c:forEach items="${SchDetail}" var="sDetail">
 <c:if test="${pages.hasBoard()}">
<ul class="pagination">
<c:if test="${pages.startPage > pages.pageSize}">
  <li class="page-item"><a class="page-link" href="calendar2.do?year=${param.year}&month=${param.month}&day=${param.day}&party_id=${param.party_id }&pageNo=${pages.startPage - pages.pageSize}">&#9664;</a></li>
  </c:if>
 <!--  ${sDetail.sch_title }-->
 <c:if test="${pages.endPage < pages.totalPages }" >
  <li class="page-item"><a class="page-link" href="calendar2.do?year=${param.year}&month=${param.month}&day=${param.day}&party_id=${param.party_id }&pageNo=${pages.startPage + pages.pageSize}">&#9658;</a></li>
  </c:if>  
</ul>
</c:if>

	<div class="container pt-5">
		<div class="row">
			<div class="col-sm">
			<img src="" alt="맵" width="100px" height="100px"/>
			</div>
			
			<div class="col-sm">
			
				<ul class="list-group">
				<li class="list-group-item list-group-item-secondary "> 정모이름: ${sDetail.sch_title }</li>
				 <li class="list-group-item list-group-item-secondary ">주최자: ${sDetail.sch_writer}</li>
				  <li class="list-group-item list-group-item-secondary ">위치: ${sDetail.sch_location}</li>
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
			<div class="mt-4 p-5 bg-primary text-white rounded">
				<p> ${sDetail.sch_content}</p>
			</div>
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
	
	
	
</section>
<jsp:include page="footer.jsp"/>

</body>
</html>