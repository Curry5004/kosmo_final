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
	<a href="getBoardList.do?party_id=1">게시글 조회</a>
	<a href="registry_form.do">회원가입</a>
	<a href="writeParty.do">소모임 작성</a>	
	<a href="login.do">로그인</a>	
	<a href="logout.do">로그아웃</a>	
	<!-- 세션 테스트용 
	${sessionScope.user_Id}님이 로그인 중입니다. 
	다른 페이지 넘어가도 잘됨
	-->
	<a href="getParty.do?PARTY_ID=2">소모임상세글</a>
	<a href="boardWrite.jsp">게시글 작성</a>
	<a href="writeAlbum.jsp?party_id=1">앨범 작성</a>
	<br/>
	<a href="mypage/getUserInfo.do">회원 정보 가져오기</a>
	
</body>
</html>