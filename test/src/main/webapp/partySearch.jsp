<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커넥트MBTI</title>
</head>
<body>
	<form action="getPartyList.do" method="get">
		<select name="CATEGORY_NAME">
			<option value ="" selected>선택</option>
			
			<option value ="인문학/책/글">인문학/책/글</option>
			<option value ="아웃도어/여행">아웃도어/여행</option>
			<option value ="운동/스포츠">운동/스포츠</option>
			<option value ="업종/직무">업종/직무</option>
			<option value ="외국/언어">외국/언어</option>
			<option value ="문화/공연/축제">문화/공연/축제</option>
			<option value ="음악/악기">음악/악기</option>
			<option value ="공예/만들기">공예/만들기</option>
			<option value ="댄스/무용">댄스/무용</option>
			<option value ="봉사활동">봉사활동</option>
			<option value ="사교/인맥">사교/인맥</option>
			<option value ="차/오토바이">차/오토바이</option>
			<option value ="사진/영상">사진/영상</option>
			<option value ="야구관람">야구관람</option>
			<option value ="게임/오락">게임/오락</option>
			<option value ="요리/제조">요리/제조</option>
			<option value ="뱐려동물">뱐려동물</option>
			<option value ="가족/결혼">가족/결혼</option>
			<option value ="자유주제">자유주제</option>
		</select>
		<br />
		<input name="SEARCH_KEYWORD" type="text"></input>
		<input type="submit"></input>
	</form>
</body>
</html>