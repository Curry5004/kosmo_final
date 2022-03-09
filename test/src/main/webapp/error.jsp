<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>에러페이지</title>
</head>
<body>
<c:forEach var="comment" items="${commentList}">
		<fmt:formatDate var="formatRegDate" value="${comment.art_comment_reg_date}" pattern="yyyy-MM-dd HH:MM:ss"/>
		 <fmt:formatDate var="formatModDate" value="${comment.art_comment_mod_date}" pattern="yyyy-MM-dd"/>
		<div style="border: 1px solid black">
			<p>${comment.art_comment_write}</p>
			<p>${comment.art_comment_content}</p>
			<p>${formatRegDate}</p>
			<form action=""></form>
			<a href="modifyBoardComment.do?art_comment_id=${comment.art_comment_id}">수정</a>
			<a href="deleteBoardComment.do?art_comment_id=${comment.art_comment_id}&art_id=${board.art_id}">삭제</a>
		</div>
	</c:forEach>
	<p>검색할수 없는글입니다.</p>
	<a href="index.jsp">메인으로 돌아가기.</a>
</body>
</html>