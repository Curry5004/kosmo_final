<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<img src="${album.alb_img_path }" alt="테스트" />
	<p>작성자 : ${album.alb_writer }</p>
	<p>작성일 : ${album.alb_reg_date}</p>
	<p>좋아요 : ${album.likeCnt}</p>
	<a href="likeUp.do?alb_id=${album.alb_id}&alb_writer=${sessionScope.user.user_Id}&party_id=${album.party_id}">
	<button>좋아요</button>
	</a>
</body>
</html>