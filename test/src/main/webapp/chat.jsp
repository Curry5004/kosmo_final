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



<script>
	
</script>

<body onload="time()">
<a class="btn btn-primary" href="getParty.do?PARTY_ID=${param.party_id}" role="button">소개글</a>
<a class="btn btn-primary" href="getBoardList.do?party_id=${param.party_id}" role="button">게시판</a>
<a class="btn btn-primary" href="getAlbumList.do?party_id=${param.party_id}" role="button">앨범</a>
<a class="btn btn-primary" href="index.jsp" role="button">채?팅?</a><br />
<br />
<span id="Datespan"></span>
<hr />
<br />



<div>
<!-- <form action="insertChat.do" name="Reg_form" id="form">
<textarea name="content" cols="30" rows="3" id="comment"></textarea>
<button type="submit" class="btn btn-primary">작성완료</button>
</form> -->

<h1>FETCH 테스트</h1>
<form class="form" id="myForm">
	<textarea name="content" cols="30" rows="3" id="content"></textarea>
	<button type="submit">작성완료</button>
</form>
</div>
</body>

<script language="javascript">
	
	const myForm = document.getElementById('myForm');
	
	myForm.addEventListener('submit',function(e){
		e.preventDefault();
		
		const formData = new FormData(this); 
		
		fetch('insertChat2.do',{
			method: 'post',
			body: formData
		}).then(function(response){
			return response.text();
		}).then(function(text){
			console.log(text);
			return text;
		}).then(function(){
			document.getElementById('content').value = "";
		})
		.then(function(error){
			console.error(error);
		})
	})
	
	function time() {
		var currentDate = new Date();
		var DateSpan = document.getElementById("Datespan");
		var msg ="비동기 테스트용 시간 - "+ currentDate.getHours()+" : "+currentDate.getMinutes()+" : "+currentDate.getSeconds();
		DateSpan.innerHTML = msg;
	}
	
	function check() {
		var f = document.Reg_form;

		if (f.content.value == "") {
			alert("내용을 입력해주세요");
			f.content.focus();
			return false;
		}
	}
	
	function name1() {
		fetch("insertChat2.do", {
			  method: "POST",
			  headers: {
			    "Content-Type": "application/json",
			  },
			  body: new FormData(document.getElementById("form")),
			}).then(function(res){
				  return res.json();
			})
			.then(function(json){
			  console.log(json);
			});
	}
	
</script>

</html>