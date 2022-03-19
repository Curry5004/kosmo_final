<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>스케쥴 작성</title>
</head>

<script>
	function dateSelect() {
		console.log("되냐?");
		var div = document.getElementById("date");
		var modalInput = document.getElementById("modalInput");
		div.innerHTML=modalInput.value;
	}
</script>

<style>
	#date{
		border: 1px solid black;
		width : 10%;
		height : 25px;
		text-align: center;
	}
</style>

<body>
<jsp:include page="Nav.jsp"/>

	<div class="container">
<div class="row">
<div class="btn-group">
  <button type="button" class="btn btn-primary" onclick="location.href='getParty.do?PARTY_ID=${param.party_id}'">소개글</button>
  <button type="button" class="btn btn-primary" onclick="location.href='getBoardList.do?party_id=${param.party_id}'">게시판</button>
  <button type="button" class="btn btn-primary" onclick="location.href='getAlbumList.do?party_id=${param.party_id}'">앨범</button>
  <button type="button" class="btn btn-primary" onclick="location.href='calendar.do?party_id=${param.party_id}'">일정</button>
  <button type="button" class="btn btn-primary" onclick="location.href=''">채팅</button>
  <c:if test="${party.PARTY_CREATOR eq user.user_Id}">
  <button type="button" class="btn btn-primary" onclick="location.href='getPartyUserList.do?PARTY_ID=${param.party_id}'">회원관리</button>
  </c:if>
</div>
</div>
</div>



	<div class="container pt-5">
		<div class="row">
		<div class="mb-3 mt-3">
 	<form action="insertSchedule.do" method="POST" name="sch_form">
 	<label for="email" class="form-label">제목 :</label>
 	<input class="form-control" type="text" placeholder="제목을 작성해주세요." name="sch_title" id="title"/>
 	
 	<input type="hidden" name="sch_writer" value=${sessionScope.user.name }>
 	<input type="hidden" name="user_id" value=${sessionScope.user.user_Id }>
 	<label for="email" class="form-label">위치 :</label>
 	
    <input class="form-control" type="text" placeholder="장소를 입력해주세요." name="sch_location" id="location"/>
    
    <br />
    <br />
    
 	<div id="date"></div>
  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
  	모임날짜 정하기
</button>

<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">날짜를 선택해주세요</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <input class ="form-control" type="Date" name="sch_date" id="modalInput"/>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" onclick="dateSelect()">확인</button>
      </div>

    </div>
  </div>
</div>
   
  <br />
  <br />
   
   
 	 <select class ="form-select" id="member_count" name="sch_member_count">
 	 <option value="null">-참가인원수-</option>
	<%for(int i=1; i<=10;i++){ %>
	<option value="<%=i%>"><%=i +"명"%></option>
	<%} %>
	</select>
	
	<br />
	<br />
	

 <textarea class="form-control" cols="50" rows="10" placeholder="내용을 작성해주세요." id="content" name="sch_content"></textarea>
 <br />
 <br />
	<input class="form-control" type="text" placeholder="간단한 메모는 여기에~!"  name="sch_note"/>
<br />
<br />
	<input class="btn btn-primary" type="submit" value="정모 생성하기" />

	<input type="hidden" name="party_id" value="${param.party_id }"/>

 	</form>
 			</div>
 		</div>
 	</div>
 	
 	<jsp:include page="footer.jsp"/>
 	
</body>
</html>