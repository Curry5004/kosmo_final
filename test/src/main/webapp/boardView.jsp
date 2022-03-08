<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>소모임-글 보기</title>
</head>
<style>
	h2 { text-align: center;}
  table { width: 100%;}
  textarea { width: 100%;}
 	#outter {
		display: block;
		width: 30%;
		margin: auto;
	}
</style>
<body>
<section>
<h2>게시판 보기</h2>
<br><br><br>
<div id="outter">
     	<div style="float:right">
		 <fmt:formatDate var="formatRegDate" value="${board.art_reg_date}" pattern="yyyy-MM-dd"/>
		 <fmt:formatDate var="formatModDate" value="${board.art_mod_date}" pattern="yyyy-MM-dd"/>
				&ensp; 조회수: ${board.art_view_cnt }
		 <c:if test="${empty formatModDate }">
				&ensp; 작성일: ${formatRegDate}
		</c:if>
		<c:if test="${not empty formatModDate}">
				&ensp; 작성일: ${formatRegDate}
				&ensp; 수정일: ${formatModDate}
		</c:if>
			</div>
	<table border="1">
	
		<tr>
			<td>제목:${board.art_title}</td>
		</tr>
		<tr>
			<td>
				작성자:${board.art_writer}
			
			</td>
		</tr>
		<tr>
			<td><div style="height: 300px; margin: 10px; display: inline-block">
			
			<a><img src="${board.art_img_path}" width=200 height=200 /> </a>${board.art_content }
			
			</div></td>
		</tr>
	</table>
	<button><a href="getBoardList.do?party_id=1">돌아가기</a></button>
	<button><a href="boardUpdate.jsp">수정</a></button>
	<button><a href="">삭제</a></button>
</div>
</section>
</body>
</html>
