<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<!-----------------------모달 타이틀----------------------->
	<div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">로그인</h4>
    </div>
<!-----------------------모달 내용----------------------->
    <div class="modal-body">	
<form action="/gb23/login" method="post">
			아이디 <input type="text" name="id"><br /> 
			비밀번호 <input type="password" name="pwd"><br /> 
			<input type="submit" value="입장">
			<span id="cancel" style="cursor: pointer;">취소</span>
</form>		</div>
<!-----------------------모달 하단----------------------->
    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
    </div>
</body>
</html>