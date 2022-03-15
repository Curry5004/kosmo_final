<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	.article{
		border: 1px black solid;
		display: inline-block;
		width: 280px;
		height: 250px;
	
</style>
<style type="text/css">
	 a { text-decoration: none; color: black; }
    a:visited { text-decoration: none; }
    a:hover { text-decoration: none; }
    a:focus { text-decoration: none; }
    a:hover, a:active { text-decoration: none; }
</style>
<!-- 네비 예시입니다. -->
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- #BOOTSTRAP 5.1.3 합쳐지고 최소화된 최신 CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- #BOOTSTRAP 5.1.3 합쳐지고 최소화된 최신 CSS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
<!-- 네비 예시입니다. -->

<body>
	<jsp:include page="Nav.jsp"/>
	<c:choose>
	
	<c:when test="${sessionScope.user.user_Id==null}">
	<h3>이런! 로그인을 안하셨군요</h3>
	</c:when>
	
	<c:when test="${not empty bestList}">
	<h1>당신과 같은 MBTI가 많은 모임!</h1>
	<div>
	
	<c:forEach items="${bestList}" var="best">
		<div class="article">
		<a href="getParty.do?PARTY_ID=${best.PARTY_ID}">
			<img src="${best.PARTY_TUMB_PATH }" alt="이미지가 없네요..." width=270px  height=200px/>
			<p>${best.PARTY_TITLE }</p>
		</a>
		</div>
	</c:forEach>
	</div>
	</c:when>
	<c:when test="${empty bestList}">
	<h3>추천 모임이 없습니다</h3>
	</c:when>
	</c:choose>
</body>
</html>