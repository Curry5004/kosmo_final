<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<head>
<meta charset="UTF-8">
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

<body>
<jsp:include page="Nav.jsp"/>


<h2>게시판 보기</h2>
<br><br><br>
	
	<input type="hidden" name = "party_id" value="${param.party_id}">
	<div class="col text-right">
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
		     
			<td>제목:&ensp;${board.art_title}</td>
		
	
			<td>
			<div class="col text-right">
				작성자:&ensp;${board.art_user_name}
			</div>
			</td>
		</tr>
		<tr>
			<td>
			
			<div style="height: 300px; margin: 10px; display: inline-block">
			<div class="card-body"><img src="${board.art_img_path}" width=200 height=200 />
			</div>
			${board.art_content }
			</div>
			</td>
			
		</tr>
	</table>
	<c:if test="${board.art_writer==sessionScope.user.user_Id||leader.USER_ID==sessionScope.user.user_Id}">
	
    <div class="col text-right">
    <button class="btn btn-success" onclick ="location.href='modifyBoard.do?art_id=${board.art_id}';">수정하기</button>
    <button class="btn btn-danger" onclick ="location.href='deleteBoard.do?art_id=${board.art_id}&party_id=${board.party_id}';">삭제하기</button>
	</div>
	</c:if>
<c:forEach var="comment" items="${commentList}" varStatus="i" >
		<fmt:formatDate var="formatRegDate" value="${comment.art_comment_reg_date}" pattern="yyyy-MM-dd HH:MM:ss"/>
		 <fmt:formatDate var="formatModDate" value="${comment.art_comment_mod_date}" pattern="yyyy-MM-dd HH:MM:ss"/>
		<div style="border: 1px solid black">
		
			<p>${comment.art_comment_content}</p>
			 <div class="col text-right">
			${comment.art_comment_user_name}
			<c:if test="${empty formatModDate }">
				&ensp; ${formatRegDate}
			</c:if>
			<c:if test="${not empty formatModDate}">
					&ensp;  ${formatModDate} (수정됨)
			</c:if>
			</div>
			<c:if test="${sessionScope.user.user_Id==comment.art_comment_writer}">
            <div class="col text-right">
			<a href="#" data-toggle="modal" data-target="#${i.index}">수정</a>
			 <a href="deleteBoardComment.do?art_comment_id=${comment.art_comment_id}&art_id=${board.art_id}">삭제</a>
			</div>
			<div class="modal fade" id="${i.index}" data-backdrop="static"
					data-keyboard="false">
					<div class="modal-dialog modal-xl modal-dialog-centered">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">댓글수정</h4><br />
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
		<form action="writeBoardComment.do?art_id=${board.art_id}"
			name="Reg_form" onsubmit="return check()">
			<textarea name="art_comment_content" cols="30" rows="3" id="comment"></textarea>
			<input type="hidden" name="party_id" value="${board.party_id}" /> 
			<input type="hidden" name="art_id" value="${board.art_id}" /> 
			<div class="col text-right">
			<input class="btn btn-primary btn-sm" type="submit" value="댓글 등록" />
			</div>
		</form>
	</div>
	
		 <div class="col text-center">
	<button class="btn btn-primary btn-lg" onclick ="location.href='getBoardList.do?party_id=${board.party_id}';">돌아가기</button>
       </div>
<jsp:include page ="footer.jsp"/>
</body>
</html>
