<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<title>커넥트MBTI</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<style>
	.grid-container {
	  dlsplay: inline-grid;
	  column-gap: 50px;
	  row-gap: 50px;
	  justify-content: space-around;
	  flex-wrap: wrap;
	} 	
	
	.btn btn-primary{
	justify-content : center;
	}
	body { 
		min-height: 100vh; 
		}
		.input-form { 
		max-width: 680px; 
		
		margin-top: 80px; 
		padding: 32px; 
		
		background: #fff; 
		-webkit-border-radius: 10px; 
		-moz-border-radius: 10px; 
		border-radius: 10px; 
		-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15); 
		-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15); 
		box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15) 
		}
</style>
</head>
<jsp:include page="Nav.jsp"/>
<!-- 
	<body>
		<div class="grid-container">
		<div class="input-form-row">
		<div class="input-form col-md-12 mx-auto"> 
				<h1 style="text-align: center">Login</h1> 
			<br><hr>
			<form action ="loginCheck.do" method="post">
			<div class="form-group">
			<div class="input-group">
			   <div class="input-group-prepend">
		          <span class="input-group-text"><i class="fa fa-user"></i></span>
		 	   </div>
			   <input class="form-control" placeholder="Username" type="user_id">
			</div> 
			</div> 
			<div class="form-group">
			<div class="input-group">
		       <div class="input-group-prepend">
		          <span class="input-group-text"><i class="fa fa-lock"></i></span>
			   </div>
	           <input class="form-control" placeholder="******" type="password">
	    	</div> 
			</div> 
			
			<div class="form-group">
			<button class="btn btn-primary btn-sm" onclick="window.location.href='registry_form.jsp'">회원가입</button>
			<a class="btn btn-primary btn-sm style="float: left" href="#">아이디 찾기</a>
			<a class="btn btn-primary btn-sm style="float: center" href="#">비밀번호 찾기</a>
			<a class="btn btn-primary btn-sm style="float: right" href="registry_form.do">회원가입</a>
			<button type="submit" class="btn btn-primary btn-block style="float: rigth"> Login  </button>
			<a class="btn btn-primary btn-block" href="#">소셜 로그인</a>
			</div> 
			</form>
		</div> 
		</div>
		</div>
		
		
		<footer>
		 하단 배치
		</footer>
	 -->	
	
	<div class="grid-container">
		<div class="input-form-row">
		<div class="input-form col-md-12 mx-auto"> 
			<form action ="loginCheck.do" method="post">
  <div class="mb-3 mt-3">
    <label for="user_id" class="form-label">아이디 </label>
    <input type="text" class="form-control"  placeholder="아이디를 입력해주세요" name="user_Id">
  </div>
  <div class="mb-3">
    <label for="pwd" class="form-label">비밀번호 </label>
    <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력해주세요" name="password">
  </div>
  
  <button type="submit" class="btn btn-primary" align="center">로그인</button>
  <button type="button" class="btn btn-primary" onclick="location.href='registry_form.do'">회원가입</button>
  
</form>
			</div>
		</div>
	</div>
	</body>
	
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
</html>

