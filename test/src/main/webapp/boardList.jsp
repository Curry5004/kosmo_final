 	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커넥트MBTI</title>
</head>

<style>
	.pagination{
	justify-content :center;
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
  <button type="button" class="btn btn-primary" onclick="location.href='getPartyUserList.do?PARTY_ID=${param.party_id}'">회원관리</button>
  </c:if>
</div>
</div>
</div>
<br><br>
<section>
  <ul class="list-group">

	<c:forEach items="${boardList}" var="board">
		<div style="display:flex;">
			<div class="col text-left" ><a href="getBoard.do?art_id=${board.art_id}">
				&ensp; <img src="${board.art_img_path}" width=200 height=200 />
			</a></div>
			
			<div class="col text-left"><a href="getBoard.do?art_id=${board.art_id}">
			
				&ensp;${board.art_title}</a></div>
	
			<div class ="col text-right">	
		 <fmt:formatDate var="formatRegDate" value="${board.art_reg_date}" pattern="yyyy-MM-dd"/>
		 <fmt:formatDate var="formatModDate" value="${board.art_mod_date}" pattern="yyyy-MM-dd"/>
				
				&ensp; 작성자: ${board.art_user_name}
				&ensp; 조회수: ${board.art_view_cnt }
		 <c:if test="${empty formatModDate }">
				&ensp; 작성일: ${formatRegDate}
		</c:if>
		<c:if test="${not empty formatModDate}">
				&ensp; 작성일: ${formatRegDate}
				&ensp; 수정일: ${formatModDate}
		</c:if>
			</div>
		</div>
		<hr />
	</c:forEach>
	</ul>
	<c:if test="${pages.hasBoard()}">

            <tr>
	        <ul class="pagination" >
           
				<c:if test ="${pages.startPage > pages.pageSize}">
				  <li class="page-item"><a class="page-link" href="getBoardList.do?party_id=${param.party_id}&pageNo=${pages.startPage - pages.pageSize }">[이전]</a>
				</c:if>
			<c:forEach var="pNo" 
					begin="${pages.startPage}"
					end="${pages.endPage}">
			 <li class="page-item"><a class="page-link"a href="getBoardList.do?party_id=${param.party_id}&pageNo=${pNo}">${pNo}</a>
			</c:forEach>
			<c:if test="${pages.endPage < pages.totalPages }" >
			 <li class="page-item"><a class="page-link"a href="getBoardList.do?party_id=${param.party_id}&pageNo=${pages.startPage + pages.pageSize }"> [다음]</a>
			</c:if>
		   </ul>
		</tr>
	
	</c:if>
	
	
	
	<div class="col text-right">
	<button class="btn btn-primary" onclick ="location.href='boardWrite.jsp?party_id=${param.party_id}';">게시글 쓰기</button>
	</div>
	
</section>
<footer>
<jsp:include page ="footer.jsp"/>
</footer>
</body>
</html>