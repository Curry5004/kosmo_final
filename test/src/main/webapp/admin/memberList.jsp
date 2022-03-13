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
<br/>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>MBTI 타입</th>
			<th>MBTI 결과지</th>
			<th>회원현황</th>
			<th>관리</th>
		</tr>
		<c:forEach items="${memberList}" var="member">

	 	<tr>
	 		<td>${member.user_Id }</td>
	 		<td>${member.name }</td>
	 		<td>${member.mbti_Name }</td>
	 		<td>
	 			<a href="img\TEST.jpg" target="_blank">
					결과지 보기
				</a>
			</td>
			<td>${member.request }</td>
			<td>
			<c:if test="${member.request eq false}">
				<a href="confirmMember.do?user_Id=${member.user_Id }">정식맴버</a>
				<a href="deleteUser.do?user_Id=${member.user_Id }">거절하기</a>
			</c:if>
			<c:if test="${member.request eq true}">
				<a href="deleteUser.do?user_Id=${member.user_Id }">강제 회원탈퇴</a>
			</c:if>
			</td>
			
		 </tr>
		</c:forEach> 
	</table>
	

	<c:if test="${pages.hasBoard()}">
	<div>
		<tr>
			<td colspan="4">
				<c:if test ="${pages.startPage > pages.pageSize}">
				<a href="getAdminMemberList.do?pageNo=${pages.startPage - pages.pageSize }">[이전]</a>
				</c:if>
			<c:forEach var="pNo" 
					begin="${pages.startPage}"
					end="${pages.endPage}">
			<a href="getAdminMemberList.do?pageNo=${pNo}">[${pNo}]</a>
			</c:forEach>
			<c:if test="${pages.endPage < pages.totalPages }" >
			<a href="getAdminMemberList.do?pageNo=${pages.startPage + pages.pageSize }"> [다음]</a>
			</c:if>
			</td>
		</tr>
	</div>
	</c:if>
</body>
</html>