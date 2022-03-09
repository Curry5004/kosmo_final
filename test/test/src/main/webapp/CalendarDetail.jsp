<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세페이지 -모달창 활용할 jsp </title>
</head>
<body>
<header>
</header>
<section>
<c:forEach items="${SchDetail}" var="sDetail">
  <c:if test="${pages.hasBoard()}">	
			<td>
				<c:if test="${pages.startPage > pages.pageSize}">
				<a href="calendar2.do?&year=2022&month=03&party_id=1&pageNo=${pages.startPage - pages.pageSize}&sch_id=${sDetail.sch_id}">&#9664;</a>
				</c:if>
				<c:forEach var="pNo" 
					begin="${pages.startPage}"
					end="${pages.endPage}">
				<a href="calendar2.do?&year=2022&month=03&party_id=1&pageNo=${pNo}&sch_id=${sDetail.sch_id}">${sDetail.sch_title }</a>
				</c:forEach>
				<c:if test="${pages.endPage < pages.totalPages }" >
				<a href="calendar2.do?year=2022&month=03&party_id=1&pageNo=${pages.startPage + pages.pageSize }&sch_id=${sDetail.sch_id}">	&#9658;</a>
				</c:if>
			</td>
	</c:if>
	<table style="width: 500px; height: 400px">
	    <tr>
	        <td rowspan="5" >
	        	맵!!!!
	        </td>
	        <td>
	            주최자: ${sDetail.sch_writer} 
	        </td>
	    </tr>
	    <tr>
	        <td>
	           위치: ${sDetail.sch_location}
	        </td>
	    </tr>
	    <tr>
	        <td>
	            참가인원:  / 
	        </td>
	    </tr>
	    <tr >
	        <td style="display:flex;">
	            <button onclick=" ">참가하기 </button>
	            <button onclick=" "> 취소하기 </button>
	        </td>
	    </tr> 
	    <tr>
	        <td >
	            <button onclick="location.href=deleteSch.do?&sch_id=${sDetail.sch_id}">정모삭제하기 </button>
	        </td>
	    </tr>
	    <tr>
	        <td colspan="2">
	            ${sDetail.sch_content}
	        </td>
	    </tr>	
	    <tr>
	    	
	        <td colspan="2" >
	           <hr /> 
	           ${sDetail.sch_note}
	        </td>
	    </tr>
	</table> 
	</c:forEach>
</section>
<footer>
</footer>
</body>
</html>