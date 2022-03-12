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
	<h1>${sessionScope.user.user_Id}</h1>
	<a href="getBoardList.do?party_id=1">게시글 조회</a>
	<a href="registry_form.do">회원가입</a>
	<a href="writeParty.do">소모임 작성</a>	
	<a href="login.do">로그인</a>	
	<a href="logout.do">로그아웃</a>	
	
	<a href="getParty.do?PARTY_ID=1">소모임상세글</a>
	<a href="writeSchedule.jsp">스케쥴 생성</a>
	<a href="boardWrite.jsp">게시글 작성</a>
	<a href="writeAlbum.jsp?party_id=1">앨범 작성</a>
	
	<a href="partySearch.jsp">소모임 검색 예시</a>
	<a href="getAlbumList.do?party_id=1">앨범목록</a>
	<a href="calendar.do?party_id=1">스케줄 리스트</a>
	
	<br/>
	<a href="mypage/getUserInfo.do">회원 정보 가져오기</a>
	<a href="mypage/getPartyList.do">가입된 소모임 목록 가져오기</a>
	<a href="mypage/getPartyFavList.do">찜한 소모임 목록 가져오기</a>
	<a href="mypage/getPartyCreatorList.do">내가 생성한 소모임 목록 가져오기</a>

</body>
</html>