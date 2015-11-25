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
	var userID = document.getElementById("userID").value.trim();
	if(userID == ""){
	      alert("아이디를 입력해주세요.");
	      return;
	   }
	   createAjax();
	xmlReq.onreadystatechange = checking;
	xmlReq.open("get", "/gb23/Idcheck?userID="+userID, true);
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

<script>
var request = new XMLHttpRequest();
var pwFlag = false;

function pwdcheck(){
	var pw = document.getElementById('passwd').value.trim();
	var pwTwo = document.getElementById('passwd2').value.trim();
	
	var resultStr = '';

	if(pw == '' || pw == 'undifined' || pwTwo == '' || pwTwo == 'undifined'){
		return;
	}else{
		if(pw == pwTwo){
			resultStr = '같다';
			document.getElementById('pw_checker').innerHTML = resultStr;
			pwFlag = true;
		}else{
			resultStr = '다르다';
			document.getElementById('pw_checker').innerHTML = resultStr;
			pwFlag = false;
		}
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
			아이디 <input type="text" name="userID" id="userID">
			<input type='button' value='중복확인' onclick="idcheck()"><br /> 
			<div id="idck"></div>
			비밀번호 <input type="password"	name="passwd" id="passwd" onblur="pwdcheck()"><br/> 
			비밀번호확인 <input type="password" name="passwd2" id="passwd2" onblur="pwdcheck()">
			<span id="pw_checker"></span><br/>
			비밀번호힌트 <select id="selectBox" name="pqID">
			<option selected>비밀번호 힌트</option>
			<option value="1">2015년 애인의 유무?</option>
			<option value="2">가장 기억에 남는 별명?</option>
			<option value="3">가장 친한 친구의 이름?</option>
			<option value="4">엄마가 자주 하지만 그만했으면 하는 음식?</option>
			<option value="5">엄마의 잔소리 베스트 1위?</option>
			<option value="6">좋아하는 영화 제목 또는 감독?</option>
			<option value="7">싫어하는 영화 제목 또는 감독</option>
			</select>
			<br /> 
			비밀번호답변 <input type="text" name="passwdAns" id="passwdAns"><br/> 
			<br>
			<hr>
			<h2>좋아하는 장르 선택</h2>
			<hr>
			<h5>1순위 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				2순위&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3순위</h5>
			<select name="preferGID1">
				<option value="">장르</option>
				<option value="1">드라마</option>
				<option value="2">판타지 </option>
				<option value="3">서부</option>
				<option value="4">공포</option>
				<option value="5">로맨스</option>
				<option value="6">모험</option>
				<option value="7">스릴러</option>
				<option value="8">느와르</option>
				<option value="9">컬트</option>
				<option value="10">다큐멘터리</option>
				<option value="11">코미디</option>
				<option value="12">가족</option>
				<option value="13">미스터리</option>
				<option value="14">전쟁</option>
				<option value="15">애니메이션</option>
				<option value="16">범죄</option>
				<option value="17">뮤지컬</option>
				<option value="18">SF</option>
				<option value="19">액션</option>
				<option value="20">무협</option>
				<option value="21">에로</option>
				<option value="22">서스펜스</option>
				<option value="23">서사</option>
				<option value="24">블랙코미디</option>
				<option value="25">실험</option>
				<option value="26">영화카툰</option>
				<option value="27">영화음악</option>
				<option value="28">영화패러디포스터</option>
				<option value="29">맬로</option>
			</select> 
			<select name="preferGID2">
				<option value="">장르</option>
				<option value="1">드라마</option>
				<option value="2">판타지 </option>
				<option value="3">서부</option>
				<option value="4">공포</option>
				<option value="5">로맨스</option>
				<option value="6">모험</option>
				<option value="7">스릴러</option>
				<option value="8">느와르</option>
				<option value="9">컬트</option>
				<option value="10">다큐멘터리</option>
				<option value="11">코미디</option>
				<option value="12">가족</option>
				<option value="13">미스터리</option>
				<option value="14">전쟁</option>
				<option value="15">애니메이션</option>
				<option value="16">범죄</option>
				<option value="17">뮤지컬</option>
				<option value="18">SF</option>
				<option value="19">액션</option>
				<option value="20">무협</option>
				<option value="21">에로</option>
				<option value="22">서스펜스</option>
				<option value="23">서사</option>
				<option value="24">블랙코미디</option>
				<option value="25">실험</option>
				<option value="26">영화카툰</option>
				<option value="27">영화음악</option>
				<option value="28">영화패러디포스터</option>
				<option value="29">맬로</option>
			</select>
			<select name="preferGID3">
				<option value="">장르</option>
				<option value="1">드라마</option>
				<option value="2">판타지 </option>
				<option value="3">서부</option>
				<option value="4">공포</option>
				<option value="5">로맨스</option>
				<option value="6">모험</option>
				<option value="7">스릴러</option>
				<option value="8">느와르</option>
				<option value="9">컬트</option>
				<option value="10">다큐멘터리</option>
				<option value="11">코미디</option>
				<option value="12">가족</option>
				<option value="13">미스터리</option>
				<option value="14">전쟁</option>
				<option value="15">애니메이션</option>
				<option value="16">범죄</option>
				<option value="17">뮤지컬</option>
				<option value="18">SF</option>
				<option value="19">액션</option>
				<option value="20">무협</option>
				<option value="21">에로</option>
				<option value="22">서스펜스</option>
				<option value="23">서사</option>
				<option value="24">블랙코미디</option>
				<option value="25">실험</option>
				<option value="26">영화카툰</option>
				<option value="27">영화음악</option>
				<option value="28">영화패러디포스터</option>
				<option value="29">맬로</option>

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