<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
  <head>
  <style>
  .message{
  	z-index: -200;
  }
  </style>
  
    
  	<title>커넥트MBTI</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="css/style.css">

	</head>
	<body onload="list()">
	<jsp:include page="Nav.jsp"/>
	
	<div class="container">
<div class="row">
<div class="btn-group">
  <button type="button" class="btn btn-primary" onclick="location.href='getParty.do?PARTY_ID=${param.party_id}'">소개글</button>
  <button type="button" class="btn btn-primary" onclick="location.href='getBoardList.do?party_id=${param.party_id}'">게시판</button>
  <button type="button" class="btn btn-primary" onclick="location.href='getAlbumList.do?party_id=${param.party_id}'">앨범</button>
  <button type="button" class="btn btn-primary" onclick="location.href='calendar.do?party_id=${param.party_id}'">일정</button>
  <button type="button" class="btn btn-primary" onclick="location.href='chatting.do?party_id=${param.party_id }'">채팅</button>
  <c:if test="${party.PARTY_CREATOR eq user.user_Id}">
  <button type="button" class="btn btn-primary" onclick="location.href='getPartyUserList.do?PARTY_ID=${param.party_id}'">회원관리</button>
  </c:if>
</div>
</div>
</div>

			
			
		
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">커넥트MBTI</h2>
					
					<a class="btn btn-primary" href="writeSchedule.jsp?party_id=${param.party_id}" role="button">일정 잡기</a>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="elegant-calencar d-md-flex">
						<div class="wrap-header d-flex align-items-center img" style="background-image: url(images/bg.jpg);">
				      
			        <div id="header" class="p-0">
								<!-- <div class="pre-button d-flex align-items-center justify-content-center"><i class="fa fa-chevron-left"></i></div> -->
		            <div class="head-info">
		            	<div class="head-month"></div>
		                <div class="head-day"></div>
		            </div>
		            <!-- <div class="next-button d-flex align-items-center justify-content-center"><i class="fa fa-chevron-right"></i></div> -->
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

  var schMap ;
  
  
  var checkList="<c:out value='${checkList}'/>";
  var ScheduleList="<c:out value='${ScheduleList}'/>";
  (function($) {
	  var year=${year};
	    var month=${month};
	    var day=${day};
	    var party_id=${party_id};
		"use strict";

		document.addEventListener('DOMContentLoaded', function(){
	    var today = new Date(),
	        
	        monthTag =["January","February","March","April","May","June","July","August","September","October","November","December"],
	        
	        days = document.getElementsByTagName('td'),
	        selectedDay,
	        setDate,
	        daysLen = days.length;
	    
	    
	// options should like '2014-01-01'
	    function Calendar(selector, options) {
	        this.options = options;
	        this.draw();
	    }
	    
	    Calendar.prototype.draw  = function() {
	        this.getCookie('selected_day');
	        this.getOptions();
	        this.drawDays();
	        var that = this,
	            pre = document.getElementsByClassName('pre-button'),
	            next = document.getElementsByClassName('next-button');
	            
	            pre[0].addEventListener('click', function(){that.preMonth(); });
	            next[0].addEventListener('click', function(){that.nextMonth(); });
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
	            	days[n].innerHTML = '<a href="calendar2.do?year=${year}&month=${month}&day='+a+'&party_id=${party_id}">'+i+'</a>'; 
	            }
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
	        window.location.href='calendar.do?year='+year+"&month="+0+month+"&day="+day+"&party_id="+party_id;
	        this.drawDays();
	    };
	    
	    Calendar.prototype.nextMonth = function() {
	        if(month >= 12){
	            month = 1;
	            year =  year + 1; 
	        }else{
	            month = month + 1;
	        }
	        window.location.href='calendar.do?year='+year+"&month="+0+month+"&day="+day+"&party_id="+party_id;
	      
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

	})(jQuery);
  
  function list(){
	  
	  var msg1= {
				party_id : <c:out value="${param.party_id }"/>,
				year:<c:out value="${year}"/>,
				month:<c:out value="${month}"/>
		}
	 
		fetch('getDayScheduleList.do',{
  		method : 'POST',
          mode : 'cors',
          cache : 'no-cache',
          /////Content Type은 json으로 명시한다.
          headers: {'Content-Type': 'application/json'},
          credentials : 'same-origin',
          redirect : 'follow',
          referrer : 'no-referrer',
          body: JSON.stringify(msg1)
		}).then(res => res.json())
		.then(res => Object.keys(res).forEach(resEach => {
			if(res[resEach].length!=0){
				var days = document.getElementsByTagName('td');
				var n=0;
				var startNum=0;
				while(days[n].innerHTML==""){
					n++;
					startNum++;
				}
				var key=(startNum+parseInt(resEach)-1);
				days[key].innerHTML = '<a href="calendar2.do?year=${year}&month=${month}&day='+resEach+'&party_id=${party_id}">'+resEach+'</a>'; 
				
				var toolbar ="";
				toolbar+=res[resEach].length+"개의 모임이 있습니다"
+`
`;
				for(i=0;i<res[resEach].length;i++)
					toolbar+="모임장소 : " + res[resEach][i].location_name
+`
`;
				
				days[key].title=toolbar;
			}
			
			})
		)
		.catch(function(error){
			console.error(error);
		})
	}
  
  </script>
	<div id="data"></div><script>
	
</script>
<jsp:include page="footer.jsp"/>
	</body>
</html>

