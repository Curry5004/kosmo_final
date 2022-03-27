<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<title>커넥트MBTI</title>
</head>
 
<body>
<jsp:include page="Nav.jsp"/>


<div class="container">
<div class="row">
<div class="btn-group">
  <button type="button" class="btn btn-primary" onclick="location.href='getParty.do?PARTY_ID=${param.PARTY_ID}'">소개글</button>
  <button type="button" class="btn btn-primary" onclick="location.href='getBoardList.do?party_id=${param.PARTY_ID}'">게시판</button>
  <button type="button" class="btn btn-primary" onclick="location.href='getAlbumList.do?party_id=${param.PARTY_ID}'">앨범</button>
  <button type="button" class="btn btn-primary" onclick="location.href='calendar.do?party_id=${param.PARTY_ID}'">일정</button>
  <button type="button" class="btn btn-primary" onclick="location.href='chatting.do?party_id=${param.PARTY_ID }'">채팅</button>
  <c:if test="${party.PARTY_CREATOR eq user.user_Id}">
  <button type="button" class="btn btn-primary" onclick="location.href='getPartyUserList.do?PARTY_ID=${param.PARTY_ID}'">회원관리</button>
  </c:if>
</div>
</div>
</div>

<div class="container pt-5 ">
<div class ="row">

<div class ="col-sm">
	<img src="${party.PARTY_TUMB_PATH}" width=200px  height="200">
</div>

<div class ="col-sm">

<div>${party.CATEGORY_NAME}</div>
<ul class="list-group">
<li class="list-group-item list-group-item-action list-group-item-info">${party.PARTY_PRE_MBTI1}</li>
<li class="list-group-item list-group-item-info">${party.PARTY_PRE_MBTI2}</li>
<li class="list-group-item list-group-item-info">${party.PARTY_PRE_MBTI3}</li>
<li class="list-group-item list-group-item-info">${party.PARTY_PRE_MBTI4}</li>
</ul>
</div>
</div>
</div>

<div class="container pt-5" >
<div class="row">
<ul class="list-group">
<li class="list-group-item list-group-item-action list-group-item-primary"> 친절도 : <fmt:formatNumber value="${rate.PARTY_RATE1 }" pattern=".0"/></li>
<li class="list-group-item list-group-item-action list-group-item-primary"> 만족도 : <fmt:formatNumber value="${rate.PARTY_RATE2 }" pattern=".0"/></li>
<li class="list-group-item list-group-item-action list-group-item-primary"> 가성비 : <fmt:formatNumber value="${rate.PARTY_RATE3 }" pattern=".0"/></li>
</ul>
</div>
</div>

<div class="container pt-5">
	<div class="row">
		<div class="col">
			
  
 		 	<textarea class="form-control" readonly="readonly">${party.PARTY_INTRODUCE}</textarea>
			
		</div>
	</div>
</div>


<div class="container pt-5">
<div class="row">

<div class="btn-group">
<c:if test="${memberList[0].USER_ID==sessionScope.user.user_Id}">
  <button type="button" class="btn btn-primary" onclick="location.href='deleteParty.do?PARTY_ID=${party.PARTY_ID}'">소모임 제거</button>
</c:if>
<c:if test="${!fn:contains(idList, sessionScope.user.user_Id)}">
  <button type="button" class="btn btn-primary" onclick="location.href='joinParty.do?PARTY_ID=${party.PARTY_ID}'">소모임 가입</button>
</c:if>
<c:if test="${fn:contains(idList, sessionScope.user.user_Id)}">
  <button type="button" class="btn btn-primary" onclick="location.href='deletePartyMember.do?PARTY_ID=${party.PARTY_ID}'">소모임 탈퇴</button>
</c:if>
<c:if test="${!fn:contains(favList, sessionScope.user.user_Id)}">
  <button type="button" class="btn btn-primary" onclick="location.href='memberFav.do?PARTY_ID=${party.PARTY_ID}&USER_ID=${user.user_Id}'">찜하기</button>
</c:if>
<c:if test="${fn:contains(favList, sessionScope.user.user_Id)}">
  <button type="button" class="btn btn-primary" onclick="location.href='deleteMemberFav.do?PARTY_ID=${party.PARTY_ID}&USER_ID=${user.user_Id}'">찜하기 취소</button>
</c:if>
</div>
</div>
</div>




<div class="container pt-5">
<div class="row">
<ul class="list-group">
<c:forEach var="member" items="${memberList}">
<li class="list-group-item list-group-item-action list-group-item-success">이름 : ${member.NAME} , MBTI : ${member.MBTI_NAME} </li>
</c:forEach>
</ul>
</div>
</div>

<div class="container-fluid">
  <div class="row">
 <div class="col-sm-6">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<canvas id="doughnut-chart" width="25px" height="10px"></canvas>

<script>new Chart(document.getElementById("doughnut-chart"), {
    type: 'doughnut',
    data: { 
      labels: ['${mbtiList[0].MBTI_NAME}','${mbtiList[1].MBTI_NAME}','${mbtiList[2].MBTI_NAME}','${{mbtiList[3].MBTI_NAME}}'],
      datasets: [
        {
          label: 'MBTI',
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
          data: ['${mbtiList[0].COUNT}','${mbtiList[1].COUNT}','${mbtiList[2].COUNT}','${mbtiList[3].COUNT}']
        }
      ]
    },
    options: {
      title: {
        display: true,
        text: 'MBTI 비율'
      }
    }
});
</script>
</div>
 <div class="col-sm-6">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<canvas id="doughnut-chart1" width="25px" height="10px"></canvas>

<script>new Chart(document.getElementById("doughnut-chart1"), {
    type: 'doughnut',
    data: { 
      labels: ['남자','여자'],
      datasets: [
        {
          label: '성별비율',
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
          data: ['${getGenderCount[0].GENDERCOUNT}','${getGenderCount[1].GENDERCOUNT}']
        }
      ]
    },
    options: {
      title: {
        display: true,
        text: '성별 비율'
      }
    }
});
</script>
</div>
</div>
</div>
    </body>
</html>
<jsp:include page ="footer.jsp"/>
</body>
</html>