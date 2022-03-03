/**
 * web socket
 */
 
 function getId(id) {
	return document.getElementById(id);
}

var data = {};

var ws;
var mid = getId("mid");
var btnLogin= getId("btnLogin");
var btnSend = getId("btnSend");
var talk = getId("talk");
var msg = getId("msg");

btnLogin.onclick = function() {
	ws = new WebSocket("ws://" + location.host + "/chatt");
	alert("그룹 채팅에 참가하셨습니다.");
	ws.onmessage = function(msg) {
		var data = JSON.parse(msg.data);
		var css;
		
		if(data.mid == mid.value) {
			css = 'class=me';
		} else {
			css = 'class=other';
		}
		var item = `<div ${css} > <span>
					<b>${data.mid}</b></span> [${data.date}]<br> 
					<span>${data.msg}</span> </div>`;
		talk.innerHTML += item;
		talk.scrollTop=talk.scrollHeight;
	}
}

msg.onkeyup = function(ev) {
	if(ev.keyCode == 13) {
		send();
	}
}

btnSend.onclick = function() {
	send();
}

function send() {
	if(msg.value.trim() != '') {
		data.mid = getId('mid').value;
		data.msg = msg.value;
		data.date = new Date().toLocaleString();
		var temp = JSON.stringify(data);
		ws.send(temp);
	}
	msg.value='';
}









 