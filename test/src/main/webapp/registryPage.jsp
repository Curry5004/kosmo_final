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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
 <script>
  var count = 0; /* 문자 중복을 막기 위한 인증번호 */
   
 $(document).ready(function() {
 var number = Math.floor(Math.random() * 100000) + 100000;
    $("#send").click(function() {
       
      
          if(number>100000){
             number = number - 10000;
          }

          $("#text").val(number);      /* 난수로 생성된 인증번호를 hidden name : text 에 숨긴다 */
       
       var to = $("#to").val();
       
       if(to == "" || to == null){
          alert("빈칸이나 공백을 채워주세요");
       }
       
       else {
       var con_test = confirm("해당번호로 인증문자를 발송하시겠습니까?");   /* 문자를 보낼껀지 물어본다 */
          
          if(con_test == true){
               
             if(count < 3){      /* 추후 데이터베이스에 컬럼 값을 확인하여 count 값을 비교 할 예정 */
                 
               $.ajax({
                   url:"sendSms.do",
                   type:"post",
                   data:{to: $("#to").val(),
                        text: $("#text").val()
                        },
                 success:function(){
                   alert("해당 휴대폰으로 인증번호를 발송했습니다");
                   count++;
                   
                   //alert(count);
                   },
                   error(){
                      
                   }
                   
                });
             } else {
                alert("휴대폰 인증 그만하세요")
             }
          
          }
             else if(con_test == false){
                
             }
         }   
    })
    $("#enterBtn").click(function() {   /* 내가 작성한 번호와 인증번호를 비교한다 */
       //alert($("#text").val());
       var userNum = $("#userNum").val();
       
       var sysNum = $("#text").val();         
       
       if(userNum == null || userNum == ""){
          alert("휴대폰으로 발송된 인증번호를 입력해주세요");
       }     
       else{     
          if(userNum.trim() == sysNum.trim()){
              alert("성공");
           }
           else {
              alert("실패");
           }          
       }
    });
  });
  
  
 function fn_phoneChk(){
	 var userNum = $("#userNum").val();
	 console.log(userNum);
	 var sysNum = $("#text").val(); 
	 console.log(sysNum);
	 var f = document.phoneCheck;
	 if(userNum == null || userNum == ""){
		 console.log("에러문 출력");
         alert("휴대폰으로 발송된 인증번호를 입력해주세요");
         f.to.focus();
         return false;
      }     
      else{     
         if(userNum.trim() == sysNum.trim()){
        	 alert("회원가입성공");
          }
          else {
        	  console.log("에러문 출력");
             alert("번호가 일치하지 않습니다.");
             f.to.focus();
             return false;
          }          
      }
	}
  </script>

<body>
	<div id="wrap">
		<br> <br> <b><font size="6" color="gray">회원가입</font></b> <br>
		<br> <br>

		<form method="post" action="registry.do" name="userInfo"
			enctype="multipart/form-data" onsubmit="return fn_phoneChk()">
			<table>
				<tr>
					<td id="title">아이디</td>
					<td><input type="text" name="user_Id" id="user_Id"
						maxlength="50">
						<button class="idChk" type="button" id="idChk"
							onclick="fn_idChk();" value="N">중복확인</button></td>
				</tr>

				<tr>
					<td id="title">비밀번호</td>
					<td><input type="password" name="password" maxlength="50">
					</td>
				</tr>

				<tr>
					<td id="title">이름</td>
					<td><input type="text" name="name" maxlength="50"></td>
				</tr>

				<tr>
					<td id="title">성별</td>
					<td><input type="radio" name="gender" value="남" checked>남
						<input type="radio" name="gender" value="여" checked>여</td>
				</tr>

				<tr>
					<td id="title">생일</td>
					<td><input type="text" name="birthDay" maxlength="10"
						placeholder="양식)YYYY-MM-DD ex)1993-12-05" size="6"></td>
				</tr>



				<tr>

					<form action="#" method="post" name="phoneCheck">
						<td id="title">휴대전화</td>
						<td>
						<input type="input" id="to" name="phone_Num"   />
						<input type="button" id="send" value="전송" /><br />
						인증번호: <input type="text" id="userNum" /> 
						<input type="button" value="확인" id="enterBtn" /> 
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
</body>

</html>