<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ page import="com.springbook.biz.common.Consts" %>
<%@ page import="com.springbook.biz.user.UserVO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>

</style>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커넥트MBTI</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- #BOOTSTRAP 5.1.3 합쳐지고 최소화된 최신 CSS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
</head>
<body onload="getModal.do">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="home.jsp"><img src="resource/img/mbti.png" width="100px" height="80px" /></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">           
        </li>
        <li class="nav-item">
          <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">카테고리</button>            
            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">카테고리</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">                
                       <a href="getPartyList.do?CATEGORY_NAME=인문학/책/글&SEARCH_KEYWORD"><img src="resource/img/book.png" width=80 height=80 /></a>           
                       <a href="getPartyList.do?CATEGORY_NAME=아웃도어/여행&SEARCH_KEYWORD"><img src="resource/img/outdoor.png" width=80 height=80 /></a>
                       <a href="getPartyList.do?CATEGORY_NAME=운동/스포츠&SEARCH_KEYWORD"><img src="resource/img/execersize.png" width=80 height=80 /></a> 
                       <a href="getPartyList.do?CATEGORY_NAME=업종/직무&SEARCH_KEYWORD"><img src="resource/img/work.png" width=80 height=80 /></a> 
                       <a href="getPartyList.do?CATEGORY_NAME=외국/언어&SEARCH_KEYWORD"><img src="resource/img/lang.png" width=80 height=80 /></a> 
                       <a href="getPartyList.do?CATEGORY_NAME=문화/공연/축제&SEARCH_KEYWORD"><img src="resource/img/party.png" width=80 height=80 /></a> 
                       <a href="getPartyList.do?CATEGORY_NAME=음악/악기&SEARCH_KEYWORD"><img src="resource/img/music.png" width=80 height=80 /></a> 
                       <a href="getPartyList.do?CATEGORY_NAME=인공예/만들기&SEARCH_KEYWORD"><img src="resource/img/make.png" width=80 height=80 /></a> 
                       <a href="getPartyList.do?CATEGORY_NAME=댄스/무용&SEARCH_KEYWORD"><img src="resource/img/dance.png" width=80 height=80 /></a> 
                       <a href="getPartyList.do?CATEGORY_NAME=봉사활동&SEARCH_KEYWORD"><img src="resource/img/volunteer.png" width=80 height=80 /></a> 
                       <a href="getPartyList.do?CATEGORY_NAME=사교/인맥&SEARCH_KEYWORD"><img src="resource/img/freind.png" width=80 height=80 /></a> 
                       <a href="getPartyList.do?CATEGORY_NAME=차/오토바이&SEARCH_KEYWORD"><img src="resource/img/car.png" width=80 height=80 /></a> 
                       <a href="getPartyList.do?CATEGORY_NAME=사진/영상&SEARCH_KEYWORD"><img src="resource/img/camera.png" width=80 height=80 /></a> 
                       <a href="getPartyList.do?CATEGORY_NAME=야구관람&SEARCH_KEYWORD"><img src="resource/img/baseball.png" width=80 height=80 /></a>
                       <a href="getPartyList.do?CATEGORY_NAME=게임/오락&SEARCH_KEYWORD"><img src="resource/img/GAME.png" width=80 height=80 /></a>
                       <a href="getPartyList.do?CATEGORY_NAME=요리/제조&SEARCH_KEYWORD"><img src="resource/img/cook.png" width=80 height=80 /></a>
                       <a href="getPartyList.do?CATEGORY_NAME=반려동물&SEARCH_KEYWORD"><img src="resource/img/pet.png" width=80 height=80 /></a>
                       <a href="getPartyList.do?CATEGORY_NAME=가족/결혼&SEARCH_KEYWORD"><img src="resource/img/family.png" width=80 height=80 /></a>
                       <a href="getPartyList.do?CATEGORY_NAME=자유주제&SEARCH_KEYWORD"><img src="resource/img/freetalk.png" width=80 height=80 /></a>            
                    </div>
                </div>
                </div>
            </div>
        </li>
     <%
     UserVO userVO = (UserVO)request.getSession().getAttribute("user");     
     %>
     <!-- 로그인 전 화면 -->
     <%if (userVO == null) {%>
        <li>
           <a class="nav-link" href="login.do">로그인</a>
        </li>
         <li>
           <a class="nav-link" href="registry_form.do">회원가입</a>
        </li>
         <%}else if (userVO.isAdmin()==true) {%>
         
        <li>
        	<a class="nav-link" href="<%= request.getContextPath() %>/logout.do">로그아웃</a>
        </li>
         <li>
        	<a class="nav-link" href="<%= request.getContextPath() %>/writeParty.do">방개설</a>
        </li>
         <li>
        	<a class="nav-link" href="mypage/mypage.do">마이페이지</a>
        </li>
        <li>
        	<a class="nav-link" href="admin/getAdminMemberList.do">관리자모드</a>
        </li>
          <%}else if (userVO != null) {%>
          <li>
          	<a class="nav-link" href="<%= request.getContextPath() %>/logout.do">로그아웃</a>
          </li>
          <li>
          	<a class="nav-link" href="<%= request.getContextPath() %>/writeParty.do">방개설</a>
          </li>
          <li>
          	<a class="nav-link" href="mypage/mypage.do">마이페이지</a>
          </li>
      </ul>
      <%}; %>
    <form class="d-flex" action="getPartyList.do" method="get">
		<select name="CATEGORY_NAME">
			<option value ="" selected>선택</option>
			
			<option value ="인문학/책/글">인문학/책/글</option>
			<option value ="아웃도어/여행">아웃도어/여행</option>
			<option value ="운동/스포츠">운동/스포츠</option>
			<option value ="업종/직무">업종/직무</option>
			<option value ="외국/언어">외국/언어</option>
			<option value ="문화/공연/축제">문화/공연/축제</option>
			<option value ="음악/악기">음악/악기</option>
			<option value ="공예/만들기">공예/만들기</option>
			<option value ="댄스/무용">댄스/무용</option>
			<option value ="봉사활동">봉사활동</option>
			<option value ="사교/인맥">사교/인맥</option>
			<option value ="차/오토바이">차/오토바이</option>
			<option value ="사진/영상">사진/영상</option>
			<option value ="야구관람">야구관람</option>
			<option value ="게임/오락">게임/오락</option>
			<option value ="요리/제조">요리/제조</option>
			<option value ="반려동물">뱐려동물</option>
			<option value ="가족/결혼">가족/결혼</option>
			<option value ="자유주제">자유주제</option>
		</select>
		<br />
		<input class="form-control me-2" name="SEARCH_KEYWORD" type="search" aria-label="Search"></input>
		<button class="btn btn-outline-success" type="submit">Search</button>
	</form>
    </div>
  </div>
</nav>
</body>
</html>