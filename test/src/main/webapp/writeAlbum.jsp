<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>앨범 작성하기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>

<script language="javascript">
	function check() {

		var f = document.Reg_form;

		if (f.file.value == "") {
			alert("사진을 입력해주세요");
			f.file.focus();
			return false;
		}
		
	}
</script>
<body>
<div class="container" style="margin-top:30px">
	<div class="row">
		<form action="insertAlbum.do"  method="POST" enctype="multipart/form-data" name="Reg_form" onsubmit="return check()">
			
	      <h1>앨범 작성하기</h1>
		
			
				 	이미지 삽입 : 
					<input type="file" name="alb_img" accept=".jpeg, .jpg, .png" id="file"/>
					<input type="hidden" name="party_id" value="${param.party_id }"/>
			   
			    <button type="submit" class="btn btn-primary">작성완료</button>
			 </form>
		</div>
	</div>
</body>
</html>