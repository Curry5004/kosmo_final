<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
var uid = '<%=(String)session.getAttribute("user.user_Id")%>';
if(uid == null){
function fn_idChk(){
	
	var user_id = $("#user_Id").val();
	if(user_id==""||user_id==null){
		alert("id를 입력해주세요.");
	}else {
	console.log(user_id);
	$.ajax({
		url : "idCheck.do",
		type : "POST",
		dataType : "json",
		data : {"user_Id" : $("#user_Id").val()},
		success : function(data){
			if(data == 1){
				$("#idChk").attr("value", "N");
				alert("중복된 아이디입니다.");
			}else if(data == 0){
				$("#idChk").attr("value", "Y");
				alert("사용가능한 아이디입니다.");
			}
		}
	})
	}
}


function fn_numChk(){
	
	var to = $("#to").val();
	if(to==""||to==null){
		alert("전화번호를 입력해주세요.");
	}else {
	console.log(to);
	$.ajax({
		url : "numCheck.do",
		type : "POST",
		dataType : "json",
		data : {"phone_Num" : $("#to").val()},
		success : function(data){
			if(data == 1){
				$("#numChk").attr("value", "N");
				alert("중복된 전화번호입니다.");
			}else if(data == 0){
				$("#numChk").attr("value", "Y");
				alert("사용가능한 전화번호입니다.");
			}
		}
	})
	}
}



</script>


<body>
<c:if test="${empty sessionScope.user.user_Id}">
	<div id="wrap">
		<br> <br> <b><font size="6" color="gray">회원가입</font></b> <br>
		<br> <br>

		<form method="post" action="registry.do" name="userInfo"
			enctype="multipart/form-data" onsubmit="return fn_phoneChk()">
			<table>
				<tr>
					<td id="title">아이디</td>
					<td><input type="text" name="user_Id" id="user_Id"
						maxlength="50" required>
						<button class="idChk" type="button" id="idChk"
							onclick="fn_idChk();" value="N">중복확인</button></td>
				</tr>

				<tr>
					<td id="title">비밀번호</td>
					<td><input type="password" name="password" maxlength="50" required>
					</td>
				</tr>

				<tr>
					<td id="title">이름</td>
					<td><input type="text" name="name" maxlength="50" required></td>
				</tr>

				<tr>
					<td id="title">성별</td>
					<td><input type="radio" name="gender" value="남" checked>남
						<input type="radio" name="gender" value="여" checked>여</td>
				</tr>

				<tr>

				</tr>



				<tr>
					<form action="#" method="post" name="phoneCheck">
						<td id="title">휴대전화</td>
						<td>
						<input type="text" id="to" name="phone_Num" required />
						<button class="numChk" type="button" id="numChk"
							onclick="fn_numChk();"  required>중복확인</button>
						
						<button type="button" id="enterBtn" value="N" required> 확인 </button>
							<!--인증번호를 히든으로 저장--> 
							<input type="hidden" name="text" id="text" /></td>
					</form>
				</tr>
				<tr>
					<td id="title">선호 만남 지역</td>
					<td><input type="text" size="50" name="location"
						placeholder="시, 구 까지만 작성해 주세요 ex)서울특별시 금천구" /></td>
				</tr>
				<tr>
					<td id="title">MBTI Type</td>
					<td><select name="mbti_Id">
							<c:forEach var="temp" items="${MbtiList}">
								<option value="${temp.MBTI_ID}">${temp.MBTI_NAME}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td id="title"><a
						href="https://www.16personalities.com/ko/%EB%AC%B4%EB%A3%8C-%EC%84%B1%EA%B2%A9-%EC%9C%A0%ED%98%95-%EA%B2%80%EC%82%AC"
						target="_blank">검사하러가기</a></td>
				</tr>
				<tr>
					<td id="title">MBTI 결과지</td>
					<td><input type="file" name="mbti_root" /></td>
				</tr>
				<tr>
					<td id="title">프로필 사진</td>
					<td><input type="file" name="profile_root" /></td>
				</tr>
			</table>
			<br> <input type="submit" value="가입"/>
		</form>
	</div>
</c:if>

<c:if  test="${not empty sessionScope.user.user_Id}">
	<div id="wrap">
		<br> <br> <b><font size="6" color="gray">회원가입</font></b> <br>
		<br> <br>

		<form method="post" action="registry2.do" name="userInfo"
			enctype="multipart/form-data" onsubmit="return fn_phoneChk()">
			<table>
				<tr>
				<c:if test="${not empty sessionScope.user.user_Id}">
				<input type="hidden" class="idChk" id="idChk" value="N" />
				</c:if>
				</tr>

				<tr>
				</tr>

				<tr>
				</tr>

				<tr>
					<td id="title">성별</td>
					<td><input type="radio" name="gender" value="남" checked>남
						<input type="radio" name="gender" value="여" checked>여</td>
				</tr>

				<tr>
				</tr>



				<tr>
				<input type="hidden" class="umChk" id="numChk" value="Y" />
				</tr>
				<tr>
					<td id="title">선호 만남 지역</td>
					<td><input type="text" size="50" name="location"
						placeholder="시, 구 까지만 작성해 주세요 ex)서울특별시 금천구" /></td>
				</tr>
				<tr>
					<td id="title">MBTI Type</td>
					<td><select name="mbti_Id">
							<c:forEach var="temp" items="${MbtiList}">
								<option value="${temp.MBTI_ID}">${temp.MBTI_NAME}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td id="title"><a
						href="https://www.16personalities.com/ko/%EB%AC%B4%EB%A3%8C-%EC%84%B1%EA%B2%A9-%EC%9C%A0%ED%98%95-%EA%B2%80%EC%82%AC"
						target="_blank">검사하러가기</a></td>
				</tr>
				<tr>
					<td id="title">MBTI 결과지</td>
					<td><input type="file" name="mbti_root" /></td>
				</tr>
				<tr>
					<td id="title">프로필 사진</td>
					<td><input type="file" name="profile_root" /></td>
				</tr>
			</table>
			<br> <input type="submit" value="가입"/>
		</form>
	</div>
</c:if>
</body>

</html>