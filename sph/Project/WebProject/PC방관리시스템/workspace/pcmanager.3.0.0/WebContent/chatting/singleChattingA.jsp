<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>채팅페이지</title>

<link rel="stylesheet" href="/pcm/Resources/css/bootstrap.css">
<style>
body {
		background-image: url('/pcm/img/kakao2.jpg'); background-size: cover;
		background-repeat : no-repeat;
	}
button {
	    background-color: #fcb259;
	    color: white;
	    padding: 14px 20px;
	    margin: 8px 0;
	    border: none;
	    cursor: pointer;
	    width: 100%;
	}
input[type=text], input[type=tel], input[type=password] {
	color: black;
   width: 300px;
   padding: 12px 20px;
   margin: 8px 0;
   display: inline-block;
   border: 1px solid #ccc;
   box-sizing: border-box;
</style>
</head>
<body>  
<input id="inputMessage" type="text"
		onkeydown="if(event.keyCode==13){send();}" />
<input type="submit" class="btn btn-danger btn-lg" value="전송" onclick="send();"/>
<div id="messageWindow2" style="padding:10px 0; height: 20em; overflow: auto;"></div>
</body>

<%
	String id = "";
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}
	
	String nick = (String)session.getAttribute("memberId");
	String grade = (String)session.getAttribute("grade");
	if (session.getAttribute("nick") != null) {
		nick = (String) session.getAttribute("nick");
	} else {
		nick = (String)session.getAttribute("memberId");
	} 
%>
	<script type="text/javascript">
		var webSocket = new WebSocket('ws://localhost:8070/pcm/singleBroadcasting');
		var inputMessage = document.getElementById('inputMessage');
		var re_send = "";
		var cnt = 0;
		webSocket.onerror = function(event) {
			onError(event)
		};
		webSocket.onopen = function(event) {
			onOpen(event)
		};
		webSocket.onmessage = function(event) {
			onMessage(event)
		};
		
		function onMessage(event) {
			
			var message = event.data.split("|");
				if(message[0] != re_send) {
					var who = document.createElement('div');
					
					who.style["padding"]="10px";
					who.style["margin-left"]="10px";
					
					who.innerHTML = message[0];
					document.getElementById('messageWindow2').appendChild(who);
					
					re_send = message[0];
				}
				
				var div=document.createElement('div');
				
				div.style["width"]="auto";
				div.style["word-wrap"]="break-word";
				div.style["display"]="inline-block";
				div.style["background-color"]="#fcfcfc";
				div.style["border-radius"]="10px";
				div.style["padding"]="10px";
				div.style["margin-left"]="10px";
				
				div.innerHTML = message[2];
				alert("메시지가 도착했습니다!")
				document.getElementById('messageWindow2').appendChild(div);
				
			var clear=document.createElement('div');
			clear.style["clear"]="both";
			document.getElementById('messageWindow2').appendChild(clear);
			
			messageWindow2.scrollTop = messageWindow2.scrollHeight;
		}
		
		function onClose(event) {
			var div=document.createElement('div');
			
			webSocket.send("<%=nick%> is DisConnected\n");
		}
		
		function onOpen(event) {
			var div=document.createElement('div');
			
			div.style["text-align"]="center";
			
			div.innerHTML = "관리자 전용 1:1 채팅";
			document.getElementById('messageWindow2').appendChild(div);
			
			var clear=document.createElement('div');
			clear.style["clear"]="both";
			document.getElementById('messageWindow2').appendChild(clear);
			
			webSocket.send("<%=nick+"|"+grade%>|안녕하세요^^");
		}
		
		function onError(event) {
			alert("chat_server connecting error " + event.data);
		}
		
		function send() {
			
			if(inputMessage.value!=""){
				webSocket.send("<%=nick+"|"+grade%>|"+ inputMessage.value);
				
				var div=document.createElement('div');
				
				div.style["width"]="auto";
				div.style["word-wrap"]="break-word";
				div.style["float"]="right";
				div.style["display"]="inline-block";
				div.style["background-color"]="#ffea00";
				div.style["padding"]="3px";
				div.style["border-radius"]="3px";
				div.style["margin-right"]="3px";
				
				div.innerHTML = inputMessage.value;
				document.getElementById('messageWindow2').appendChild(div);
				
				var clear = document.createElement('div');
				clear.style["clear"] = "both";
				document.getElementById('messageWindow2').appendChild(clear);
				
				inputMessage.value = '';
				
				messageWindow2.scrollTop = messageWindow2.scrollHeight;
				
				re_send = "<%=nick%>";
			}
		}
	</script>
<script src="http://ajax.googleapis.com/ajax/libs/jqery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</html>