
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>소모임-게시글 보기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
<div class="container" style="margin-top:30px">
	<div class="row">
		<form method="post" action="insertBoard.do" enctype="multipart/form-data">
			
	      <h1>게시글 보기</h1>

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
			<div class="form-group">
				  &ensp; 제목: ${board.art_title}
                     
				  
				</div>

			    <div class="form-group">
				 
				 
				 &ensp; 내용: ${board.art_content}
				   
				  
				</div>
			    <div>
                <button class="btnUpdate">수정</button>
				<button class="btnDelete">삭제</button>
				<button class="btnList">돌아가기</button>
				</div>
				</div>
	    </form>
	</div>
	</div>
</body>
</html>

