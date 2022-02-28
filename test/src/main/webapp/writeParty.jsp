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
		<span>제목 : </span><input type="text" name="title" /> <br /> <span>카테고리
			: </span> <select name="categorybox" id="categorybox">
			<c:forEach var="i" begin="1" end="10" step="1">
				<option value="categoryType">${i }.${category }</option>
			</c:forEach>
		</select> <br /> 
		<span>MBTI1 : </span> <select name="mbtibox" id="mbtibox">
			<c:forEach var="i" begin="1" end="${MbtiList.size() }" step="1">
				<option value="mbtiType">${i }.${MbtiList[i-1].getMBTI_NAME() }</option>
			</c:forEach>
		</select> <br />
		<span>MBTI2 : </span> <select name="mbtibox" id="mbtibox">
			<c:forEach var="i" begin="1" end="${MbtiList.size() }" step="1">
				<option value="mbtiType">${i }.${MbtiList[i-1].getMBTI_NAME() }</option>
			</c:forEach>
		</select> <br />
		<span>MBTI3 : </span> <select name="mbtibox" id="mbtibox">
			<c:forEach var="i" begin="1" end="${MbtiList.size() }" step="1">
				<option value="mbtiType">${i }.${MbtiList[i-1].getMBTI_NAME() }</option>
			</c:forEach>
		</select> <br />
		<span>MBTI4 : </span> <select name="mbtibox" id="mbtibox">
			<c:forEach var="i" begin="1" end="${MbtiList.size() }" step="1">
				<option value="mbtiType">${i }.${MbtiList[i-1].getMBTI_NAME() }</option>
			</c:forEach>
		</select> <br />
		 <span>선호위치 : </span> <input type="text" name="location" /><br />
		<span>이미지 삽입 </span><br /> <span>멤버 정원 : </span> <input type="text"
			name="party_maximum" /><br />

		<textarea name="" id="" cols="30" rows="10"></textarea>
		<div>
			<h1>결제 모듈이 들어갈 곳 입니다</h1>
		</div>
		<input type="submit" value="생성" />
	


	</form>


</body>
</html>