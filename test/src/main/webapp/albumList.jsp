<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<header>
</header>
<body>
	
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
	<button onclick="location.href='writeAlbum.jsp?party_id=${param.party_id}';">게시글 쓰기 </button>
	<c:if test="${empty albumList }">
		<button onclick="location.href='writeAlbum.jsp?party_id=${param.party_id}';">첫 게시물 작성</button>
	</c:if>
	</div>
	
	
	<div id="imgArticle">
	<c:forEach items="${albumList}" var="album">
			<a href="getAlbum.do?alb_id=${album.alb_id}">
			 <img src="${album.alb_img_path}" width=300 height=300 />
			<span id="like">${album.likeCnt}</span>
			</a>
	</c:forEach> 
	</div>
	
	

	
</section>

<footer>
</footer>
</body>
</html>