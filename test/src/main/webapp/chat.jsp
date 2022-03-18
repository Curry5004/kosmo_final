<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
function scroll_go(){
$("body").scrollTop($(document).height());
}
scroll_go();
</script>
<style>
body{
 background-color: #a1c0d6;
  height: 100vh;
  padding-top: 15px;
  padding-left: 5px;
  padding-right: 5px;
  }
	
.messageDiv{ background:#fff; border-radius:10px; padding:8px; margin: 8px; text-align:left; width: 30%;}
#messages{ background:#fff; border-radius:10px; padding:8px; margin: 8px; text-align:left; width: 30%;}
</style>
</head>
<script>



	function ExecuteScript() 
	{
		document.body.scrollTop = document.body.scrollHeight;
	}

	var msg1 = {
			party_id : 1
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
				div1.className += "messageDiv";
				div1.innerHTML =resEach.user_id + " : " + resEach.content + " 작성시간 : "+ resEach.reg_date
				testDiv.appendChild(div1);
			})
		})
		.catch(function(error){
			console.error(error);
		})
	}
</script>
<body onload="ExecuteScript(), list()">
<div id="testDiv"></div>
    
    <!-- Server responses get written here -->
    <div id="messages"></div>
    <!-- websocket javascript -->
    <c:set var="id" value="${sessionScope.user.user_Id }"></c:set>
    <div>
        <input type="text" id="sender" value="${sessionScope.user.name }" style="display: none;">
        <input type="text" id="messageinput">
    </div>
    <div>
        <button type="button" onclick="openSocket();">Open</button>
        <button type="button" onclick="send();">Send</button>
        <button type="button" onclick="closeSocket();">Close</button>
    </div>
    
    
    
    
    <script type="text/javascript">
        var ws;
        var messages=document.getElementById("messages");
        
        function openSocket(){
            if(ws!==undefined && ws.readyState!==WebSocket.CLOSED){
                writeResponse("WebSocket is already opened.");
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
                writeResponse("Connection closed");
            }
        }
        
        function send(){
        	
        	var msg = {
            	  content : document.getElementById("messageinput").value
            	  , party_id : 1
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
    		}).then(function(response){
    			return response.text();
    		}).then(function(text){
    			console.log(text);
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
            messages.innerHTML+="<br/>"+text;
        }
        
        
  </script>
</body>
</html>
