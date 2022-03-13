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
	<table border="1">
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
	

	<c:if test="${pages.hasParty()}">
	<div>
		<tr>
			<td colspan="4">
				<c:if test ="${pages.startPage > pages.pageSize}">
				<a href="getPartyUserList.do?pageNo=${pages.startPage - pages.pageSize }&PARTY_ID=${param.PARTY_ID}">[이전]</a>
				</c:if>
			<c:forEach var="pNo" 
					begin="${pages.startPage}"
					end="${pages.endPage}">
			<a href="getPartyUserList.do?pageNo=${pNo}&PARTY_ID=${param.PARTY_ID}">[${pNo}]</a>
			</c:forEach>
			<c:if test="${pages.endPage < pages.totalPages }" >
			<a href="getPartyUserList.do?pageNo=${pages.startPage + pages.pageSize }&PARTY_ID=${param.PARTY_ID}"> [다음]</a>
			</c:if>
			</td>
		</tr>
	</div>
	</c:if>
</body>
</html>