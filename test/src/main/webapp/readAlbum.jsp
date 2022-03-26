<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<html>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<head>

<meta  charset="UTF-8">
<title>커넥트MBTI</title>
</head>
<style>
	h2 { text-align: center;}
  table { width: 100%;}
  textarea { width: 100%;}
 	#outter {
		display: block;
		width: 30%;
		margin: auto;
	}
</style>
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

<jsp:include page="Nav.jsp"/>

<body>

<h2> 앨범 보기</h2>
<br><br><br>

    <fmt:formatDate var="RegDate"	value="${album.alb_reg_date}" pattern="yyyy-MM-dd HH:mm:ss" />
	
	<p>작성자 : ${album.alb_writer } </p>
	
		<img src="${album.alb_img_path }"  />
	
    <p><div class="col text-right">좋아요 : ${album.likeCnt} 작성일 : ${RegDate}</div></p>
	


	<c:if test="${!likeList.containsKey(sessionScope.user.user_Id)}">
		<div class="col text-right">
		<a href="likeUp.do?alb_id=${album.alb_id}&alb_writer=${sessionScope.user.user_Id}&party_id=${album.party_id}">
			<button>좋아요</button>
		</a>
		  </div>
	</c:if>
	<c:if test="${likeList.containsKey(sessionScope.user.user_Id)}">
		<div class="col text-right">
		<a href="likeDown.do?alb_id=${album.alb_id}&alb_writer=${sessionScope.user.user_Id}&party_id=${album.party_id}">
			<button>좋아요 취소</button>
		</a>
	</c:if>
      </div>
	<c:forEach var="comment" items="${commentList}" varStatus="i">
		<fmt:formatDate var="formatRegDate"	value="${comment.alb_comment_reg_date}" pattern="yyyy-MM-dd HH:mm:ss" />
		<fmt:formatDate var="formatModDate"	value="${comment.alb_comment_mod_date}" pattern="yyyy-MM-dd hh:mm:ss" />
		<div style="border: 1px solid black">
		
			<p>${comment.alb_comment_content}</p>
			 <div class="col text-right">
			${comment.user_name}
			<c:if test="${empty formatModDate }">
				&ensp; ${formatRegDate}
			</c:if>
			<c:if test="${not empty formatModDate}">
					&ensp;  ${formatModDate} (수정됨)
			</c:if>
			</div>
			<c:if test="${sessionScope.user.user_Id==comment.user_id}">
				<div class="col text-right">
				<a href="#" data-toggle="modal" data-target="#${i.index}">수정</a>
				<a href="deleteAlbumComment.do?alb_comment_id=${comment.alb_comment_id}&alb_id=${album.alb_id}">삭제</a>
                </div>
				<div class="modal fade" id="${i.index}" data-backdrop="static"
					data-keyboard="false">
					<div class="modal-dialog modal-xl modal-dialog-centered">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">댓글 수정</h4><br />
								<div>
								
								</div>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<!-- Modal body -->
							<div class="modal-body">
								<form action="modifyAlbumComment.do?alb_comment_id=${comment.alb_comment_id}" method="POST">
								
								<textarea name="alb_comment_content" cols="30" rows="10">${comment.alb_comment_content}</textarea>
								<input type="hidden" name="party_id" value="${album.party_id}" /> 
								<input type="hidden" name="alb_id" value="${album.alb_id}" /> <br />
								 <div class="col text-right">
								 <input class="btn btn-primary" type="submit" value="수정">
								 	<button type="button" class="btn btn-secondary"
									data-dismiss="modal"> 취소 </button>
									</div>
								</form>
							</div>

							<!-- Modal footer -->
							<div class="modal-footer">
								
							</div>

						</div>
					</div>
				</div>
				
			</c:if>
		</div>
	</c:forEach>

	<div>
		<form action="writeAlbumComment.do?alb_id=${album.alb_id}"
			name="Reg_form" onsubmit="return check()">
			<textarea name="alb_comment_content" cols="30" rows="3" id="comment"></textarea>
			<input type="hidden" name="party_id" value="${album.party_id}" /> 
			<input type="hidden" name="alb_id" value="${album.alb_id}" /> 
			<div class="col text-right">
			<input class="btn btn-primary btn-sm" type="submit" value="댓글 등록" />
			</div>
		</form>
	</div>
   <div class="col text-center">
	<button class="btn btn-primary btn-lg" onclick ="location.href='getAlbumList.do?party_id=${album.party_id}';">돌아가기</button>
    </div>
	
</body>
</html>