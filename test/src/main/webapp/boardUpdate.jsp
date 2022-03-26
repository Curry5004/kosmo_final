
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<head>
<title>커넥트MBTI</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<jsp:include page="Nav.jsp"/>
<body>
<div class="container" style="margin-top:30px">
	<div class="row">
		<form method="post" action="updateBoard.do" enctype="multipart/form-data">
		<input type="hidden" name = "art_id" value="${param.art_id}">	
	      <h1>게시글 수정하기</h1>

<div class="form-group">

				  <label for="usr">제목:</label>
				  <input type="text" class="form-control" id="title" name = "art_title" value="${board.art_title}" >
				  
				</div>
		
			    <div class="form-group">
				  <label for="comment">내용:</label>
				   
				  <textarea class="form-control" rows="5" id="contents" name = "art_content" >${board.art_content}</textarea>
				  
				</div>
				 <div class="form-group">  
				 	이미지 삽입 : 
					<input type="file" name="art_img" accept=".jpeg, .jpg, .png"/>
			    </div>
         <div class="col text-center">
                       <button type="submit" class="btn btn-primary">수정완료</button>
               </div>
	  </form>
		</div>
	</div>
</body>
</html>

