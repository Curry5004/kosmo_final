<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.springbook.biz.user.UserVO" %>
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
    
    <style>
        #modal.modal-open {
            display: none;
        }
		.button {		
		  background-color: blue;
		
		  border: none;
		
		  color: white;
		
		  padding: 15px 30px;
		
		  text-align: center;
		
		  text-decoration: none;
		
		  display: inline-block;
		
		  font-size: 16px;
		
		  margin: 4px 2px;
		
		  cursor: pointer;
		
		}

    </style>
<!-- 네비 예시입니다. -->

<body>
	<!-- 네비게이션 예시입니다. -->
	  <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
          <a class="navbar-brand" href="home.do">LOGO</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarScroll">
            <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
               
           
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
                       <a href="index.jsp"><img src="data:image/jpeg;base64,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" width=80 height=80 /></a>
                       <a href="index.jsp"><img src="${CATEGORY_IMG_PATH}" width=80 height=80 /></a>
                       <a href="index.jsp"><img src="${CATEGORY_IMG_PATH}" width=80 height=80 /></a>
                       <a href="index.jsp"><img src="${CATEGORY_IMG_PATH}" width=80 height=80 /></a>
                       <a href="index.jsp"><img src="${CATEGORY_IMG_PATH}" width=80 height=80 /></a>
                       <a href="index.jsp"><img src="${CATEGORY_IMG_PATH}" width=80 height=80 /></a>
                       <a href="index.jsp"><img src="${CATEGORY_IMG_PATH}" width=80 height=80 /></a>
                       <a href="index.jsp"><img src="${CATEGORY_IMG_PATH}" width=80 height=80 /></a>
                       <a href="index.jsp"><img src="${CATEGORY_IMG_PATH}" width=80 height=80 /></a>
                       <a href="index.jsp"><img src="${CATEGORY_IMG_PATH}" width=80 height=80 /></a>
                       <a href="index.jsp"><img src="${CATEGORY_IMG_PATH}" width=80 height=80 /></a>
                       <a href="index.jsp"><img src="${CATEGORY_IMG_PATH}" width=80 height=80 /></a>
                       <a href="index.jsp"><img src="${CATEGORY_IMG_PATH}" width=80 height=80 /></a>
                       <a href="index.jsp"><img src="${CATEGORY_IMG_PATH}" width=80 height=80 /></a>
                    </div>
                </div>
                </div>
            </div>
        </ul>
		<form action="getPartyList.do" method="get">
	        <!-- <input name="SEARCH_KEYWORD" type="text"></input> -->
			<button type="button" onclick="location.href='partySearch.jsp' ">모임찾기</button>
		</form>
          </div>
        </div>
      </nav>
      <!-- 네비게이션 예시입니다. -->
      
      ${sessionScope.user.user_Id }
     <%
     UserVO userVO = (UserVO)request.getSession().getAttribute("user");     
     %>
     <!-- 로그인 전 화면 -->
     <%if (userVO == null) {%>
    
     <ul>
     
     	<li><a href="login.do">로그인</a>	</li>
     	<li><a href="registry_form.do">회원가입</a></li>
     </ul>
     <%}else if (userVO.isAdmin()==true) {%>
     	<ul>
     		<li><img src="${profile_image}" width=80 height=80 /></li>
	     	<li><a href="<%= request.getContextPath() %>/logout.do">로그아웃</a></li>
	     	<li><a href="<%= request.getContextPath() %>/writeParty.do">방개설</a></li>
	     	<li><a href="mypage/mypage.do">마이페이지</a></li>
	     	<li><a href="admin/getAdminMemberList.do">관리자모드</a></li>
	     </ul>    
     
     <!-- 로그인 후 화면 -->
     <%}else if (userVO != null) {%>
     	<ul>
     		<li><img src="${profile_image}" width=80 height=80 /></li>
	     	<li><a href="<%= request.getContextPath() %>/logout.do">로그아웃</a></li>
	     	<li><a href="<%= request.getContextPath() %>/writeParty.do">방개설</a></li>
	     	<li><a href="mypage/mypage.do">마이페이지</a></li>
	     </ul>
	 <%}; %>
	
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