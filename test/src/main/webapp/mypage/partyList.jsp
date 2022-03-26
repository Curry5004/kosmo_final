<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커넥트MBTI</title>
   <!-- #BOOTSTRAP 5.1.3 합쳐지고 최소화된 최신 CSS -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
   <!-- #BOOTSTRAP 5.1.3 합쳐지고 최소화된 최신 CSS -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    
    
    <!--  
    <style>
        #modal.modal-open {
            display: none;
        }
      .button {
        background-color: blue;      
        border: none;      
        color: white;      
        padding: 15px 30px;      
        text-align: center;      
        text-decoration: none;
        display: inline-block;      
        font-size: 16px;      
        margin: 4px 2px;      
        cursor: pointer;      
      }
      ul {
         padding: 0;
         margin: 0;
         height: 100%;
      }
      li a {
         display: inline-block;
         color: black;
         padding: 8px 16px;
         font-weight: bold;
         text-decoration: none;
      }
      .abc {
         display: inline-block;
         float: left;
         width: 13%;
         text-align : left;
         line-height: 30px;
         margin-top : 10px;
         margin-right : 0px;
      }
      h4 {
         display: inline-block;
         margin-left: 100px;
      }
      table {
         text-align : center;
         width: 600px;
         margin-top : 80px;
      }
      table, td, th {
         border-collapse : collapse;
         border : 1px solid black;
      }
      #wrap {
         position: absolute;
         top : 50px;
         right: 450px;
         bottom: 0;
      }
      a { 
         text-decoration:none
      }
      
      footer{
         text-align:center
      }
      ul {
         justify-content: center
      } 
      
    </style>
     -->
</head>
<body>
<jsp:include page="Nav.jsp"/>
      
      <div class="container pt-5">
      	<div class="row">
      	<div class="col-sm-2">
     <div class="list-group">
     	<a class="list-group-item list-group-item-action list-group-item-secondary" href="getUserInfo.do">1.개인정보 관리</a>
     	<a class="list-group-item list-group-item-action list-group-item-secondary" href="getPartyList.do">2.내가 가입한 소모임</a>
     	<a class="list-group-item list-group-item-action list-group-item-secondary" href="getPartyFavList.do">3.내가 찜한 소모임</a>
     	<a class="list-group-item list-group-item-action list-group-item-secondary" href="getPartyCreatorList.do">4.생성한 소모임 관리</a>
     	<a class="list-group-item list-group-item-action list-group-item-secondary" href="../calendar3.do?user_id=${sessionScope.user.user_Id }">5.스케쥴러</a>
     	</div>
     	</div>
  <div class="col-sm-8">   	
<h4>${pageName }</h4>

   <%int i = 0;%>
   <c:forEach items="${boardList}" var="board">
         <div style="display:inline-block;">
            <div><a href="../getParty.do?PARTY_ID=${board.PARTY_ID}">
                <img src="../${board.PARTY_TUMB_PATH}" width=150 height=150 hspace=100/>
            </a></div>
            <div style="margin-left:100px;"><a href="../getParty.do?PARTY_ID=${board.PARTY_ID}">
               <button type="button" class="btn btn-primary" onclick="location.href='getPartyFavList.do'"> ${board.PARTY_ID}번 파티</button>
            </a></div>
            <% i++; %>
         </div>
      <% if (i%3==0) {%>
       
      <%} %>
     
   </c:forEach> 
  
   	</div>
   </div>
</div>
</body>

<c:if test="${pages.hasBoard()}">
 <div class="container pt-5">
 	<div class="row">
 		<div class="col-sm-3" style="float:none; margin:0 auto">
   <c:if test="${pageType eq 1}">
      
            <ul class="pagination">
            <c:if test ="${pages.startPage > pages.pageSize}">
                <li class="page-item"><a class="page-link" href="getPartyList.do?pageNo=${pages.startPage - pages.pageSize }">이전</a></li>
            </c:if>
            <c:forEach var="pNo" 
                              begin="${pages.startPage}"
                              end="${pages.endPage}">
             <li class="page-item"><a class="page-link" href="getPartyList.do?pageNo=${pNo}">${pNo}</a></li>
            </c:forEach>
            <c:if test="${pages.endPage < pages.totalPages }" >
            <li class="page-item"><a class="page-link" href="getPartyList.do?pageNo=${pages.startPage + pages.pageSize }">다음</a></li>
            </c:if> 
            </ul>
   
   </c:if>
   			</div>
   		</div>
   </div>
   
   <c:if test="${pageType eq 2}">
      <div class="container pt-5">
      	<div class="row">
      		<div class="col-sm-3"  style="float:none; margin:0 auto" >
            <ul class="pagination">
            <c:if test ="${pages.startPage > pages.pageSize}">
                <li class="page-item"><a class="page-link" href="getPartyFavList.do?pageNo=${pages.startPage - pages.pageSize }">이전</a></li>
            </c:if>
            <c:forEach var="pNo" 
                              begin="${pages.startPage}"
                              end="${pages.endPage}">
             <li class="page-item"><a class="page-link" href="getPartyFavList.do?pageNo=${pNo}">${pNo}</a></li>
            </c:forEach>
            <c:if test="${pages.endPage < pages.totalPages }" >
            <li class="page-item"><a class="page-link" href="getPartyFavList.do?pageNo=${pages.startPage + pages.pageSize }">다음</a></li>
            </c:if> 
            </ul>
            </div>
        </div>
     </div>
   </c:if>
   
   <c:if test="${pageType eq 3}">
     	<div class="container pt-5">
     		<div class="row">
     			<div class="col-sm-3">
            <ul class="pagination">
            <c:if test ="${pages.startPage > pages.pageSize}">
                <li class="page-item"><a class="page-link" href="getPartyCreatorList.do?pageNo=${pages.startPage - pages.pageSize }">이전</a></li>
            </c:if>
            <c:forEach var="pNo" 
                              begin="${pages.startPage}"
                              end="${pages.endPage}">
             <li class="page-item"><a class="page-link" href="getPartyCreatorList.do?pageNo=${pNo}">${pNo}</a></li>
            </c:forEach>
            <c:if test="${pages.endPage < pages.totalPages }" >
            <li class="page-item"><a class="page-link" href="getPartyCreatorList.do?pageNo=${pages.startPage + pages.pageSize }">다음</a></li>
            </c:if> 
            </ul>
            	</div>
            </div>
       </div>
  		 </c:if>

	</c:if>

</html>