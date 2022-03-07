<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<html>
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
<style>
        #modal {
          display: none;
          position:relative;
          width:100%;
          height:100%;
          z-index:1;
        }
        
        #modal h2 {
          margin:0;
        }
        #modal button {
          display:inline-block;
          width:100px;
          margin-left:calc(100% - 100px - 10px);
        }
        
        #modal .modal_content {
          width:300px;
          margin:100px auto;
          padding:20px 10px;
          background:#fff;
          border:2px solid #666;
        }
        
        #modal .modal_layer {
          position:fixed;
          top:0;
          left:0;
          width:100%;
          height:100%;
          background:rgba(0, 0, 0, 0.5);
          z-index:-1;
        }   
</style> 

<body>
	<img src="${album.alb_img_path }" alt="테스트" />
	<p>작성자 : ${album.user_id }</p>
	<p>작성일 : ${album.alb_reg_date}</p>
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
	
	<c:forEach var="comment" items="${commentList}">
		<fmt:formatDate var="formatRegDate" value="${comment.alb_comment_reg_date}" pattern="yyyy-MM-dd HH:MM:ss"/>
		 <fmt:formatDate var="formatModDate" value="${comment.alb_comment_mod_date}" pattern="yyyy-MM-dd"/>
		<div style="border: 1px solid black">
			<p>${comment.user_id}</p>
			<p>${comment.alb_comment_content}</p>
			<p>${formatRegDate}</p>
			<form action=""></form>
			<a href="modifyAlbumComment.do?alb_comment_id=${comment.alb_comment_id}">수정</a>
			<a href="deleteAlbumComment.do?alb_comment_id=${comment.alb_comment_id}&alb_id=${album.alb_id}">삭제</a>
		</div>
	</c:forEach>
	
	<div>
	<form action="writeAlbumComment.do?alb_id=${album.alb_id}" name="Reg_form" onsubmit="return check()">
	<textarea name="alb_comment_content" cols="30" rows="3" id="comment"></textarea>
	<input type="hidden" name="party_id" value="${album.party_id}"/>
	<input type="hidden" name="alb_id" value="${album.alb_id}"/>
	<input type="submit" value="댓글 등록" />
	</form>
	</div>
</body>
</html>