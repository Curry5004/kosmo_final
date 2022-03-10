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
                <c:if test="${mbtiModi}">
                	<tr>
                    	<td id="title">MBTI Type 3개월이 경과하였습니다.</td>
                    <td>
                        <select name="mbti_Id">
                     		<c:forEach var="temp" items="${MbtiList}">
								<option value="${temp.MBTI_ID}">${temp.MBTI_NAME}</option>
							</c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td id="title">
                    	<a href="https://www.16personalities.com/ko/%EB%AC%B4%EB%A3%8C-%EC%84%B1%EA%B2%A9-%EC%9C%A0%ED%98%95-%EA%B2%80%EC%82%AC" target="_blank">검사하러가기</a>
                    </td>
                </tr>
                <tr>
                    <td id="title">MBTI 결과지</td>
                    <td>
                        <input type="file" name="mbti_root"/>
                    </td>
                </tr>
                </c:if>
                <!-- 3개월 경과안돼었을떄 나오는 부분.  -->
                <c:if test="${!mbtiModi}">
                	<tr>
                    	<td id="title">3개월이 경과되지않았습니다.</td>
                    	<td id="title">변경일자 = ${user.modified_Day}</td>  
                </tr>
                <tr>
                    <td>
                        <input type="hidden"  size="50" name="mbti_Id" value="${user.mbti_Id}"/>
                        <input type="hidden" name="mbti_root" value="${user.mbti_root}"/>
                    </td>
                </tr>
                </c:if>
           
                <tr>
                    <td id="title">프로필 사진</td>
                    <td>
                        <input type="file" name="profile_root"/>
                    </td>
                </tr>
            </table>
            <br>
            <span style="color:red">회원내용을 변경하면 다시 로그인 하셔야합니다.</span>
            <input type="submit" value="변경하기"/>
        </form>
    </div>
</body>
</html>