<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>소모임 상세글</title>
</head>
<body>


<div>
	<img src="${party.PARTY_TUMB_PATH}" width=200px  height="200">
</div>

<div>${party.CATEGORY_NAME}</div>
<ul>
<li>${party.PARTY_PRE_MBTI1}</li>
<li>${party.PARTY_PRE_MBTI2}</li>
<li>${party.PARTY_PRE_MBTI3}</li>
<li>${party.PARTY_PRE_MBTI4}</li>
</ul>

<div  style="border: 1px solid black">${party.PARTY_INTRODUCE}</div>

<a href="deleteParty.do?PARTY_ID=${party.PARTY_ID}"><button>소모임제거</button></a>
<a href="joinParty.do?PARTY_ID=${party.PARTY_ID}"><button>소모임가입</button></a>

     
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<canvas id="doughnut-chart" width="25px" height="10px"></canvas>

<script>new Chart(document.getElementById("doughnut-chart"), {
    type: 'doughnut',
    data: { 
      labels: ['${mbtiList[1].MBTI_NAME}','${mbtiList[2].MBTI_NAME}','${mbtiList[3].MBTI_NAME}','${{mbtiList[4].MBTI_NAME}}'],
      datasets: [
        {
          label: 'MBTI',
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
          data: ['${mbtiList[1].COUNT}','${mbtiList[2].COUNT}','${mbtiList[3].COUNT}','${mbtiList[4].COUNT}']
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

    </body>
</html>
</body>
</html>