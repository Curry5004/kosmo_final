<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>Insert title here</title>
</head><body>
	<c:forEach items="${PartyList}" var="party">
		<div style="display:flex;">
			<div><a href="search.jsp?PARTY_ID=${party.PARTY_ID}"> 
				&ensp; <img src="${party.PARTY_TUMB_PATH}" width=200 height=200 />
			</a></div>
			<div><a href="search.jsp?PARTY_ID=${party.PARTY_ID}">
				&ensp; ${party.PARTY_TITLE}
			</a></div>
			<div style="float:right">
		 <fmt:formatDate var="formatRegDate" value="${party.PARTY_REG_DATE}" pattern="yyyy-MM-dd"/>
				&ensp; 작성자: ${party.PARTY_CREATOR}
				&ensp; 카테고리: ${party.CATEGORY_NAME}
				&ensp; 작성일: ${formatRegDate}
	
			</div>
		</div>
		<hr />
	</c:forEach>   

  	
  	<c:if test="${pages.hasParty()}">
	<div>
		<tr>
			<td colspan="4">
				<c:if test ="${pages.startPage > pages.pageSize}">
				<a href="getPartyList.do?party_id=1&pageNo=${pages.startPage - pages.pageSize }">[이전]</a>
				</c:if>
			<c:forEach var="pNo"
					begin="${pages.startPage}"
					end="${pages.endPage}">
			<a href="getPartyList.do?party_id=1&pageNo=${pNo}">[${pNo}]</a>
			</c:forEach>
			<c:if test="${pages.endPage < pages.totalPages }" >
			<a href="getPartyList.do?party_id=1&pageNo=${pages.startPage + pages.pageSize }"> [다음]</a>
			</c:if>
			</td>
		</tr>
	</div>
	</c:if>
	
	
  	
</body>

</html>