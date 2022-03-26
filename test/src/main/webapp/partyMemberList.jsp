<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.pagination{
	justify-content : center;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커넥트MBTI</title>
</head>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<body>
<jsp:include page="Nav.jsp"/>
	<div class="container pt-5">
		<div class="row">
	<table class="table table-hover">
		<tr>
			<th>아이디</th>
			<th>MBTI</th>
			<th>회원현황</th>
			<th>관리</th>
		</tr>
		<c:forEach items="${memberList}" var="member">
 
	 	<tr>
	 		<td>${member.USER_ID }</td>
	 		<td>${member.MBTI_NAME }</td>
	 		<td>${member.PARTY_REQUEST }</td>
			<td>
			<c:if test="${member.PARTY_REQUEST eq false}">
				<a href="confirmMember.do?user_Id=${member.USER_ID }&PARTY_ID=${param.PARTY_ID}">정식맴버승급</a>
				<a href="deleteReg.do?user_Id=${member.USER_ID }&PARTY_ID=${param.PARTY_ID}">거절하기</a>
			</c:if>
			<c:if test="${member.PARTY_REQUEST eq true}">
				<a href="deleteReg.do?user_Id=${member.USER_ID }&PARTY_ID=${param.PARTY_ID}">강제 회원탈퇴</a>
			</c:if>
			</td>
			
		 </tr>
		</c:forEach> 
	</table>
	</div>
	</div>
	
	
	<div class="container row" style="float: none; margin:100 auto;">
	 <div class="col-md-3" style="float: none; margin:0 auto;">

<c:if test="${pages.hasParty()}">
<ul class="pagination">
<c:if test ="${pages.startPage > pages.pageSize}">
  <li class="page-item"><a class="page-link" href="getPartyUserList.do?pageNo=${pages.startPage - pages.pageSize }&PARTY_ID=${param.PARTY_ID}">이전</a></li>
 </c:if>
 <c:forEach var="pNo" 
					begin="${pages.startPage}"
					end="${pages.endPage}">
  <li class="page-item"><a class="page-link" href="getPartyUserList.do?pageNo=${pNo}&PARTY_ID=${param.PARTY_ID}">${pNo}</a></li>
  </c:forEach>
<c:if test="${pages.endPage < pages.totalPages }" >
  <li class="page-item"><a class="page-link" href="getPartyUserList.do?pageNo=${pages.startPage + pages.pageSize }&PARTY_ID=${param.PARTY_ID}">다음</a></li>
</c:if>
</ul>
</c:if>
</div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>