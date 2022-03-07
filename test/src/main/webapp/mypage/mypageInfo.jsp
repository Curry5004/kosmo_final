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
        <br><br>
        <b><font size="6" color="gray">개인정보 조회</font></b>
        <br><br><br>

        <form method="post" action="registry.do" name="userInfo" enctype="multipart/form-data">
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
                        <input type="password" name="password" maxlength="50" value="${user.password}">
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
                    <td id="title" width="300" height="300">프로필 사진</td>
                    <td>
                    	<img src="${user.profile_Image}"></img>
                        <input type="file" name="profile_root"/>
                    </td>
                </tr>
                <tr>
                    <td id="title">MBTI Type</td>
                    <td>
                        <select name="mbti_Id">
                     		<c:forEach var="temp" items="${MbtiList}">
                     			<c:if></c:if>
								<option value="${temp.MBTI_ID}">${temp.MBTI_NAME}</option>
							</c:forEach>
                        </select>
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="가입"/>  <input type="button" value="취소">
        </form>
    </div>
</body>
</html>