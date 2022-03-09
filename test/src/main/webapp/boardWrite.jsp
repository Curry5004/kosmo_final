<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<title>소모임-게시글 작성하기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 	<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>

</head>
<body>
<a class="btn btn-primary" href="getParty.do?PARTY_ID=${param.party_id}" role="button">소개글</a>
<a class="btn btn-primary" href="getBoardList.do?party_id=${param.party_id}" role="button">게시판</a>
<a class="btn btn-primary" href="getAlbumList.do?party_id=${param.party_id}" role="button">앨범</a>
<a class="btn btn-primary" href="index.jsp" role="button">채?팅?</a>
<div class="container" style="margin-top:30px">
	<div class="row">
		<form method="post" action="insertBoard.do" enctype="multipart/form-data">
			
	      <h1>게시글 작성하기</h1>
				<div class="form-group">
				  <label for="usr">제목:</label>
				  <input type="text" class="form-control" id="title" name = "art_title">
				  
				</div>
		<div style="float:right">
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
				  <label for="comment">내용:</label>
				   
				  <textarea class="form-control" rows="5" id="contents" name = "art_content"></textarea>
				  
				</div>
				 <div class="form-group">  
				 	이미지 삽입 : 
					<input type="file" name="art_img" accept=".jpeg, .jpg, .png"/>
			    </div>
			    <input type="hidden" value="${sessionScope.user.user_Id }" name="art_writer"/>
			    <input type="hidden" value="${param.party_id }" name="party_id"/>
			    <button type="submit" class="btn btn-primary">작성완료</button>
			  </form>
		</div>
	</div>
	${sessionScope.user.user_Id}로 로그인중
</body>
</html>