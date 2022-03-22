<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ page import="com.springbook.biz.common.Consts" %>
<%@ page import="com.springbook.biz.user.UserVO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
 <title>Insert title here</title>
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
		ul {
			padding: 0;
			margin: 0;
			height: 100%;
		}
		li a {
			display: inline-block;
			color: black;
			padding: 8px 16px;
			font-weight: bold;
			text-decoration: none;
		}
		a { 
			text-decoration:none
		}
		h5 {
			display: inline-block;
			text-align: center;
			padding-left: 100px;
		}
		.abc {
			display: inline-block;
			float: left;
			width: 13%;
			text-align : left;
			line-height: 30px;
			margin-right : 0px;
			margin-top : 10px;
		}
		.bcd {
			text-align : center;
		}
		.modal-body1 {
			padding: 0;
			justify-content: center; 
		}
		
		
    </style>
</head>
<body>
<jsp:include page="Nav.jsp"/>
      <div class="bcd">
	 	 <img src="../${user.profile_Image}" width=120 height=120 ><font size="5px">${user_id}님이 로그인 중입니다.</font></img>
	  </div>
      
      <ul class="abc">
     	<li><a href="getUserInfo.do">1.개인정보 관리</a></li>
     	<li><a href="getPartyList.do">2.내가 가입한 소모임</a></li>
     	<li><a href="getPartyFavList.do">3.내가 찜한 소모임</a></li>
     	<li><a href="getPartyCreatorList.do">4.생성한 소모임 관리</a></li>
     	<li><a href="../calendar3.do?user_id=${sessionScope.user.user_Id }">5.스케쥴러</a></li>
     	
     	<!-- 
     	<li><a href="<%= request.getContextPath() %>/report.do">6.고객센터</a></li>
	  	 -->
	  </ul>
	  
	  <h5>내가 가입한 목록</h5>
	  <div class="modal-body1" id="myPartyList" style="display: flex;">
	  	<c:forEach items="${mypageVO.myPartyList}" var="party">
			<div style="display:block;">
				<div><a href="../getParty.do?PARTY_ID=${party.PARTY_ID}"><img src="../${party.PARTY_TUMB_PATH}" width=120 height=120 hspace=50 /></a></div>
				<div style="margin-left:50px;"><a href="../getParty.do?PARTY_ID=${party.PARTY_ID}">${party.PARTY_TITLE}</a></div>
                       
			</div>
			<hr />
		</c:forEach>
		<div style="display:block;"><a href="getPartyList.do">더보기</a></div>
	  </div>
	  <h5>내가 찜한 목록</h5>
	  <div class="modal-body1" id="favPartyList"  style="display: flex;">
	  	<c:forEach items="${mypageVO.favPartyList}" var="party">
			<div style="display:block;">
				<div><a href="../getParty.do?PARTY_ID=${party.PARTY_ID}"><img src="../${party.PARTY_TUMB_PATH}" width=120 height=120 hspace=50 /></a></div>
				<div style="margin-left:50px;"><a href="../getParty.do?PARTY_ID=${party.PARTY_ID}">${party.PARTY_TITLE}</a></div>
			</div>
			<hr />
		</c:forEach>
		<div style="display:block;"><a href="getPartyFavList.do">더보기</a></div>
	  </div>
	  <div style="display: flex;">
	  	
	  </div>

</body>
</html>