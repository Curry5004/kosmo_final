<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">

<title>커넥트MBTI</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
 <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
  <script src="js/typeahead.bundle.js"></script>
  <script src="js/scripts.js"></script>
</head>
<style>
    .twitter-typeahead {
      width: 100%;
    }

    .tt-menu {
      z-index: 100;
      max-height: 240px;
      overflow-y: auto;
      background-color: #fff;
      margin-top: 3px;
      border-radius: 3px;
      width: 100%;
      box-shadow: 0 0 3px #666;
      padding-bottom: 6px;
    }
    
    .tt-menu .tt-suggestion {
      padding: 5px 10px;
      text-align: left;
      font-size: 16px !important;
      color: #464a4c;
    }
    
    .tt-menu .tt-suggestion.tt-cursor {
      background-color: #ccc;
    }

  </style>

<body>
	<jsp:include page="Nav.jsp"/>
	<div class="container">
	<form action="insertParty.do" method="POST"
		  enctype="multipart/form-data" name="Reg_form"
		  onsubmit="return check()">
		
			<div class="col-md-6 mb-3"> 
				<label for="PARTY_TITLE">제목 : </label>
				<input type="text" class="form-control" name="PARTY_TITLE" id="title" placeholder= "내용을 입력해주세요." required/>
			</div>
			
			<div>
				<label>카테고리 : </label>
				<select name="CATEGORY_NAME">
				<c:forEach var="Category" items="${CategoryList}">
					<option value="${Category.category_name}">${Category.category_name}</option>
				</c:forEach>
				</select>
			</div>
			
			<div>
				<label>MBTI1 : </label>
				<select name="PARTY_PRE_MBTI1">
				<c:forEach var="MBTI" items="${MbtiList}">
					<option value="${MBTI.MBTI_NAME}">${MBTI.MBTI_NAME}</option>
				</c:forEach>
				</select> 
			</div>
			
			<div>
				<label>MBTI2 : </label> 
				<select name="PARTY_PRE_MBTI2">
				<c:forEach var="MBTI" items="${MbtiList}">
					<option value="${MBTI.MBTI_NAME}">${MBTI.MBTI_NAME}</option>
				</c:forEach>
				</select> 
			</div>
			
			<div>
				<label>MBTI3 : </label>
				<select name="PARTY_PRE_MBTI3">
				<c:forEach var="MBTI" items="${MbtiList}">
					<option value="${MBTI.MBTI_NAME}">${MBTI.MBTI_NAME}</option>
				</c:forEach>
				</select> 
			</div>

			<div>
				<label>MBTI4 : </label> 
				<select name="PARTY_PRE_MBTI4">
				<c:forEach var="MBTI" items="${MbtiList}">
					<option value="${MBTI.MBTI_NAME}">${MBTI.MBTI_NAME}</option>
				</c:forEach>
				</select> 
			</div>
			
			<div class="col-md-6 mb-3">
				<label>선호장소 : </label> 
		  <input type="text" id="search-area" class="form-control typeahead" placeholder="읍면동 검색" name="PARTY_LOCATION" />
      		</div>
			
			<div>
				<label>이미지 삽입 </label> 
				<input type="file" name="PARTY_TUMB" accept=".jpeg, .jpg, .png" required/>
			</div>
			
			<div class="col-md-6 mb-3">
				<label>멤버 정원 : </label> 
				<input type="number" class="form-control" name="PARTY_MAXIMUM" id="maximum" value="10" min="1" max="100"/>
			</div>
			
			<div>
				<textarea class="form-control" name="PARTY_INTRODUCE" cols="30" rows="10" id="introduce"></textarea>
			</div>

				
			<input type="hidden" value="${user.user_Id }" name="PARTY_CREATOR"/>
			<input type="submit" value="생성" />
	</form>

			
			 
		</div>
	
	

       
   
  
<!-- ${sessionScope.user.user_Id}님이 로그인 중입니다. 

	<form action="insertParty.do" method="POST"
		enctype="multipart/form-data" name="Reg_form"
		onsubmit="return check()">
		<span>제목 : </span><input type="text" name="PARTY_TITLE" id="title" />
		<br /> <span>카테고리 : </span> <select name="CATEGORY_NAME">
			<c:forEach var="Category" items="${CategoryList}">
				<option value="${Category.category_name}">${Category.category_name}</option>
			</c:forEach>
		</select> <br /> <span>MBTI1 : </span> <select name="PARTY_PRE_MBTI1">
			<c:forEach var="MBTI" items="${MbtiList}">
				<option value="${MBTI.MBTI_NAME}">${MBTI.MBTI_NAME}</option>
			</c:forEach>
		</select> <br /> <span>MBTI2 : </span> <select name="PARTY_PRE_MBTI2">
			<c:forEach var="MBTI" items="${MbtiList}">
				<option value="${MBTI.MBTI_NAME}">${MBTI.MBTI_NAME}</option>
			</c:forEach>
		</select> <br /> <span>MBTI3 : </span> <select name="PARTY_PRE_MBTI3">
			<c:forEach var="MBTI" items="${MbtiList}">
				<option value="${MBTI.MBTI_NAME}">${MBTI.MBTI_NAME}</option>
			</c:forEach>
		</select> <br /> <span>MBTI4 : </span> <select name="PARTY_PRE_MBTI4">
			<c:forEach var="MBTI" items="${MbtiList}">
				<option value="${MBTI.MBTI_NAME}">${MBTI.MBTI_NAME}</option>
			</c:forEach>
		</select> <br /> <span>선호위치 : </span> <input type="text" name="PARTY_LOCATION"
			id="location" /><br /> <span>이미지 삽입 </span> <input type="file"
			name="PARTY_TUMB" accept=".jpeg, .jpg, .png"/><br /> <span>멤버 정원 : </span> <input type="text"
			name="PARTY_MAXIMUM" id="maximum" /><br />

		<textarea name="PARTY_INTRODUCE" cols="30" rows="10" id="introduce"></textarea>
		<div>
			<h1>결제 모듈이 들어갈 곳 입니다</h1>
		</div>
		<input type="hidden" value="${user.user_Id }" name="PARTY_CREATOR"/>
		<input type="submit" value="생성" />
	</form>
<p>${user.user_Id }</p>  -->




<script language="javascript">
	function check() {

		var f = document.Reg_form;

		if (f.title.value == "") {
			alert("제목을 입력해주세요");
			f.title.focus();
			return false;
		}
		
		if (f.maximum.value == "") {
			alert("정원을 입력해주세요");
			f.maximum.focus();
			return false;
		}
		if (isNaN(f.maximum.value)) {
			alert("정원은 숫자로 입력해주세요");
			f.maximum.focus();
			return false;
		}
		if (f.introduce.value == "") {
			alert("소개글을 입력해주세요");
			f.introduce.focus();
			return false;
		}
		if (f.search-area.value == "") {
			alert("위치를 입력해주세요");
			f.location.focus();
			return false;
		}
	}
</script>

</body>
</html>