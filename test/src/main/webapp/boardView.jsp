<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
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

<h2>게시판 보기</h2>
<br><br><br>
	
	<input type="hidden" name = "party_id" value="${param.party_id}">
	<div style="float:center">
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
<c:forEach var="comment" items="${commentList}">
		<fmt:formatDate var="formatRegDate" value="${comment.art_comment_reg_date}" pattern="yyyy-MM-dd HH:MM:ss"/>
		 <fmt:formatDate var="formatModDate" value="${comment.art_comment_mod_date}" pattern="yyyy-MM-dd"/>
		<div style="border: 1px solid black">
			<p>${comment.art_comment_writer}</p>
			<p>${comment.art_comment_content}</p>
			<p>${formatRegDate}</p>
			<form action=""></form>
			<a href="modifyBoardComment.do?art_comment_id=${comment.art_comment_id}">수정</a>
			<a href="deleteBoardComment.do?art_comment_id=${comment.art_comment_id}&alb_id=${board.art_id}">삭제</a>
		</div>
	</c:forEach>

	
	<button><a href="boardUpdate.jsp">수정</a></button>
	<button><a href="deleteBoard.do?party_id=1">삭제</a></button>
	_
	
	<button><a href="getBoardList.do?party_id=1">돌아가기</a></button>

</div>

</body>
</html>
