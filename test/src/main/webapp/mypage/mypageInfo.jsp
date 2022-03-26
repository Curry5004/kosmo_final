<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
		.abc {
			display: inline-block;
			float: left;
			width: 13%;
			text-align : left;
			line-height: 30px;
			margin-top : 10px;
			margin-right : 0px;
		}
		h1 {
			text-align : center;
		}
		table {
			
			text-align : center;
			margin-left: 200px;
		}
		#wrap {
			display: inline-block;
			
		}
		.bcd {
			text-align : center;	
		}
		.aa {
			text-align: center;
			margin-left: 300px;
		}

    </style>
    -->
</head>
<body>
<jsp:include page="Nav.jsp"/>
       <div class="container pt-5">
           <div class="row">
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
               		<div class="col-sm-8">
               			 <form method="post" action="UpdateUserInfoForm.do" name="userInfo" enctype="multipart/form-data">
               			  <table class="table table-striped">
			  <tbody>
			    <tr>
			      <td id="title">아이디</td>
			      <td width="300">${user.user_Id}</td>
			    </tr>
			    <tr>
			      <td id="title">비밀번호</td>
			      <td width="300">----------</td>
			    </tr>
			    <tr>
			      <td id="title">이름</td>
			      <td width="300">${user.name}</td>
			    </tr>
			    <tr>
			      <td id="title">성별</td>
			      <td width="300">${user.gender}</td>
			    </tr>
			    <tr>
			      <td id="title">생일</td>
			      <td width="300">${user.birthDay}</td>
			    </tr>
			    <tr>
			      <td id="title">휴대전화</td>
			      <td width="300">${user.phone_Num}</td>
			    </tr>
			    <tr>
			      <td id="title">선호 만남 지역</td>
			      <td width="300">${user.location}</td>
			    </tr>
			     <tr>
			      <td id="title" width="300" height="150">프로필 사진</td>
			      <td width="300"><img src="../${user.profile_Image}" width=120 height=120 ></img></td>
			    </tr>
			     <tr>
			      <td id="title">MBTI Type</td>
			      <td width="300"> ${user.mbti_Name}</td>
			    </tr>
			  </tbody>
			</table>
			
			<div class="col-sm-3" style="float:none; margin:0 auto">
			  <button type="submit" class="btn btn-primary" >변경하기</button>
			  </div>
               			 </form>
               		</div>
           </div>
       </div>
    
</body>
</html>