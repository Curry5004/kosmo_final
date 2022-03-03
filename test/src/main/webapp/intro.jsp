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
</body>
</html>