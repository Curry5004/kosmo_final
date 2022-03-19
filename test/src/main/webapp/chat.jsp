<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>

<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
body {	
	background-color: #a1c0d6;
	padding-top: 15px;
	padding-left: 5px;
	padding-right: 5px;
	padding-bottom: 100px;
}


.message_name {
	margin-right : 8px;
	float: right;
	display: block; clear : both;
	border-radius: 10px;
	padding: 8px;
	text-align: left;
}
.message_mine {
	margin-left : 8px;
	float: right;
	display: inline-block; clear : both;
	background-color: #FDF01B;
	border-radius: 10px;
	padding: 8px;
	text-align: left;
	margin-bottom: 14px;
}
.message_name_mine {
	margin-right : 8px;
	float: right;
	display: block; clear : both;
	border-radius: 10px;
	padding: 8px;
	text-align: left;
}

.timeBox {
	margin-right : 8px;
	float: right;
	display: inline-block;
	border-radius: 10px;
	padding: 8px;
	text-align: left;
}
.mesageBox{
	vertical-align: bottom;
}


.message_name_other {
	margin-right : 8px;
	float: left;
	display: block; clear : both;
	border-radius: 10px;
	padding: 8px;
	text-align: left;
}
.message_other {
	margin-left : 8px;
	float: left;
	display: inline-block; clear : both;
	background: #fff;
	border-radius: 10px;
	padding: 8px;
	text-align: left;
	margin-bottom: 14px;
}
.message_name_other {
	margin-right : 8px;
	float: left;
	display: block; clear : both;
	border-radius: 10px;
	padding: 8px;
	text-align: left;
}

.timeBox_other {
	margin-right : 8px;
	float: left;
	display: inline-block;
	border-radius: 10px;
	padding: 8px;
	text-align: left;
}
.mesageBox_other{
	vertical-align: bottom;
}

#write {
	
	position: fixed;
	z-index: 30;
	 right: 0;
  bottom: 0;
}
#chatArea {
	display: block;
	height: 100%;
	margin-bottom: 75px;
}
#messageinput{}

</style>
</head>
<script>


