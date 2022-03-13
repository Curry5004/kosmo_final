<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<head>
<meta charset=UTF-8">
<title>소모임-글 보기</title>
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
<body>

<h2>게시판 보기</h2>
<br><br><br>
	
	<input type="hidden" name = "party_id" value="${param.party_id}">
	<div style="float:center">
		 <fmt:formatDate var="formatRegDate" value="${board.art_reg_date}" pattern="yyyy-MM-dd"/>
		 <fmt:formatDate var="formatModDate" value="${board.art_mod_date}" pattern="yyyy-MM-dd"/>
				&ensp; 조회수: ${board.art_view_cnt }
		 <c:if test="${empty formatModDate }">
				&ensp; 작성일: ${formatRegDate}
		</c:if>
		<c:if test="${not empty formatModDate}">
				&ensp; 작성일: ${formatRegDate}
				&ensp; 수정일: ${formatModDate}
		</c:if>
			</div>
	<table border="1">
	
		<tr>
		     
			<td>제목:${board.art_title}</td>
		</tr>
		<tr>
			<td>
				작성자:${board.art_user_name}
			
			</td>
		</tr>
		<tr>
			<td><div style="height: 300px; margin: 10px; display: inline-block">
			
			<a><img src="${board.art_img_path}" width=200 height=200 /> </a>${board.art_content }
			
			</div></td>
		</tr>
	</table>
	<c:if test="${board.art_writer==sessionScope.user.user_Id||leader.USER_ID==sessionScope.user.user_Id}">
	<button><a href="modifyBoard.do?art_id=${board.art_id}">수정</a></button>
	<button><a href="deleteBoard.do?art_id=${board.art_id}&party_id=${board.party_id}">삭제</a></button>
	</c:if>
<c:forEach var="comment" items="${commentList}" varStatus="i" >
		<fmt:formatDate var="formatRegDate" value="${comment.art_comment_reg_date}" pattern="yyyy-MM-dd HH:MM:ss"/>
		 <fmt:formatDate var="formatModDate" value="${comment.art_comment_mod_date}" pattern="yyyy-MM-dd HH:MM:ss"/>
		<div style="border: 1px solid black">
			<p>${comment.art_comment_writer}</p>
			<p>${comment.art_comment_content}</p>
			<c:if test="${empty formatModDate }">
				&ensp; ${formatRegDate}
			</c:if>
			<c:if test="${not empty formatModDate}">
					&ensp;  ${formatModDate} (수정됨)
			</c:if>
			<c:if test="${sessionScope.user.user_Id==comment.art_comment_writer}">
			<a href="#" data-toggle="modal" data-target="#${i.index}">수정</a>
			
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
								<form action="modifyBoardComment.do?art_comment_id=${comment.art_comment_id}" method="POST">
								
								<textarea name="art_comment_content" cols="30" rows="10">${comment.art_comment_content}</textarea>
								<input type="hidden" name="party_id" value="${board.party_id}" /> 
								<input type="hidden" name="art_id" value="${board.art_id}" /> <br />
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
			
			
			
			<a href="deleteBoardComment.do?art_comment_id=${comment.art_comment_id}&art_id=${board.art_id}">삭제</a>
		</c:if>
		</div>
		
	</c:forEach>
<div>
		<form action="writeBoardComment.do?art_id=${board.art_id}"
			name="Reg_form" onsubmit="return check()">
			<textarea name="art_comment_content" cols="30" rows="3" id="comment"></textarea>
			<input type="hidden" name="party_id" value="${board.party_id}" /> 
			<input type="hidden" name="art_id" value="${board.art_id}" /> 
			<input type="submit" value="댓글 등록" />
		</form>
	</div>
	
		
	<button><a href="getBoardList.do?party_id=1">돌아가기</a></button>

</div>

</body>
</html>
