<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>${pageName }</h1>
</br>
	<%int i = 0;%>
	<c:forEach items="${boardList}" var="board">
			<div style="display:inline-block;">
				<div><a href="../getParty.do?PARTY_ID=${board.PARTY_ID}">
					&ensp; <img src="${board.PARTY_TUMB_PATH}" width=200 height=200 />
				</a></div>
				<div><a href="../getParty.do?PARTY_ID=${board.PARTY_ID}">
					&ensp; ${board.PARTY_ID}파티 번호
				</a></div>
				<% i++; %>
			</div>
		<% if (i%3==0) {%>
			</br>
		<%} %>
	</c:forEach> 
	<c:if test="${pages.hasBoard()}">
	<div>
		<tr>
			<td colspan="4">
				<c:if test ="${pages.startPage > pages.pageSize}">
				<a href="getPartyList.do?pageNo=${pages.startPage - pages.pageSize }">[이전]</a>
				</c:if>
			<c:forEach var="pNo" 
					begin="${pages.startPage}"
					end="${pages.endPage}">
			<a href="getPartyList.do?pageNo=${pNo}">[${pNo}]</a>
			</c:forEach>
			<c:if test="${pages.endPage < pages.totalPages }" >
			<a href="getPartyList?pageNo=${pages.startPage + pages.pageSize }"> [다음]</a>
			</c:if>
			</td>
		</tr>
	</div>
	</c:if>
</body>
</html>