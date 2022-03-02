<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <title>Insert title here</title>
    <style>
        table {
            border-collapse: collapse;
            border: 1px solid #444444;
        }

        th,
        td {
            border: 1px solid #444444;
        }
    </style>
</head>
<script>

    function doSearch(event) {
    	let searchArea = document.getElementById("searchArea");
        let valSelectedCategory = searchArea.querySelector("select[id=searchCategory]").value;
        let valSearchKeyword = searchArea.querySelector("input[id=searchText]").value;
    	let params = {
    			category: valSelectedCategory,
    			keyword: valSearchKeyword,
    	};
        $.ajax({
            type: "GET",
            url: "groups.do",
            data: params,
            success: function (res) {
                let tableData = res.resultBody;
                drawTable(tableData);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("통신 실패.");
            }
        });
    }

    function drawTable(tableData) {
		console.log("성공")
    }
</script>

<body>

    <table class="board" id="searchArea">
        <colgroup>
            <col style="width:10%;">
            <col style="width:40%;">
            <col style="width:10%;">
            <col style="width:40%;">
        </colgroup>
        <tbody>
            <tr>
                <th>카테고리</th>
                <td style="text-align: left; padding-left: 15px;">
                    <select id="searchCategory">
                        <option value="CC01">인문학/책/글</option>
                        <option value="CC02">아웃도어/여행</option>
                        <option value="CC03">운동/스포츠</option>
                        <option value="CC04">업종/직무</option>
                        <option value="CC05">외국/언어</option>
                        <option value="CC06">문화/공연/축제</option>
                        <option value="CC07">음악/악기</option>
                        <option value="CC08">공예/만들기</option>
                        <option value="CC09">댄스/무용</option>
                        <option value="CC10">봉사활동</option>
                        <option value="CC11">사교/인맥</option>
                        <option value="CC12">차/오토바이</option>
                        <option value="CC13">사진/영상</option>
                        <option value="CC14">야구관람</option>
                        <option value="CC15">게임/오락</option>
                        <option value="CC16">요리/제조</option>
                        <option value="CC17">반려동물</option>
                        <option value="CC18">가족/결혼</option>
                        <option value="CC19">자유주제</option>
                    </select>
                </td>

            </tr>
            <tr>
                <td colspan="4"> <input type="text" id="searchText" placeholder="검색할 단어 입력"
                        style="width: 80%; right: 0;" maxlength="20" size="50" colspan="2"><button id="searchBtn"
                        onclick="doSearch(event)">검색</button>
                </td>
            </tr>
        </tbody>
    </table>
    
  	<div class="groupList">
  	<table>
  		<thead></thead>
  		<tbody></tbody>
  	</table>
  	<div>
  		< 1 2 3 4 5 6 7 8 9 10 > 
  	</div>
  	</div>
</body>

</html>