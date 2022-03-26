<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커넥트MBTI</title>
</head>
<body>
	<h1>회원 조회</h1>

	<table border="1" cellpadding="0" cellspacing="0" width="700">
			<tr>
				<th bgcolor="orange" width="100">아이디</th>
				<th bgcolor="orange" width="100">비밀번호</th>
			</tr>
			<c:forEach items="${userList}" var="user">
				<tr>
					<td>${user.id }</td>
					<td>${user.pw }</td>
				</tr>
			</c:forEach>
	</table>
	
	
</body>
</html>