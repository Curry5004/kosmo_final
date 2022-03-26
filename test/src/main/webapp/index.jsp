<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커넥트MBTI</title>
</head>
<body>
	<h1>인덱스</h1>

	<c:if test="${sessionScope.user.user_Id!=null}">
	<h1>${sessionScope.user.user_Id}로 로그인중</h1>
	</c:if>
	<c:if test="${sessionScope.user.user_Id==null}">
	<h1>로그인 X 상태</h1> 
	</c:if>
	
		
	<a href="home.do">메인으로 이동</a>

	로그인<br />
	<a href="registry_form.do">회원가입</a> <br />
	<a href="mypage/getUserInfo.do">회원 정보 가져오기</a><br />
	<a href="login.do">로그인</a>	<br />
	<a href="logout.do">로그아웃</a>	<br />
	<hr />
	소모임<br />
	<a href="partySearch.jsp">소모임 검색 예시</a><br />
	<a href="writeParty.do">소모임 작성</a>	<br />
	<a href="getParty.do?PARTY_ID=1">소모임상세글</a><br />
	<br />
	<hr />
	게시판
	<br /><a href="boardWrite.jsp">게시글 작성</a>
	<br /><a href="getBoardList.do?party_id=1">게시글 조회</a><br />
	<hr />
	앨범<br />
	<a href="getAlbumList.do?party_id=1">앨범목록</a><br />
	<a href="writeAlbum.jsp?party_id=1">앨범 작성</a><br />
	<hr />
	일정<br />
	<a href="writeSchedule.jsp">스케쥴 생성</a><br />
	<a href="calendar.do?party_id=1">스케줄 리스트</a><br />
	<a href="calendar2.do?year=2022&month=03&party_id=1&pageNo=1">스케줄 상세보기</a>
	
	마이페이지<br />
	<a href="calendar3.do?user_id=${sessionScope.user.user_Id }">마이페이지 일정</a>

	<br/>
	<a href="mypage/getUserInfo.do">회원 정보 가져오기</a></br>
	<a href="mypage/getPartyList.do">가입된 소모임 목록 가져오기</a></br>
	<a href="mypage/getPartyFavList.do">찜한 소모임 목록 가져오기</a></br>
	<a href="mypage/getPartyCreatorList.do">내가 생성한 소모임 목록 가져오기</a>
	<br/>
	<br/>

	<a href="admin/getAdminMemberList.do">어드민)회원정보가져오기</a> <br/>
	<a href="Nav.jsp">네비게이션 이동</a>
	<a href="getModal.do">네비게이션 테스트</a>
	<a href="navbar.jsp">검색창 테스트</a>
	<a href="ClendarDetail.jsp">캘린더 디테일</a>
	<a href="getParty.do?party_id=1">intro</a>
	<a href="partyMemberList.jsp">파티멤버리스트</a>

</body>
</html>