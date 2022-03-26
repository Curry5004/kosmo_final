<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ page import="com.springbook.biz.common.Consts" %>
<%@ page import="com.springbook.biz.user.UserVO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400;900&display=swap" rel="stylesheet">

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
 <title>커넥트MBTI</title>
	<!-- #BOOTSTRAP 5.1.3 합쳐지고 최소화된 최신 CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- #BOOTSTRAP 5.1.3 합쳐지고 최소화된 최신 CSS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    

    <!--  
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
    -->
</head>
<body style="font-family: 'Noto Sans KR', sans-serif;">
<jsp:include page="Nav.jsp"/>
     <div class="container pt-5">
     	<div class="row" >
     		<div class="col-sm-2">
     				<div class="list-group">
     	<a class="list-group-item list-group-item-action list-group-item-secondary" href="getUserInfo.do">1.개인정보 관리</a>
     	<a class="list-group-item list-group-item-action list-group-item-secondary" href="getPartyList.do">2.내가 가입한 소모임</a>
     	<a class="list-group-item list-group-item-action list-group-item-secondary" href="getPartyFavList.do">3.내가 찜한 소모임</a>
     	<a class="list-group-item list-group-item-action list-group-item-secondary" href="getPartyCreatorList.do">4.생성한 소모임 관리</a>
     	<a class="list-group-item list-group-item-action list-group-item-secondary" href="../calendar3.do?user_id=${sessionScope.user.user_Id }">5.스케쥴러</a>
     	
     	<!-- 
     	<li><a href="<%= request.getContextPath() %>/report.do">6.고객센터</a></li>
	  	 -->
	  </div>
     		</div>
     	
     		<div class="col-sm-3" style="float:none; margin:0 auto">
				<div class="card" style="width: 200px">
					<img class="card-img-top" src="../${user.profile_Image}" alt="프로필 사진" width=150 height=150>
					<div class="card-body">
						<h4 class="card-title">${user_id}님이 로그인 중입니다.</h4>
					</div>
				</div>
			</div>

     	</div>
     </div>
     
     <div class="container pt-5">
     	<div class="row">
     		<div class="col-sm-2">
     				
     		</div>
     		<div class="col-sm-8">
     			<h5>내가 가입한 목록</h5>
     			<c:forEach items="${mypageVO.myPartyList}" var="party">
					<div class="card" style="width: 400px">
						<a href="../getParty.do?PARTY_ID=${party.PARTY_ID}"><img class="card-img-top" src="../${party.PARTY_TUMB_PATH}" alt="Card image" width=150 height=150></a>
						<div class="card-body">
							<h4 class="card-title"><a href="../getParty.do?PARTY_ID=${party.PARTY_ID}">${party.PARTY_TITLE}</a></h4>
							
						</div>
					</div>
				</c:forEach>
     		</div>
     	</div>
     </div>
     
     	<div class="container pt-5">
     		<div class="row">
     			<div class="col-sm-3" style="float:none; margin:0 auto">
     				<button type="button" class="btn btn-primary" onclick="location.href='getPartyList.do'">더보기</button>
     			</div>
     		</div>
     	</div>
     	
     	<div class="container pt-5">
     		<div class="row">
     			<div class="col-sm-2">
     			
     			</div>
     		
     			<div class="col-sm-8">
     			<h5>찜한목록</h5>
     				<c:forEach items="${mypageVO.favPartyList}" var="party">
					<div class="card" style="width: 400px">
						<a href="../getParty.do?PARTY_ID=${party.PARTY_ID}"><img class="card-img-top" src="../${party.PARTY_TUMB_PATH}" alt="찜한목록" width=150 height=150></a>
						<div class="card-body">
							<h4 class="card-title"><a href="../getParty.do?PARTY_ID=${party.PARTY_ID}">${party.PARTY_TITLE}</a></h4>
						
						</div>
					</div>
				</c:forEach>
     			</div>
     		</div>
     	</div>
     	
     	<div class="container pt-5">
     		<div class="row">
     			<div class="col-sm-3" style="float:none; margin:0 auto">
     				<button type="button" class="btn btn-primary" onclick="location.href='getPartyFavList.do'">더보기</button>
     			</div>
     		</div>
     	</div>
</body>
</html>