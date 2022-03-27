<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
  <head>
  
    
  	<title>커넥트MBTI</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="css/style.css">
	
	 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
	

	</head>
	<body>
	<jsp:include page="Nav.jsp"/>
	
	
	
	
		<div class="container mt-3">
		
		<div class="col-sm" >
		<ul class="nav nav-pills nav-justified">
		<li class="nav-item"><a class="nav-link active"  href="mypage/getUserInfo.do">1.개인정보 관리</a></li>
     	<li class="nav-item"><a class="nav-link active"  href="mypage/getPartyList.do">2.내가 가입한 소모임</a></li>
     	<li class="nav-item"><a class="nav-link active"  href="mypage/getPartyFavList.do">3.내가 찜한 소모임</a></li>
     	<li class="nav-item"><a class="nav-link active"  href="mypage/getPartyCreatorList.do">4.생성한 소모임 관리</a></li>
     	<li class="nav-item"><a class="nav-link active"  href="mypage/../calendar3.do?user_id=${sessionScope.user.user_Id }">5.스케쥴러</a></li>
     	</ul>
		</div>
			</div>
				
		
		
		
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">MBTI</h2>
				</div>
			</div>
			
			
			<div class="row">
				<div class="col-md-12">
					<div class="elegant-calencar d-md-flex">
						<div class="wrap-header d-flex align-items-center img" style="background-image: url(images/bg.jpg);">
				      <p id="reset">Today</p>
			        <div id="header" class="p-0">
								<div class="head-info">
		            	<div class="head-month"></div>
		                <div class="head-day"></div>
		            </div>
		            </div>
			      </div>
			      <div class="calendar-wrap">
			      	<div class="w-100 button-wrap">
				      	<div class="pre-button d-flex align-items-center justify-content-center"><i class="fa fa-chevron-left"></i></div>
				      	<div class="next-button d-flex align-items-center justify-content-center"><i class="fa fa-chevron-right"></i></div>
			      	</div>
			        <table id="calendar">
		            <thead>
		                <tr>
	                    <th>Sun</th>
	                    <th>Mon</th>
	                    <th>Tue</th>
	                    <th>Wed</th>
	                    <th>Thu</th>
	                    <th>Fri</th>
	                    <th>Sat</th>
		                </tr>
		            </thead>
		            <tbody>
	                <tr>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                </tr>
	                <tr>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                </tr>
	                <tr>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                </tr>
	                <tr>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                </tr>
	                <tr>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                </tr>
	                <tr>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                </tr>
		            </tbody>
			        </table>
			      </div>
			    </div>
				</div>
			</div>
		</div>
		
		
		
	</section>

	<script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script>
  
  var checkList="<c:out value='${checkList}'/>";
  (function($) {
	  var year=${year};
	    var month=${month};
	    var day=${day};
		"use strict";

		document.addEventListener('DOMContentLoaded', function(){
	    var today = new Date(),
	        
	        monthTag =["January","February","March","April","May","June","July","August","September","October","November","December"],
	        
	        days = document.getElementsByTagName('td'),
	        selectedDay,
	        setDate,
	        daysLen = days.length;
	    
	    
	    function Calendar(selector, options) {
	        this.options = options;
	        this.draw();
	    }
	    
	    Calendar.prototype.draw  = function() {
	        this.getCookie('selected_day');
	        this.getOptions();
	        this.drawDays();
	        var that = this,
	            reset = document.getElementById('reset'),
	            pre = document.getElementsByClassName('pre-button'),
	            next = document.getElementsByClassName('next-button');
	            
	            pre[0].addEventListener('click', function(){that.preMonth(); });
	            next[0].addEventListener('click', function(){that.nextMonth(); });
	            reset.addEventListener('click', function(){that.reset(); });
	        while(daysLen--) {
	        	if(daysLen>=startDay){
	            days[daysLen].addEventListener('mouseover', function(){that.clickDay(this); });
	        	}
	        }
	    };
	    
	    Calendar.prototype.drawHeader = function(e) {
	        var headDay = document.getElementsByClassName('head-day'),
	            headMonth = document.getElementsByClassName('head-month');

	            e?headDay[0].innerHTML = e : headDay[0].innerHTML = day;
	            headMonth[0].innerHTML = monthTag[month-1] +" - " + year;        
	     };
	    Calendar.prototype.drawDays = function() {
	        startDay = new Date(year, month-1, 1).getDay(),
	            nDays = new Date(year, month , 0).getDate(),
	    
	            n = startDay;
	        for(var k = 0; k <42; k++) {
	            days[k].innerHTML = '';
	            days[k].id = '';
	            days[k].className = '';
	        }

	        for(var i  = 1; i <= nDays ; i++) {
	        	if(i<10){a="0"+i;}
	        	else{a=i;}
	        	if(checkList.indexOf(a)!=-1){
	            days[n].innerHTML = '<a href="calendar4.do?year=${year}&month=${month}&day='+a+'">'+i+'</a>'; }
	        	else{days[n].innerHTML =i;}
	            n++;
	        }
	       
	       
	        for(var j = 0; j < 42; j++) {
	            if(days[j].innerHTML === ""){
	                
	                days[j].id = "disabled";
	                
	            }
	            
	        }
	    };
	    
	    Calendar.prototype.clickDay = function(o) {
	        var selected = document.getElementsByClassName("selected"),
	            len = selected.length;
	        if(len !== 0){
	            selected[0].className = "";
	        }
	        o.className = "selected";
	        selectedDay = new Date(year, month, o.innerHTML);
	        this.drawHeader(o.innerHTML);
	        this.setCookie('selected_day', 1);
	        
	    };
	    
	    Calendar.prototype.preMonth = function() {
	        if(month <= 1){ 
	            month = 12;
	            year = year - 1; 
	        }else{
	            month = month - 1;
	        }
	        window.location.href='calendar3.do?year='+year+"&month="+0+month+"&day="+day;
	        this.drawDays();
	    };
	    
	    Calendar.prototype.nextMonth = function() {
	        if(month >= 12){
	            month = 1;
	            year =  year + 1; 
	        }else{
	            month = month + 1;
	        }
	        window.location.href='calendar3.do?year='+year+"&month="+0+month+"&day="+day;
	      
	        this.drawDays();
	        
	    };
	    
	    Calendar.prototype.getOptions = function() {
	        if(this.options){
	            var sets = this.options.split('-');
	                setDate = new Date(sets[0], sets[1]-1, sets[2]);
	                var year=${year};
	        	    var month=${month};
	        	    var day=${day};
	        }
	    };
	    
	     Calendar.prototype.reset = function() {
	         month = today.getMonth()+1;
	         year = today.getFullYear();
	         day = today.getDate();
	         this.options = undefined;
	         this.drawDays();
	         window.location.href='calendar3.do?year='+year+"&month="+0+month+"&day="+day;
	     };
	    
	    Calendar.prototype.setCookie = function(name, expiredays){
	        if(expiredays) {
	            var date = new Date();
	            date.setTime(date.getTime() + (expiredays*24*60*60*1000));
	            var expires = "; expires=" +date.toGMTString();
	        }else{
	            var expires = "";
	        }
	        document.cookie = name + "=" + selectedDay + expires + "; path=/";
	    };
	    
	    Calendar.prototype.getCookie = function(name) {
	        if(document.cookie.length){
	            var arrCookie  = document.cookie.split(';'),
	                nameEQ = name + "=";
	            for(var i = 0, cLen = arrCookie.length; i < cLen; i++) {
	                var c = arrCookie[i];
	                while (c.charAt(0)==' ') {
	                    c = c.substring(1,c.length);
	                    
	                }
	                if (c.indexOf(nameEQ) === 0) {
	                    selectedDay =  new Date(c.substring(nameEQ.length, c.length));
	                }
	            }
	        }
	    };
	    var calendar = new Calendar();
	    
	        
	}, false);

	})(jQuery);</script>
	<div id="data"></div><script>
	
</script>

<jsp:include page="footer.jsp"/>
	</body>
</html>

