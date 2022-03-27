<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커넥트MBTI</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="js/typeahead.bundle.js"></script>
  <script src="js/scripts.js"></script>
<script type="text/javascript">
function fn_idChk(){
	 
	var user_id = $("#user_Id").val();
	if(user_id==""||user_id==null){
		alert("id를 입력해주세요.");
	}
	else {
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
          alert("전화번호를 입력해주세요.");
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
        	  $("#enterBtn").attr("value", "Y");
              alert("성공");
           }
           else {
        	   $("#enterBtn").attr("value", "N");
              alert("실패");
           }          
       }
    });
  });
  
  
 function fn_phoneChk(){
	 var userNum = $("#userNum").val();
	 var sysNum = $("#text").val(); 
	 
	 if(userNum == null ||  userNum == ""){
		 alert("인증번호를 입력해주세요.");
		 return false;
	 }else{
		 if($("#enterBtn").val() == "Y"&& $("#idChk").val() == "Y" && $("#numChk").val() == "Y"){
			 alert("회원가입에 성공하였습니다.");
		 }else if($("#idChk").val() != "Y"){
	          alert("아이디 중복체크를 완료해주세요."); 
	          return false;
	       }else if($("#enterBtn").val() != "Y"){
	          alert("휴대폰 인증을 완료해주세요.");
	          return false;
	       } 
	 }
	 
	}
 
  </script>
  
   <style>
    .twitter-typeahead {
      width: 100%;
    }

    .tt-menu {
      z-index: 100;
      max-height: 240px;
      overflow-y: auto;
      background-color: #fff;
      margin-top: 3px;
      border-radius: 3px;
      width: 100%;
      box-shadow: 0 0 3px #666;
      padding-bottom: 6px;
    }
    
    .tt-menu .tt-suggestion {
      padding: 5px 10px;
      text-align: left;
      font-size: 16px !important;
      color: #464a4c;
    }
    
    .tt-menu .tt-suggestion.tt-cursor {
      background-color: #ccc;
    }

  </style>

<body>
<jsp:include page="Nav.jsp"/>

	<div class="container"> 
      <div class="input-form-row"> 
         <div class="input-form col-md-12 mx-auto"> 
            <h4 class="mb-3">회원가입</h4> 
              <form method="post" action="registry.do" name="userInfo" enctype="multipart/form-data" onsubmit="return fn_phoneChk()">
               <div class="row"> 
                  <div class="col-md-6 mb-3"> 
                     <label for="user_Id">아이디</label>
                  <input class="form-control" type="text" name="user_Id" id="user_Id" maxlength="50" required>
                        <button class="btn btn-primary btn-ms" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
                  </div>
               
               
               <div class="col-md-6 mb-3">
                  <label for="password">비밀번호</label>
                  <input class="form-control" type="password" name="password" maxlength="50" required>
               </div>
                
               <div class="col-md-6 mb-3">
                  <label for="name">이름</label>
                   <input class="form-control" type="text" name="name" maxlength="50" required>
               </div>
               
               <div>
                  <label for="gender">성별</label>
                  <br>
                  <input type="radio" name="gender" value="남" checked id="gender" required>남
                  <input type="radio" name="gender" value="여" checked id="gender" required>여
               </div>
               
               <br>
               
               <div class="col-md-6 mb-3">
                  <label for="birthDay">생일</label>
                  <input class="form-control" type="text" name="birthDay" maxlength="10" placeholder="양식)YYYY-MM-DD ex)1993-12-05" size="6" required>
               </div>
             
            <div>
                     <!--   <form action="#" method="post" name="phoneCheck">-->
                    <lable for=to>전화번호 </lable>
                    <input  class="form-control" type="text" id="to" name="phone_Num" required />
                  <button class="btn btn-primary btn-lg btn-block" type="button" id="numChk"
                     onclick="fn_numChk();" value="N" required>중복확인</button>
                  <button class="btn btn-primary btn-lg btn-block" type="button" id="send" required>전송</button><br />
                  인증번호: <input class="form-control" type="text" id="userNum" required/> 
                  
                  <button class="btn btn-primary btn-lg btn-block" type="button" id="enterBtn" value="N" required> 확인 </button>
                     <!--인증번호를 히든으로 저장--> 
                     <input class="form-control" type="hidden" name="text" id="text" /></td>
                    
                  <!--    </form>-->
            </div>
               
               
              
               
               <div class="mb-3">
                  <label for="location">선호 만남 지역</label>
                  <input type="text" id="search-area" class="form-control typeahead" placeholder="읍면동 검색" name="location" required/>
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
                   <input type="file" name="mbti_root" accept=".jpeg, .jpg, .png" required/>
               </div>
               
               <div>
                  <label for="profile_root">프로필 사진</label>
                  <input type="file" name="profile_root" accept=".jpeg, .jpg, .png" required />
               </div>
               </div>
               
               <button class="btn btn-primary btn-lg btn-block" type="submit" value="가입" required >가입 완료</button>
            </form>
         </div>
      </div>
   </div>
</body>

</html>