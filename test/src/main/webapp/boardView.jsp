<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>
<head>
<meta charset=UTF-8">
<title>소모임-글 보기</title>
</head>
<style>
	h2 { text-align: center;}
  table { width: 100%;}
  textarea { width: 100%;}
 	#outter {
		display: block;
		width: 30%;
		margin: auto;
	}
</style>
<body>

<h2>게시판 보기</h2>
<br><br><br>
	<form method="post" action="getBoard.do" role="form" >
	<table border="1">
	
		<tr>
		      <th class="active">제목</th>
			<td>${board.art_title}</td>
		</tr>
		<tr>
			<td>
				${board.art_writer}
			
			</td>
		</tr>
		<tr>
			<td><div style="height: 300px; margin: 10px; display: inline-block">
			
			<a><img src="${board.art_img_path}" width=200 height=200 /> </a>${board.art_content }
			
			</div></td>
		</tr>
	</table>

	</form>
	
	<button><a href="boardUpdate.jsp">수정</a></button>
	<button><a href="deleteBoard.do?party_id=${param.party_id}">삭제</a></button>
	
	
	<button><a href="getBoardList.do?party_id=1">돌아가기</a></button>

</div>

</body>
</html>
