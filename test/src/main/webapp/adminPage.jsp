<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>회원관리 페이지</title>
</head>
<body>
<table border="1" cellpadding="0" cellspacing="0" width="700">
  <tr>
  <th bgcolor="orange" width="100">번호</th>
  <th bgcolor="orange" width="200">회원명</th>
  <th bgcolor="orange" width="150">MBTI</th>
  <th bgcolor="orange" width="150">MBTI 이미지</th>
  <th bgcolor="orange" width="100">회원상태</th>
  <th bgcolor="orange" width="100">상태</th>
  
  </tr>
  
  <c:forEach items="${getAdminList}" var="board">
  <tr>
  	<td>번호</td>
  	<td>${board.name}</td>
  	<td>${board.mbti_id}</td>
  	<td><img src="${board.mbti_path}" width="50px"  height="25px"></td>
  	<td>${board.request}</td>
  	<td><a href="adminPage.jsp?user_id=${user_id}">수락</a><button>거절</button><button>강퇴</button></td>
  	</c:forEach>
  </table>

</body>
</html>