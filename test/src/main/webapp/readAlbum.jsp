<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
<header>
<a class="btn btn-primary" href="getParty.do?PARTY_ID=${album.party_id}" role="button">소개글</a>
<a class="btn btn-primary" href="getBoardList.do?party_id=${album.party_id}" role="button">게시판</a>
<a class="btn btn-primary" href="getAlbumList.do?party_id=${album.party_id}" role="button">앨범</a>
<a class="btn btn-primary" href="calendar.do?party_id=${param.party_id}" role="button">일정</a>
<a class="btn btn-primary" href="index.jsp" role="button">채?팅?</a><br />
</header>
	<img src="${album.alb_img_path }" alt="테스트" />
	<p>작성자 : ${album.alb_writer }</p>
	<fmt:formatDate var="RegDate"	value="${album.alb_reg_date}" pattern="yyyy-MM-dd HH:mm:ss" />
	<p>작성일 : ${RegDate}</p>
	<p>좋아요 : ${album.likeCnt}</p>
	<c:if test="${!likeList.containsKey(sessionScope.user.user_Id)}">
		<a href="likeUp.do?alb_id=${album.alb_id}&alb_writer=${sessionScope.user.user_Id}&party_id=${album.party_id}">
			<button>좋아요</button>
		</a>
	</c:if>
	<c:if test="${likeList.containsKey(sessionScope.user.user_Id)}">
		<a href="likeDown.do?alb_id=${album.alb_id}&alb_writer=${sessionScope.user.user_Id}&party_id=${album.party_id}">
			<button>좋아요 취소</button>
		</a>
	</c:if>
s
	<c:forEach var="comment" items="${commentList}" varStatus="i">
	
	
	
	
		<fmt:formatDate var="formatRegDate"	value="${comment.alb_comment_reg_date}" pattern="yyyy-MM-dd HH:mm:ss" />
		<fmt:formatDate var="formatModDate"	value="${comment.alb_comment_mod_date}" pattern="yyyy-MM-dd hh:mm:ss" />
		<div style="border: 1px solid black">
			<p>${comment.user_name}</p>
			<p>${comment.alb_comment_content}</p>
			<c:if test="${empty formatModDate }">
				&ensp; ${formatRegDate}
			</c:if>
			<c:if test="${not empty formatModDate}">
					&ensp;  ${formatModDate} (수정됨)
			</c:if>
			<c:if test="${sessionScope.user.user_Id==comment.user_id}">
				<a href="#" data-toggle="modal" data-target="#${i.index}">수정</a>
				<a href="deleteAlbumComment.do?alb_comment_id=${comment.alb_comment_id}&alb_id=${album.alb_id}">삭제</a>

				<div class="modal fade" id="${i.index}" data-backdrop="static"
					data-keyboard="false">
					<div class="modal-dialog modal-xl modal-dialog-centered">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">모달테스트입니다</h4><br />
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
								 <input class="btn btn-primary" type="submit" value="수정">
								</form>
							</div>

							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal"> 취소 </button>
							</div>

						</div>
					</div>
				</div>
				<a href="deleteAlbumComment.do?alb_comment_id=${comment.alb_comment_id}&alb_id=${album.alb_id}">삭제</a>
			</c:if>
		</div>
	</c:forEach>

	<div>
		<form action="writeAlbumComment.do?alb_id=${album.alb_id}"
			name="Reg_form" onsubmit="return check()">
			<textarea name="alb_comment_content" cols="30" rows="3" id="comment"></textarea>
			<input type="hidden" name="party_id" value="${album.party_id}" /> 
			<input type="hidden" name="alb_id" value="${album.alb_id}" /> 
			<input type="submit" value="댓글 등록" />
		</form>
	</div>
</body>
</html>