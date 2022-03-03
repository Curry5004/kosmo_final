<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
    <!-- div 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
    <div id="wrap">
        <br><br>
        <b><font size="6" color="gray">회원가입</font></b>
        <br><br><br>
        
        
        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
        <form method="post" action="../pro/JoinPro.jsp" name="userInfo" onsubmit="return checkValue()">
            <table>
                <tr>
                    <td id="title">아이디</td>
                    <td>
                        <input type="text" name="userId" maxlength="50">
                        <input type="button" value="중복확인" >    
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="password" maxlength="50">
                    </td>
                </tr>
                
                <tr>
                    <td id="title">비밀번호 확인</td>
                    <td>
                        <input type="password" name="passwordcheck" maxlength="50">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이름</td>
                    <td>
                        <input type="text" name="name" maxlength="50">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">성별</td>
                    <td>
                        <input type="radio" name="gender" value="male" checked>남
                        <input type="radio" name="gender" value="female" checked>여
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">생일</td>
                    <td>
                        <input type="text" name="birthyy" maxlength="10" placeholder="양식)YYYY-MM-DD ex)1993-12-05" size="6" >
                    </td>    
                </tr>
                    
                
                    
                <tr>
                    <td id="title">휴대전화</td>
                    <td>
                        <input type="text" name="phoneNum" />
                    </td>
                </tr>
                <tr>
                    <td id="title">선호 만남 지역</td>
                    <td>
                        <input type="text" size="50" name="address" placeholder="시, 구 까지만 작성해 주세요 ex)서울특별시 금천구"/>
                    </td>
                </tr>
                <tr>
                    <td id="title">MBTI Type</td>
                    <td>
                        <select name="mbti">
                        	<option value=1>ISTJ</option>
                        	<option value=2>ISFJ</option>
                        	<option value=3>INFJ</option>
                        	<option value=4>INTJ</option>
                        	<option value=5>ISTP</option>
                        	<option value=6>ISFP</option>
                        	<option value=7>INFP</option>
                        	<option value=8>INTP</option>
                        	<option value=9>ESTP</option>
                        	<option value=10>ESFP</option>
                        	<option value=11>ENFP</option>
                        	<option value=12>ENTP</option>
                        	<option value=13>ESTJ</option>
                        	<option value=14>ESFJ</option>
                        	<option value=15>ENFJ</option>
                        	<option value=16>ENTJ</option>                        	
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
                        <input type="text" size="50" name="address" />
                    </td>
                </tr>
                <tr>
                    <td id="title">프로필 사진</td>
                    <td>
                        <input type="text" size="50" name="address"/>
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="가입"/>  <input type="button" value="취소">
        </form>
    </div>
</body>

</html>