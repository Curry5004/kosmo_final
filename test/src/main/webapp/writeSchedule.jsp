<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>스케쥴 작성</title>
</head>


<body>


 <form action="insertSchedule.do" method="POST" name="sch_form">
 	<div>정모이름 : <input type="text" placeholder="제목을 작성해주세요." name="sch_title" id="title"/></div>
 	
 	<div>주최자 : <input type="text" placeholder="주최자 이름을 적어주세요." name="sch_writer" id="partyMember"></div>
 	
 	<div>위치 : <input type="text" placeholder="장소를 입력해주세요." name="sch_location" id="location"/></div>
 	
 	<div> <input type="date" name="sch_date"/></div>
 		<input type="hidden" name="party_id" value="1"/>
 	 <select id="member_count" name="sch_member_count">
 	 <option value="null">-참가인원수-</option>
	<%for(int i=1; i<=10;i++){ %>
	<option value="<%=i%>"><%=i +"명"%></option>
	<%} %>
	</select>
	

 <p><textarea cols="50" rows="10" placeholder="내용을 작성해주세요." id="content" name="sch_content"></textarea></p>
 
<div><input type="text" placeholder="간단한 메모는 여기에~!"  name="sch_note"/></div>

<div><input type="submit" value="정모 생성하기" /></div>
 	</form>

</body>
</html>