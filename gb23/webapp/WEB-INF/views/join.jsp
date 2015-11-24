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
<script>
var xmlReq;

function createAjax(){
	xmlReq = new XMLHttpRequest();//AJAX객체 생성
}

function idcheck(){
	createAjax();
	var id = document.getElementById("id").value;
	xmlReq.onreadystatechange = checking;
	xmlReq.open("get", "/gb23/Idcheck?id="+id, true);
	xmlReq.send(null);

}

function checking(){
	if(xmlReq.readyState == 4){
		if(xmlReq.status == 200){
			printData();
		}
	}
}

function printData(){
	var result = xmlReq.responseText;
	if(result == "true"){
		document.getElementById("idck").innerHTML = "이미 있는 아이디";
	}else{
		document.getElementById("idck").innerHTML = "사용 가능한 아이디";
	}
}	
</script>
<body>
<!-----------------------모달 타이틀----------------------->
	<div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">회원가입</h4>
    </div>
<!-----------------------모달 내용----------------------->
    <div class="modal-body">
<form action="/gb23/join" method="post">
			아이디 <input type="text" name="id" id="id"><input type='button' value='중복확인' onclick="idcheck()"><br /> 
			<div id="idck"></div>
			이름 <input type="text" name="name"><br /> 	
			비밀번호 <input type="password"	name="pwd"><br /> 
			<br>
			<hr>
			<h2>좋아하는 장르 선택</h2>
			<hr>
			<h5>1순위 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2순위&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3순위</h5>
			<select name="genre1">
				<option value="">장르</option>
				<option value="action">액션</option>
				<option value="romance">로맨스 </option>
				<option value="drama">드라마</option>
				<option value="sf">SF</option>
				<option value="docu">다큐</option>
				<option value="horror">공포</option>
				<option value="ero">에로</option>
				<option value="fantasy">판타지</option>
				<option value="comedy">코미디</option>
				<option value="musical">뮤지컬</option>
				<option value="thriller">스릴러</option>
				<option value="family">가족</option>
			</select> 
			<select name="genre2">
				<option value="">장르</option>
				<option value="action">액션</option>
				<option value="romance">로맨스</option>
				<option value="drama">드라마</option>
				<option value="sf">SF</option>
				<option value="docu">다큐</option>
				<option value="horror">공포</option>
				<option value="ero">에로</option>
				<option value="fantasy">판타지</option>
				<option value="comedy">코미디</option>
				<option value="musical">뮤지컬</option>
				<option value="thriller">스릴러</option>
				<option value="family">가족</option>
			</select>
			<select name="genre3">
				<option value="">장르</option>
				<option value="action">액션</option>
				<option value="romance">로맨스</option>
				<option value="drama">드라마</option>
				<option value="sf">SF</option>
				<option value="docu">다큐</option>
				<option value="horror">공포</option>
				<option value="ero">에로</option>
				<option value="fantasy">판타지</option>
				<option value="comedy">코미디</option>
				<option value="musical">뮤지컬</option>
				<option value="thriller">스릴러</option>
				<option value="family">가족</option>

			</select> <br><br> <input type="submit" value="등록하기"> &nbsp;&nbsp;&nbsp;
			<span id="clo" style="cursor: pointer;">취소</span>			
		</form>
	</div>
		</div>
<!-----------------------모달 하단----------------------->
    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
    </div>
</body>
</html>