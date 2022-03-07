
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>소모임-게시글 수정하기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
<div class="container" style="margin-top:30px">
	<div class="row">
		<form method="post" action="updateBoard.do" enctype="multipart/form-data">
			
	      <h1>게시글 수정하기</h1>

<div class="form-group">
	<div style="float:center">
		 <fmt:formatDate var="formatRegDate" value="${board.art_reg_date}" pattern="yyyy-MM-dd"/>
		 <fmt:formatDate var="formatModDate" value="${board.art_mod_date}" pattern="yyyy-MM-dd"/>
				&ensp; 작성자: ${board.art_writer}
				&ensp; 조회수: ${board.art_view_cnt }
		 <c:if test="${empty formatModDate }">
				&ensp; 작성일: ${formatRegDate}
		</c:if>
		<c:if test="${not empty formatModDate}">
				&ensp; 작성일: ${formatRegDate}
				&ensp; 수정일: ${formatModDate}
		</c:if>
			</div>

				  <label for="usr">제목:</label>
				  <input type="text" class="form-control" id="title" name = "art_title">
				  
				</div>
		
			    <div class="form-group">
				  <label for="comment">내용:</label>
				   
				  <textarea class="form-control" rows="5" id="contents" name = "art_content"></textarea>
				  
				</div>
				 <div class="form-group">  
				 	이미지 삽입 : 
					<input type="file" name="art_img" accept=".jpeg, .jpg, .png"/>
			    </div>
               <div>
                       <button type="submit" class="btn btn-primary">수정</button>
                </div>
	  </form>
		</div>
	</div>
</body>
</html>

