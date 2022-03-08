<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
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
        <b><font size="6" color="gray">개인정보 변경하기</font></b>
        <br><br><br>

        <form method="post" action="UpdateUserInfo.do" name="userInfo" enctype="multipart/form-data">
            <table>
                <tr>
                    <td id="title">아이디</td>
                    <td>
                        ${user.user_Id}
                        <input type="hidden" value="${user.user_Id}" name="user_Id"/>
                     </td>
                </tr>
                        
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="password" maxlength="50" value="${user.password}"></input>
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
                        <input type="text" size="50" name="location" placeholder="시, 구 까지만 작성해 주세요 ex)서울특별시 금천구" value="${user.location}"/>
                    </td>
                </tr>
           
                <tr>
                    <td id="title">프로필 사진</td>
                    <td>
                        <input type="file" name="profile_root"/>
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="가입"/>  <input type="button" value="취소">
        </form>
    </div>
</body>
</html>