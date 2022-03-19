<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>registryPage</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
	<style> 
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

	<body> 
	<jsp:include page="Nav.jsp"/>
	<div class="container"> 
		<div class="input-form-row"> 
			<div class="input-form col-md-12 mx-auto"> 
				<h4 class="mb-3">회원가입</h4> 
				  <form method="post" action="registry.do" name="userInfo" enctype="multipart/form-data">
					<div class="row"> 
						<div class="col-md-6 mb-3"> 
							<label for="user_Id">아이디</label>
						<input class="form-control" type="text" name="user_Id" id="user_Id" maxlength="50">
                        <button class="btn btn-primary btn-ms" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
						</div>
					
					
					<div class="col-md-6 mb-3">
						<label for="password">비밀번호</label>
						<input class="form-control" type="password" name="password" maxlength="50">
					</div>
				    
					<div class="col-md-6 mb-3">
						<label for="name">이름</label>
					 	<input class="form-control" type="text" name="name" maxlength="50">
					</div>
					
					<div>
						<label for="gender">성별</label>
						<br>
						<input type="radio" name="gender" value="남" checked id="gender">남
						<input type="radio" name="gender" value="여" checked id="gender">여
					</div>
					
					<br>
					
					<div class="col-md-6 mb-3">
						<label for="birthDay">생일</label>
						<input class="form-control" type="text" name="birthDay" maxlength="10" placeholder="양식)YYYY-MM-DD ex)1993-12-05" size="6" >
					</div>
					
					<div class="col-md-6 mb-3">
						<label for="phone_Num">휴대전화</label>
						 <input class="form-control" type="text" name="phone_Num" />
					</div>
					
					<div class="mb-3">
						<label for="location">선호 만남 지역</label>
						<input type="text" class="form-control" size="50" name="location" placeholder="시, 구 까지만 작성해 주세요 ex)서울특별시 금천구"/>
					</div>
					
					<div>
						<label for="mbti_id">MBTI Type</label>
						<select name="mbti_Id">
							<c:forEach var="temp" items="${MbtiList}">
								<option value="${temp.MBTI_ID}">${temp.MBTI_NAME}</option>
							</c:forEach>	
						</select>
						<a href="https://www.16personalities.com/ko/%EB%AC%B4%EB%A3%8C-%EC%84%B1%EA%B2%A9-%EC%9C%A0%ED%98%95-%EA%B2%80%EC%82%AC" target="_blank">검사하러가기</a>
					</div>
					
					<div>
						<label for="mbti_root">MBTI 결과지</label>
						 <input type="file" name="mbti_root"/>
					</div>
					
					<div>
						<label for="profile_root">프로필 사진</label>
						<input type="file" name="profile_root"/>
					</div>
					</div>
					
					<button class="btn btn-primary btn-lg btn-block" type="submit" value="가입">가입 완료</button>
				</form>
			</div>
		</div>
	</div>
				   
					
				



     
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
function fn_idChk(){
	
	var user_id = $("#user_Id").val();
	console.log(user_id);
	$.ajax({
		url : "idCheck.do",
		type : "POST",
		dataType : "json",
		data : {"user_Id" : $("#user_Id").val()},
		success : function(data){
			if(data == 1){
				alert("중복된 아이디입니다.");
			}else if(data == 0){
				$("#idChk").attr("value", "Y");
				alert("사용가능한 아이디입니다.");
			}
		}
	})
}
</script>
</body>

</html>