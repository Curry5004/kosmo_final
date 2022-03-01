<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="wirteParty.do" method="POST" enctype="multipart/form-data">
		<span>제목 : </span><input type="text" name="PARTY_TITLE" /> <br /> 
		<span>카테고리 : </span> <select name="CATEGORY_NAME">
			<c:forEach var="i" begin="1" end="${CategoryList.size() }" step="1">
				<option value="${CategoryList[i-1].getCategory_name()}">${CategoryList[i-1].getCategory_name() }</option>
			</c:forEach>
		</select> <br />
		
		<span>MBTI1 : </span> <select name="PARTY_PRE_MBTI1">
			<c:forEach var="i" begin="1" end="${MbtiList.size() }" step="1">
				<option value="${MbtiList[i-1].getMBTI_NAME() }">${MbtiList[i-1].getMBTI_NAME() }</option>
			</c:forEach>
		</select> <br />
		<span>MBTI2 : </span> <select name="PARTY_PRE_MBTI2">
			<c:forEach var="i" begin="1" end="${MbtiList.size() }" step="1">
				<option value="${MbtiList[i-1].getMBTI_NAME() }">${MbtiList[i-1].getMBTI_NAME() }</option>
			</c:forEach>
		</select> <br />
		<span>MBTI3 : </span> <select name="PARTY_PRE_MBTI3">
			<c:forEach var="i" begin="1" end="${MbtiList.size() }" step="1">
				<option value="${MbtiList[i-1].getMBTI_NAME() }">${MbtiList[i-1].getMBTI_NAME() }</option>
			</c:forEach>
		</select> <br />
		<span>MBTI4 : </span> <select name="PARTY_PRE_MBTI4">
			<c:forEach var="i" begin="1" end="${MbtiList.size() }" step="1">
				<option value="${MbtiList[i-1].getMBTI_NAME() }">${MbtiList[i-1].getMBTI_NAME() }</option>
			</c:forEach>
		</select> <br />
		 <span>선호위치 : </span> <input type="text" name="PARTY_LOCATION" /><br />
		<span>이미지 삽입 </span> <input type="file" name="uploadFile"/><<br /> <span>멤버 정원 : </span> <input type="text"
			name="PARTY_MAXIMUM" /><br />

		<textarea name="PARTY_INTRODUCE" cols="30" rows="10" ></textarea>
		<div>
			<h1>결제 모듈이 들어갈 곳 입니다</h1>
		</div>
		<input type="submit" value="생성" />
	


	</form>


</body>
</html>