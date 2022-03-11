<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<h1>${user.user_Id}님 환영합니다.</h1>
        <br><br>
        <b><font size="6" color="gray">개인정보 조회</font></b>
        <br><br><br>

        <form method="post" action="UpdateUserInfoForm.do" name="userInfo" enctype="multipart/form-data">
            <table>
                <tr>
                    <td id="title">아이디</td>
                    <td>
                        ${user.user_Id}
                     </td>
                </tr>
                        
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        ----------
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이름</td>
                    <td>
                        ${user.name}
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">성별</td>
                    <td>
                        ${user.gender}
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">생일</td>
                    <td>
                     	${user.birthDay}
                    </td>    
                </tr>
 
                <tr>
                    <td id="title">휴대전화</td>
                    <td>
                        ${user.phone_Num}
                    </td>
                </tr>
                <tr>
                    <td id="title">선호 만남 지역</td>
                    <td>
                        ${user.location}
                    </td>
                </tr>
                <tr>
                    <td id="title" width="300" height="300">프로필 사진</td>
                    <td>
                    	<img src="${user.profile_Image}">왠진 모르겠지만 안뜸...</img>
                    </td>
                </tr>
                <tr>
                    <td id="title">MBTI Type</td>
                    <td>
                        ${user.mbti_Name}
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="변경하기"/>
        </form>
    </div>
</body>
</html>