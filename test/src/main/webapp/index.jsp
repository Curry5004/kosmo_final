<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>
</head>
<body>
	<h1>인덱스</h1>
	<a href="getuserList.do">회원 조회</a>
	<a href="registry.do">회원가입</a>
	<a href="writeParty.do">소모임 작성</a>	
	<a href="login.do">로그인</a>	
	<a href="logout.do">로그아웃</a>	
	<!-- 세션 테스트용 
	${sessionScope.user_Id}님이 로그인 중입니다. 
	다른 페이지 넘어가도 잘됨
	-->
</body>
</html>	