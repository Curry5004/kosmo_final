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
<title>소모임- 게시글 리스트</title>
</head>

<style>
	#imgArticle {
		float: left;
	}
	#like{
	  
		color : red;
		position: relative; bottom: 50px; right: 50px;
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
  <button type="button" class="btn btn-primary" onclick="location.href=''">채팅</button>
  <c:if test="${party.PARTY_CREATOR eq user.user_Id}">
  <button type="button" class="btn btn-primary" onclick="location.href='getPartyUserList.do?PARTY_ID=${param.party_id}'">회원관리</button>
  </c:if>
</div>
</div>
</div>
	<div id="imgArticle">
	<c:forEach items="${albumList}" var="album">
			<a href="getAlbum.do?alb_id=${album.alb_id}">
			 <img src="${album.alb_img_path}" width=300 height=300 />
			<span id="like">${album.likeCnt}</span>
			</a>
	</c:forEach> 
	</div>
<section>
	<div>
	<c:if test="${pages.hasBoard()}">
	
	<table>
		<tr>
			<td colspan="4">
				<c:if test ="${pages.startPage > pages.pageSize}">
				<a href="getAlbumList.do?party_id=1&pageNo=${pages.startPage - pages.pageSize }">[이전]</a>
				</c:if>
			<c:forEach var="pNo" 
					begin="${pages.startPage}"
					end="${pages.endPage}">
			<a href="getAlbumList.do?party_id=1&pageNo=${pNo}">[${pNo}]</a>
			</c:forEach>
			<c:if test="${pages.endPage < pages.totalPages }" >
			<a href="getAlbumList.do?party_id=1&pageNo=${pages.startPage + pages.pageSize }"> [다음]</a>
			</c:if>
			</td>
		</tr>
	</table>
	
	</c:if>
	</div>
	<div>
	
	</div>
	

		<div class="col text-right">
	<button class="btn btn-primary" onclick="location.href='writeAlbum.jsp?party_id=${param.party_id}';">앨범작성</button>
	</div>
	

	
</section>

<footer>
</footer>
</body>
</html>