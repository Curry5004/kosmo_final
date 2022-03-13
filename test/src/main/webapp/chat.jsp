<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script language="javascript">
	function check() {

		var f = document.Reg_form;

		if (f.comment.value == "") {
			alert("내용을 입력해주세요");
			f.comment.focus();
			return false;
		}
	}
</script>

<body>
<a class="btn btn-primary" href="getParty.do?PARTY_ID=${param.party_id}" role="button">소개글</a>
<a class="btn btn-primary" href="getBoardList.do?party_id=${param.party_id}" role="button">게시판</a>
<a class="btn btn-primary" href="getAlbumList.do?party_id=${param.party_id}" role="button">앨범</a>
<a class="btn btn-primary" href="index.jsp" role="button">채?팅?</a><br />
<br />
<hr />
<br />

<div>
<form action="writeChat.do" name="red_date">
<textarea name="content" cols="30" rows="3" id="comment"></textarea>
<button type="submit" class="btn btn-primary">작성완료</button>
</form>
</div>
</body>
</html>