function getDateTime(date) {

    var year = date.getFullYear();

    var month = date.getMonth() + 1;

    var day = date.getDate();

    var hh = date.getHours();

    var mm = date.getMinutes();

    return year + "-" + month + "-" + day + " " + hh + ":" + mm;

}


	var msg1 = {
			party_id : <c:out value="${param.party_id }"/>
	}
	function list() {
		const testDiv = document.getElementById('testDiv');
		fetch('getChatList.do',{
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
		.then(res => {
			res.forEach((resEach) => {
				var div1 = document.createElement('div');
				
				var name = document.createElement('div');
		        var messageBox = document.createElement('div');
		        var timeBox = document.createElement('span');
		        var messageSpan = document.createElement('span');
				if(resEach.user_id=="<c:out value='${sessionScope.user.user_Id}'/>"){
					
					
		        	
		        	
					name.className += "message_name_mine";
					messageSpan.className += "message_mine";
					timeBox.className += "timeBox";
					messageBox.className += "messageBox";
					
					var time = resEach.reg_date.split(" ");
					var ampm = "";
					if (time[4]=="PM")
						ampm += "오후";
					else
						ampm += "오전";

					
					var hourMinute = time[3].split(":")[0]+":"+time[3].split(":")[1];
					var timeMsg= time[1].replace(",","")+"일 "+ampm + " " +hourMinute;
					timeBox.innerText=timeMsg;
					
					name.innerHTML = resEach.user_name;
					messageSpan.innerHTML = resEach.content;
					messageBox.appendChild(timeBox);
					messageBox.appendChild(messageSpan);
					testDiv.appendChild(name);
					testDiv.appendChild(messageBox);
					
					
					
					
					
				}else{
				
				name.className += "message_name_other";
				messageSpan.className += "message_other";
				timeBox.className += "timeBox_other";
				messageBox.className += "messageBox_other";
				
				var time = resEach.reg_date.split(" ");
				var ampm = "";
				if (time[4]=="PM")
					ampm += "오후";
				else
					ampm += "오전";
				
				var hourMinute = time[3].split(":")[0]+":"+time[3].split(":")[1];
				var timeMsg= time[1].replace(",","")+"일 "+ampm + " " +hourMinute;
				timeBox.innerText=timeMsg;
				
				name.innerHTML = resEach.user_name;
				messageSpan.innerHTML = resEach.content;
				messageBox.appendChild(timeBox);
				messageBox.appendChild(messageSpan);
				testDiv.appendChild(name);
				testDiv.appendChild(messageBox);
				
				}
				testDiv.appendChild(div1);
			})
		})
		.catch(function(error){
			console.error(error);
		})
	}
</script>
<body onload="list() ,openSocket()">
<div class="container">
<div class="row">
<div class="btn-group">
  <button type="button" class="btn btn-primary" onclick="location.href='getParty.do?PARTY_ID=${param.party_id}'">소개글</button>
  <button type="button" class="btn btn-primary" onclick="location.href='getBoardList.do?party_id=${param.party_id}'">게시판</button>
  <button type="button" class="btn btn-primary" onclick="location.href='getAlbumList.do?party_id=${param.party_id}'">앨범</button>
  <button type="button" class="btn btn-primary" onclick="location.href='calendar.do?party_id=${param.party_id}'">일정</button>
  <button type="button" class="btn btn-primary" onclick="location.href='chatting.do?party_id=${param.party_id}'">채팅</button>
  <c:if test="${party.PARTY_CREATOR eq user.user_Id}">
  <button type="button" class="btn btn-primary" onclick="location.href='getPartyUserList.do?PARTY_ID=${param.PARTY_ID}'">회원관리</button>
  </c:if>
</div>
</div>
</div>
	<div id=chatArea>
	<div id="testDiv"></div>

	<!-- Server responses get written here -->
	<div id="messageDiv"></div>
	<!-- websocket javascript -->
	<c:set var="id" value="${sessionScope.user.user_Id }"></c:set>
	</div>
	
	<div id="write">
		<input type="text" id="messageinput" >
		<c:if test="${fn:contains(idList, sessionScope.user.user_Id)}">
		<button type="button" onclick="send();">전송</button>
		</c:if>
		<button type="button" onclick="location.href='getParty.do?PARTY_ID=${param.party_id }'; closeSocket();">종료</button>
	</div>




	<script type="text/javascript">
	$(function(){
		stickyFooter();

		$(window).scroll(stickyFooter).resize(stickyFooter);
	});


	function stickyFooter(){
		document_height = $(document).height(); // 문서 전체 높이
		document_scrollTop = $(document).scrollTop(); // 문서 전체 높이 중 스크롤 위치
		window_height = $(window).height(); // 창 높이
		footer_height = $("footer").height();

		gap = document_height - footer_height - window_height; 
		bottom = document_scrollTop - gap ; 

		if(document_scrollTop > gap){
			$("footer").css("bottom", bottom+"px");
		}else{
			$("footer").css("bottom","0");
		}
	}
        var ws;
        var messageDiv=document.getElementById("messageDiv");
       
        
        function openSocket(){
            if(ws!==undefined && ws.readyState!==WebSocket.CLOSED){
                writeResponse("이미 참가중입니다.");
                return;
            }
            //웹소켓 객체 만드는 코드
            ws=new WebSocket("ws://localhost:8080/biz/echo.do");
            
            ws.onopen=function(event){
                if(event.data===undefined) return;
                
                writeResponse(event.data);
            };
            ws.onmessage=function(event){
                writeResponse(event.data);
            };
            ws.onclose=function(event){
                writeResponse("채팅을 종료합니다");
            }
        }
        
        function send(){
        	
        	var msg = {
            	  content : document.getElementById("messageinput").value
            	  , party_id : <c:out value="${param.party_id }"/>
            	  , user_id : "<c:out value='${sessionScope.user.user_Id }'/>"
            	  , user_name : "<c:out value='${sessionScope.user.name }'/>"
            };
        	
        	fetch('insertChat.do',{
        		method : 'POST',
                mode : 'cors',
                cache : 'no-cache',
                /////Content Type은 json으로 명시한다.
                headers: {'Content-Type': 'application/json'},
                credentials : 'same-origin',
                redirect : 'follow',
                referrer : 'no-referrer',
                body: JSON.stringify(msg)
    		}).catch(function(error){
    			console.error(error);
    		})
        	
        	
            ws.send(JSON.stringify(msg));
            text="";
            
            
        }
        
        function closeSocket(){
            ws.close();
        }
        function writeResponse(text){
        	var name = document.createElement('div');
        	var messageBox = document.createElement('div');
        	var timeBox = document.createElement('span');
        	var messageSpan = document.createElement('span');
        	
        	msg= text.split("\",\"");
        	var id = msg[1].split("\":\"")[1];
        	
        	if(id=="<c:out value="${sessionScope.user.user_Id}"/>")
        	{
			name.className += "message_name_mine";
			messageSpan.className += "message_mine";
			timeBox.className += "timeBox";
			messageBox.className += "messageBox";
			var now = new Date();
			var hour = "";
			if(now.getHours()>12)
				hour += "오후 "+(now.getHours()-12);
			else
				hour += "오전 "+now.getHours();
			var time = hour+" : "+now.getMinutes();
			
			
			timeBox.innerText=time;
			name.innerHTML = msg[2].split("\":\"")[1].replace("\"}","");
			messageSpan.innerHTML = msg[0].split("\":\"")[1];
			messageBox.appendChild(timeBox);
			messageBox.appendChild(messageSpan);
			testDiv.appendChild(name);
			testDiv.appendChild(messageBox);
			}else{
				name.className += "message_name_other";
				messageSpan.className += "message_other";
				timeBox.className += "timeBox_other";
				messageBox.className += "messageBox_other";
				var now = new Date();
				var hour = "";
				if(now.getHours()>12)
					hour += "오후 "+(now.getHours()-12);
				else
					hour += "오전 "+now.getHours();
				var time = hour+" : "+now.getMinutes()
				
				timeBox.innerText=time;
				name.innerHTML = msg[2].split("\":\"")[1].replace("\"}","");
				messageSpan.innerHTML = msg[0].split("\":\"")[1];
				messageBox.appendChild(timeBox);
				messageBox.appendChild(messageSpan);
				testDiv.appendChild(name);
				testDiv.appendChild(messageBox);
			}
        }
        
        
  </script>
</body>
</html>
