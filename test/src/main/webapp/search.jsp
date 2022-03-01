<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form id="form" name="form" method="post">
    
	<table class="board">
		<colgroup>
			<col style="width:10%;">
		
        </colgroup>
       
		<tbody>
<tr><th>카테고리</th><td style="text-align: left; padding-left: 15px;">
    
      <input type="checkbox" id="category" name="category" value="ME"style="width: 15px;"> 인문학/책/글
  
      <input type="checkbox" id="category" name="category" value="ST"style="width: 15px;"> 아웃도어/여행
 
      <input type="checkbox" id="category" name="category" value="YG"style="width: 15px;"> 운동/스포츠
  
      <input type="checkbox" id="category" name="category" value="PI"style="width: 15px;"> 업종/직무

      <input type="checkbox" id="category" name="category" value="AE"style="width: 15px;"> 외국/언어

      <input type="checkbox" id="category" name="category" value="DA"style="width: 15px;"> 문화/공연/축제

      <input type="checkbox" id="category" name="category" value="MS"style="width: 15px;"> 음악/악기
  
      <input type="checkbox" id="category" name="category" value="HS"style="width: 15px;"> 공예/만들기
 
      <input type="checkbox" id="category" name="category" value="MA"style="width: 15px;"> 댄스/무용

      <input type="checkbox" id="category" name="category" value="ET"style="width: 15px;"> 봉사활동
  
      <input type="checkbox" id="category" name="category" value="ET"style="width: 15px;"> 사교/인맥
  
      <input type="checkbox" id="category" name="category" value="ET"style="width: 15px;"> 차/오토바이

      <input type="checkbox" id="category" name="category" value="ET"style="width: 15px;"> 사진/영상
   
      <input type="checkbox" id="category" name="category" value="ET"style="width: 15px;"> 야구관람
   
      <input type="checkbox" id="category" name="category" value="ET"style="width: 15px;"> 게임/오락
    
      <input type="checkbox" id="category" name="category" value="ET"style="width: 15px;"> 요리/제조
   
      <input type="checkbox" id="category" name="category" value="ET"style="width: 15px;"> 반려동물
  
      <input type="checkbox" id="category" name="category" value="ET"style="width: 15px;"> 가족/결혼
    
      <input type="checkbox" id="category" name="category" value="ET"style="width: 15px;"> 자유주제
 
</td>
	<tr>검색할 단어 : </tr>

	<form id="search-form">
		<input type="text" id="search" placeholder="검색할 단어 입력" style="width: 80%; right: 0;" maxlength="20" size="50" colspan="2">
		<button id="searchBtn">검색</button>
	</form>
       </tbody>
	</form>
</body>
</html>