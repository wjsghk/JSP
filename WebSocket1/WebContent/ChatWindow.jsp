<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
	var webSocket = new WebSocket(
			"ws://119.196.108.236/WebSocket1/ChatingServer");//멀티 채팅하는법 localhost:8081->ip주소
	var chatWindow,chatMessage,chatId; //변수 선언
	
	//채칭창이 열리면 대화창,메시지입력창,대화며 표시란 사용할 DOM에 객체 저장
	window.onload = function(){
		chatWindow = document.getElementById("chatWindow");
		chatMessage = document.getElementById("chatMessage");
		chatId = document.getElementById('chatId').value;
	}
	
	//메시지 전송
	function sendMessage(){
		//대화창에 표시
		chatWindow.innerHTML += "<div class= 'myMsg'>" + chatMessage.value + "</div>"//나의 창에 내가 보낸 메세지 표시
		webSocket.send(chatId + '|' + chatMessage.value);//서버로 문자 전송
		chatMessage.value = "";
		chatWindow.scrollTop = chatWindow.scrollHeight;//스크롤 자동 이동
	}
	
	//서버와의 연결 종료
	function disconnect(){
		webSocket.close();
	}
	
	
	//엔터키 입력처리
	function enterKey(){
		if(window.event.keyCode == 13 ){
			sendMessage();
		}
	}
			//웹소켓 서버에 연결됐을 때 실행	
			webSocket.onopen = function(event){
				chatWindow.innerHTML += " 웹소켓 서버에 연결되었습니다.<br/>";
			};
			//웹소켓이 닫혔을 때 실행
			webSocket.onclose = function(event){
				chatWindow.innerHTML += " 웹소켓 서버가 종료되었습니다.<br/>";
			};
			//에러 발생시 실행
			webSocket.onerror = function(event){
				alert(event.data);
				chatWindow.innerHTML += " 채탱중 에러가 발생하였습니다.<br/>";
			};
			//메시지 받았을때 실행
			webSocket.onmessage = function(event){
				var message = event.data.split("|");//대화명과 메시지 분리
				var sender = message[0];//보낸 사람의 대화명
				var content = message[1];//메시지 내용
				
				
				if(content !=""){
					if(content.match("/")){//귓속말형태[ ] => /아이디 띄어쓰기 
						if(content.match(("/"+chatId))){//나에게 보낸 메시지만 출력
							var temp = content.replace(("/" + chatId),"[귓속말] : ");
							chatWindow.innerHTML += "<div>" + sender + "" + temp + "</div>";
						}
					}
					else{//일반대화
						chatWindow.innerHTML += "<div>" + sender + " : " + content + "</div>";
					}
				}
			chatWindow.scrollTop = chatWindow.scrollHeight;
			};
	
</script>		

<style>
	#chatWindow{border:1px solid black; width:270px; height:310px; overflow:scroll; padding:5px;}
	#chatMessage{width:236px; height:30px;}
	#sendBtn{height:30px; position:relative; top:2px; left:-2px;}
	#chatId{width:158px; height:24px; border:1px solid#AAAAAA; background-color:#EEEEEE;}.myMsg{text-align:right;}
</style>
	
		

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	대화명 : <input type="text" id="chatId" value="${param.chatId }" readonly/>
	<button id="closeBtn" onclick="disconnect();">채팅 종료</button>
	<div id="chatWindow"></div>
	<div>
	<input type="text" id="chatMessage" onkeyup="enterKey();">
	<button id="sendBtn" onclick="sendMessage();">전송</button>
	</div>
</body>
</html>