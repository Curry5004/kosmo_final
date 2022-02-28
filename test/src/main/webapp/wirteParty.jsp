<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="wirteParty.do">
		<span>제목 : </span><input type="text" id="title" /> <br /> <span>카테고리 : </span> <select
			name="categorybox" id="categorybox">
			<c:forEach var="i" begin="1" end="10" step="1">
				<option value="categoryType">${i }.${category }</option>
			</c:forEach>
		</select> <br /> <span>MBTI1 : </span> <select name="mbtibox" id="mbtibox">
			<c:forEach var="i" begin="1" end="16" step="1">
				<option value="mbtiType">${i }.${MBTI.MBTI_NAME }</option>
			</c:forEach>
		</select> <br /> <span>MBTI2 : </span> <select name="mbtibox" id="mbtibox">
			<c:forEach var="i" begin="1" end="16" step="1">
				<option value="mbtiType">${i }.${MBTI.MBTI_NAME }</option>
			</c:forEach>
		</select> <br /> <span>MBTI3 : </span> <select name="mbtibox" id="mbtibox">
			<c:forEach var="i" begin="1" end="16" step="1">
				<option value="mbtiType">${i }.${MBTI.MBTI_NAME }</option>
			</c:forEach>
		</select> <br /> <span>MBTI3 : </span> <select name="mbtibox" id="mbtibox">
			<c:forEach var="i" begin="1" end="16" step="1">
				<option value="mbtiType">${i }.${MBTI.MBTI_NAME }</option>
			</c:forEach>
		</select> <br /> <input type="text" value="" />

	</form>

</body>
</html>