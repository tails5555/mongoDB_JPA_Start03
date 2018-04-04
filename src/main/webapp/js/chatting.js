$(function() {
    'use strict';

    var client;
    
    var messageIdList=[];
    
    function showMessage(mesg){
    	if(!messageIdList.includes(mesg.id)){
    		$('#messages').append('<tr>' +
			      '<td>' + mesg.from.name + '</td>' +
			      '<td>' + mesg.topic + '</td>' +
			      '<td>' + mesg.message + '</td>' +
			      '<td>' + new Date(mesg.currentTime).toLocaleDateString() + '<br/>' + new Date(mesg.currentTime).toLocaleTimeString() + '</td>' +
			      '</tr>');
    		messageIdList.push(mesg.id);
    	}
    }

    function setConnected(connected) {
		$("#connect").prop("disabled", connected);
		$("#disconnect").prop("disabled", !connected);
		$('#from').prop('disabled', connected);
		$('#text').prop('disabled', !connected);
		if (connected) {
		    $("#conversation").show();
		    $('#text').focus();
		}
		else $("#conversation").hide();
		$("#messages").html("");
    }

    $("form").on('submit', function (e) {
    	e.preventDefault();
    });

    $('#from').on('blur change keyup', function(ev) {
    	$('#connect').prop('disabled', $(this).val().length == 0 );
    });
    $('#connect,#disconnect,#text').prop('disabled', true);

    $('#connect').click(function() {
		client = Stomp.over(new SockJS('/example03_1/chat'));
		client.connect({}, function (frame) {
		    setConnected(true);
		    client.subscribe('/topic/messages', function (message) {
			showMessage(JSON.parse(message.body));
		    });
		});
    });

    $('#disconnect').click(function() {
		if (client != null) {
		    client.disconnect();
		    setConnected(false);
		}
		messageIdList = [];
		client = null;
    });

    $('#send').click(function() {
		var topic = $('#topic').val();
		client.send("/app/chat/" + topic, {}, JSON.stringify({
		    from: $("#from").val(),
		    text: $('#text').val(),
		}));
		$('#text').val("");
    });
    
    $('#refresh').click(function() {
		client.send("/app/chat/list", {}, {});
		client.subscribe('/topic/message/refresh', function (message) {
			var array=JSON.parse(message.body);
			array.forEach(function(m){
				showMessage(m);
			});
		});
		$('#text').val("");
    });
});
