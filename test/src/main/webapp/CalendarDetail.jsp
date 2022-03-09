<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="css/style.css">
</head>

<script language="javascript">
	function check() {
		var checked_rate1 = document.querySelector('input[name = "rate1"]:checked');
		var checked_rate2 = document.querySelector('input[name = "rate2"]:checked');
		var checked_rate3 = document.querySelector('input[name = "rate3"]:checked');

		if(checked_rate1 == null){
		alert('평가1 미체크');
		return false;
		}
		else if(checked_rate2 == null){
		alert('평가2 미체크');
		return false;
		}
		else if(checked_rate3 == null){
		alert('평가3 미체크');
		return false;
		}
		
	}
</script>
<body>
	<c:if test="${index>0}">
	<a class="btn btn-primary" href="calendar2.do?year=${year}&month=${month}&party_id=${SchDetail[index].party_id}&index=${index-1}" role="button">이전</a><br />
	</c:if>
	<c:if test="${index<fn:length(index)}">
	<a class="btn btn-primary" href="calendar2.do?year=${year}&month=${month}&party_id=${SchDetail[index].party_id}&index=${index+1}" role="button">다음</a><br />
	</c:if>
	<a class="btn btn-primary" href="calendar.do?year=${year}&month=${month}&day=1&party_id=${SchDetail[index].party_id}" role="button">달력</a><br />
	<div>
	<p>제목 : ${SchDetail[index].sch_title}</p>
	<p>작성자 : ${SchDetail[index].sch_writer} </p>
	<p>위치 : ${SchDetail[index].sch_location} </p>
	<p>내용 : ${SchDetail[index].sch_content}</p>
	<p>메모 : ${SchDetail[index].sch_note}</p>
	<p>최대인원 : ${SchDetail[index].sch_member_count}</p>
	<p>날짜 : ${SchDetail[index].sch_date}</p>
	
	</div>
	<form action="scheduleReview.do" method="post" name="Reg_form"
		onsubmit="return check()">
		<span>평가1</span><br />
		<input type="radio" name="rate1" value="1"/>
		<input type="radio" name="rate1" value="2"/>
		<input type="radio" name="rate1" value="3"/>
		<input type="radio" name="rate1" value="4"/>
		<input type="radio" name="rate1" value="5"/><br />
		<span>평가2</span><br />
		<input type="radio" name="rate2" value="1"/>
		<input type="radio" name="rate2" value="2"/>
		<input type="radio" name="rate2" value="3"/>
		<input type="radio" name="rate2" value="4"/>
		<input type="radio" name="rate2" value="5"/><br />
		<span>평가3</span><br />
		<input type="radio" name="rate3" value="1"/>
		<input type="radio" name="rate3" value="2"/>
		<input type="radio" name="rate3" value="3"/>
		<input type="radio" name="rate3" value="4"/>
		<input type="radio" name="rate3" value="5"/><br />
		<input type="hidden" name="party_id" value="${SchDetail[0].party_id }"/>
		<input type="hidden" name="sch_id" value="${SchDetail[0].sch_id }"/>
		<input type="hidden" name="user_id" value="${sessionScope.user.user_Id }"/>
		<input class="btn btn-primary" type="submit" value="작성">
	</form>

</body>
</html>