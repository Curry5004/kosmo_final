<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ �ۼ�</title>
</head>


<body>


 <form action="insertSchedule.do" method="POST" name="sch_form">
 	<div>�����̸� : <input type="text" placeholder="������ �ۼ����ּ���." name="sch_title" id="title"/></div>
 	
 	<div>������ : <input type="text" placeholder="������ �̸��� �����ּ���." name="sch_writer" id="partyMember"></div>
 	
 	<div>��ġ : <input type="text" placeholder="��Ҹ� �Է����ּ���." name="sch_location" id="location"/></div>
 	
 	<div> <input type="date" name="sch_date"/></div>
 		<input type="hidden" name="party_id" value="1"/>
 	 <select id="member_count" name="sch_member_count">
 	 <option value="null">-�����ο���-</option>
	<%for(int i=1; i<=10;i++){ %>
	<option value="<%=i%>"><%=i +"��"%></option>
	<%} %>
	</select>
	

 <p><textarea cols="50" rows="10" placeholder="������ �ۼ����ּ���." id="content" name="sch_content"></textarea></p>
 
<div><input type="text" placeholder="������ �޸�� ���⿡~!"  name="sch_note"/></div>

<div><input type="submit" value="���� �����ϱ�" /></div>
 	</form>

</body>
</html>