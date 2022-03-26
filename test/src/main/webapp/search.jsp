<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;900&display=swap');
.pagination{
	 justify-content : center;
}
 body {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>커넥트MBTI</title>
</head>

<body>
<% request.setCharacterEncoding("UTF-8");
String name = request.getParameter("CATEGORY_NAME");
String keyword = request.getParameter("SEARCH_KEYWORD");
pageContext.setAttribute("name", name);
pageContext.setAttribute("keyword",keyword);
%>

<jsp:include page="Nav.jsp"/>

		
<c:forEach items="${PartyList}" var="party">
	<div class="container pt-5" align="center">
		<div class="row">
			<div class="col">
  				<div class="card" style="width:500px">
  					<a href="getParty.do?PARTY_ID=${party.PARTY_ID}"> 
    				<img class="card-img-top" src="${party.PARTY_TUMB_PATH}" alt="Card image" style="width:100%">
    				</a>
   						 <div class="card-body">
   						 	<a href="getParty.do?PARTY_ID=${party.PARTY_ID}">
     						 <h4 class="card-title">${party.PARTY_TITLE}</h4>
     						 </a>
     						  <fmt:formatDate var="formatRegDate" value="${party.PARTY_REG_DATE}" pattern="yyyy-MM-dd"/>
     			   <p class="card-text">&ensp; 작성자: ${party.PARTY_CREATOR}
									  	&ensp; 카테고리: ${party.CATEGORY_NAME}
										&ensp; 작성일: ${formatRegDate}</p>
   				 		</div>
  				</div>
 					 <br>
			</div>
		</div>
	</div>
</c:forEach>


	<div class="container pt-5" align="center">
		<div class="row"> 
			<div class="col " >
 <c:if test="${pages.hasParty()}">
<ul class="pagination" >
<c:if test ="${pages.startPage > pages.pageSize}">
  <li class="page-item " ><a class="page-link" href="getPartyList.do?CATEGORY_NAME=${name}&SEARCH_KEYWORD=${keyword}&pageNo=${pages.startPage - pages.pageSize }">이전</a></li>
  </c:if>
 <c:forEach var="pNo"
					begin="${pages.startPage}"
					end="${pages.endPage}">
  <li class="page-item"><a class="page-link" href="getPartyList.do?CATEGORY_NAME=${name}&SEARCH_KEYWORD=${keyword}&pageNo=${pNo}">${pNo}</a></li>
  </c:forEach>
  <c:if test="${pages.endPage < pages.totalPages }" >
  <li class="page-item"><a class="page-link" href="getPartyList.do?CATEGORY_NAME=${name}&SEARCH_KEYWORD=${keyword}&pageNo=${pages.startPage + pages.pageSize }">다음</a></li>
  </c:if>
</ul>
	</c:if>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
  	
</body>

</html>