<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>WebSocket Chat</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="css/main.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script src="js/chatting.js"></script>
  </head>
<body>
	<div class="container">
	  <h1>MongoDB + SockJS 간이 채팅 Testing</h1>
	  <hr/>
	  <div id="main-content">
	    <div class="row">
	      <div class="col-md-12 space-bottom10">
	        <form class="form-inline">
	          <div class="form-group">
	            <label for="from">접속할 사용자 이름을 입력하세요.</label>
	            <input type="text" id="from" class="form-control"
			   placeholder="이름을 입력하세요...">
	          </div>
	          <button id="connect"
			  class="btn btn-primary"
			  type="submit">접속하기</button>
	          <button id="disconnect"
			  class="btn btn-danger"
			  type="submit"
			  disabled="disabled">퇴장</button>
		</form>
	      </div>
	    </div>
	    <div class="row space-bottom10">
	      <form>
		<div class="col-md-2">
		  <select name="topic"
			  id="topic"
			  class="form-control">
		    <option>코딩이야기</option>
		    <option>일상이야기</option>
		    <option>여행이야기</option>
		    <option>음악이야기</option>
		  </select>
		</div>
		<div class="col-md-6">
		  <input type="text"
			 id="text"
			 class="form-control"
			 placeholder="보낼 내용을 입력하세요...">
		</div>
		<div class="col-md-4">
	          <button id="send"
			  class="btn btn-info"
			  type="submit">보내기</button>
			  &nbsp;&nbsp;
			  <button id="refresh"
			  class="btn btn-primary"
			  type="button">새로 고침</button>
		</div>
		<div class="col-md-4">
	          
		</div>
	      </form>
	    </div>
	    <div class="row">
	      <div class="col-md-12">
	        <table id="conversation" class="table table-striped">
	          <thead>
	            <tr>
		          <th width="10%">올린이</th>
	              <th width="15%">주제</th>
		          <th width="60%">내용</th>
		          <th width="10%">시간</th>
	            </tr>
	          </thead>
	          <tbody id="messages">
	          </tbody>
	        </table>
	      </div>
	    </div>
	  </div>
  </div>
</body>
</html>
