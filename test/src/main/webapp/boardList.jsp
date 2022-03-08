 	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임- 게시글 리스트</title>
</head>
<body>
<header>
</header>
<section>
	<button onclick="location.href='boardWrite.jsp?party_id=${party_id}';">게시글 쓰기</button>
	<c:if test="${empty boardList }">
		<button onclick="location.href='boardWrite.jsp?party_id=${party_id}';">첫 게시물 작성</button>
	</c:if>
	<c:forEach items="${boardList}" var="board">
		<div style="display:flex;">
			<div><a href="getBoard.jsp?art_id=${board.art_id}">
				&ensp; <img src="${board.art_img_path}" width=200 height=200 />
			</a></div>
			<div><a href="getBoard.jsp?art_id=${board.art_id}">
				&ensp; ${board.art_title}
			</a></div>
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
		</div>
		<hr />
	</c:forEach> 
	<c:if test="${pages.hasBoard()}">
	<div>
		<tr>
			<td colspan="4">
				<c:if test ="${pages.startPage > pages.pageSize}">
				<a href="getBoardList.do?party_id=1&pageNo=${pages.startPage - pages.pageSize }">[이전]</a>
				</c:if>
			<c:forEach var="pNo" 
					begin="${pages.startPage}"
					end="${pages.endPage}">
			<a href="getBoardList.do?party_id=1&pageNo=${pNo}">[${pNo}]</a>
			</c:forEach>
			<c:if test="${pages.endPage < pages.totalPages }" >
			<a href="getBoardList.do?party_id=1&pageNo=${pages.startPage + pages.pageSize }"> [다음]</a>
			</c:if>
			</td>
		</tr>
	</div>
	</c:if>

	
</section>
<footer>
</footer>
</body>
</html>