<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>커넥트MBTI</title>

</head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900;&display=swap');
body {
	font-family: 'Noto Sans KR', sans-serif;
	}
.carousel-item {
  height: 100vh;
  min-height: 350px;
  background: no-repeat center center scroll;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}
</style>

<style type="text/css">
	 a { text-decoration: none; color: black; }
    a:visited { text-decoration: none; }
    a:hover { text-decoration: none; }
    a:focus { text-decoration: none; }
    a:hover, a:active { text-decoration: none; }
</style>
<!-- 네비 예시입니다. -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- #BOOTSTRAP 5.1.3 합쳐지고 최소화된 최신 CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- #BOOTSTRAP 5.1.3 합쳐지고 최소화된 최신 CSS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
   
<!-- 링크 -->

 <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">

    <link rel="stylesheet" href="main/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="main/css/animate.css">
    
    <link rel="stylesheet" href="main/css/owl.carousel.min.css">
    <link rel="stylesheet" href="main/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="main/css/magnific-popup.css">

    <link rel="stylesheet" href="main/css/aos.css">

    <link rel="stylesheet" href="main/css/ionicons.min.css">

    <link rel="stylesheet" href="main/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="main/css/jquery.timepicker.css">
    <style>
        #modal.modal-open {
            display: none;
        }
		.button {		
		  background-color: blue;
		
		  border: none;
		
		  color: white;
		
		  padding: 15px 30px;
		
		  text-align: center;
		
		  text-decoration: none;
		
		  display: inline-block;
		
		  font-size: 16px;
		
		  margin: 4px 2px;
		
		  cursor: pointer;
		
		}
	</style>
    <!-- 왠진 모르겠지만 이거 있으니까 카태고리 버튼이 시퍼렇게 됨.	  -->
    <link rel="stylesheet" href="main/css/flaticon.css">
    <link rel="stylesheet" href="main/css/icomoon.css">
    <link rel="stylesheet" href="main/css/style.css">
<!-- 네비 예시입니다. -->
 
<body style="font-family: 'Noto Sans KR', sans-serif; font-weight:bold"> 
	<jsp:include page="Nav.jsp"/>

    <section class="home-slider js-fullheight owl-carousel bg-white">
      <div class="slider-item js-fullheight">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row d-md-flex no-gutters slider-text js-fullheight align-items-center justify-content-end" data-scrollax-parent="true">
          	<div class="one-third order-md-last img js-fullheight" style="background-image:url(images/bg_1.jpg);">
          		<img src="resource/img/f11.jpg" alt="" />
          		<h3 class="vr">KOSMO HJSKLKY</h3>
          	</div>
	          <div class="one-forth d-flex js-fullheight align-items-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
	          	<div class="text">
		            <h1 class="mb-4">나랑 맞는 <br>친구를 찾아보세요</h1>
		            <p>MBTI모임에서는  나랑 비슷한 성향의 친구를 쉽게 찾을수 있습니다 </p>
		            
	            </div>
	          </div>
        	</div>
        </div>
      </div>

      <div class="slider-item js-fullheight">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row d-flex no-gutters slider-text js-fullheight align-items-center justify-content-end" data-scrollax-parent="true">
          	<div class="one-third order-md-last img js-fullheight" style="background-image:url(images/bg_2.jpg);">
          	
          		<img src="resource/img/f22.jpg" alt="" />
          		<h3 class="vr">Since - 2022</h3>
          	</div>
	          <div class="one-forth d-flex js-fullheight align-items-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
	          	<div class="text">
		            <h1 class="mb-4">나와 비슷한 성향의 친구를 찾아보세요</h1>
		            <p>나와 비슷한 성향의 친구랑 쉽게 만날수 있다면 얼마나 좋을까요</p>
		           
	            </div>
	          </div>
        	</div>
        </div>
      </div>
    </section>
		
		<section class="ftco-section ftc-no-pb">
			<div class="container">
				<div class="row no-gutters">
					<div class="col-md-5 p-md-5 img img-2" style="background-image: url(images/bg_3.jpg);">
					<img src="resource/img/f33.jpg" width="600px" height="500px" />
					</div>
					<div class="col-md-7 wrap-about pb-md-5 ftco-animate">
	          <div class="heading-section mb-5 pl-md-5">
	          	<div class="pl-md-5 ml-md-5">
		          	<span class="subheading subheading-with-line"><small class="pr-2 bg-white">About</small></span>
		            <h2 class="mb-4">나랑 잘 맞는 성향의 친구를 만날수 있게 해주는 웹사이트 입니다.</h2>
	            </div>
	          </div>
	          <div class="pl-md-5 ml-md-5 mb-5">
							<p>기존 소모임에서는 나랑 잘 맞는지도 모르는데 일단 만나기는 너무 부담스럽지 않나요? 이제는 그런걱정은 안하셔도 됩니다  각자 MBTI를 검사 해서 서로 잘 맞는 친구들만 만나면 되니까요 이제는 친목모임에서 더이상 스트레스 받지 마세요.</p>
							
						</div>
					</div>
				</div>
			</div>
		</section>

	<div class="container pt-5">
	<div class="row">
	<div class="col">
	<c:choose>
	<c:when test="${sessionScope.user.user_Id==null}">
	<h3>이런! 로그인을 안하셨군요</h3>
	</c:when>

	<c:when test="${not empty bestList}">
	<h1>당신과 같은 MBTI가 많은 모임!</h1>
	<div>
	
	<c:forEach items="${bestList}" var="best">
		<div class="article">
		<a href="getParty.do?PARTY_ID=${best.PARTY_ID}">
			<img src="${best.PARTY_TUMB_PATH }" alt="이미지가 없네요..." width=270px  height=200px/>
			<p>${best.PARTY_TITLE }</p>
		</a>
		</div>
	</c:forEach>
	</div>
	</c:when>
	<c:when test="${empty bestList}">
	<h3>추천 모임이 없습니다</h3>
	</c:when>
	</c:choose>
	</div>
	</div>
</div>

		
		

	
	<!-- 불러오는곳 -->
	<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

	<!-- 지금 있는 스크립트의 의도는?  -->
  <script src="main/js/jquery.min.js"></script>
  <script src="main/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="main/js/popper.min.js"></script>
  <script src="main/js/bootstrap.min.js"></script>
  <script src="main/js/jquery.easing.1.3.js"></script>
  <script src="main/js/jquery.waypoints.min.js"></script>
  <script src="main/js/jquery.stellar.min.js"></script>
  <script src="main/js/owl.carousel.min.js"></script>
  <script src="main/js/jquery.magnific-popup.min.js"></script>
  <script src="main/js/aos.js"></script>
  <script src="main/js/jquery.animateNumber.min.js"></script>
  <script src="main/js/bootstrap-datepicker.js"></script>
  <script src="main/js/jquery.timepicker.min.js"></script>
  <script src="main/js/scrollax.min.js"></script>
  <script src="main/https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="main/js/google-map.js"></script>
  <script src="main/js/main.js"></script>
  
  <jsp:include page="footer.jsp"/>
</body>
</html>