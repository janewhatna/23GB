<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.gb23.gb23.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script>
	$(function() {
		$("#go")
				.click(
						function() {
							var id = $("input[name='id']").val();
							var pwd = $("input[name='pwd']").val();
							$
									.ajax({
										url : "/gb23/login", //url
										data : "userid=" + id + "&passwd="
												+ pwd, //넘겨야 할 데이터  
										type : "get",
										dataType : "json",
										success : function(response) { //성고했을 때!
											console.log(response);
											if (response.no == 1) {
												window.location.href = "/gb23/member";
											} else {
												alert("아이디 또는 비밀번호를 다시 확인하세요. 23GB에 등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.");

											}
										},
										error : function(jqXHR, status, e) { //실패
											console.error(status + " : " + e);
										}
									});
						});
	});
	$(function() {
		$("#findId").click(function() {
			var name = $("input[name='name']").val();
			var pass = $("input[name='passwd']").val();

			$.ajax({
				url : "/gb23/idFind", //url
				data : "uname=" + name + "&passwd=" + pass, //넘겨야 할 데이터  
				type : "get",
				dataType : "json",
				success : function(response) { //성고했을 때!
					if (response.uname == name) {
						console.log(response.uname);
						console.log(name);
						alert("당신의 아이디는 " + response.userid + " 입니다.");
					} else {
						alert("23GB에 등록되지 않은 아이디입니다.");
					}
				},
				error : function(jqXHR, status, e) { //실패
					console.error(status + " : " + e);
				}
			});
		});
	});

	$(function(){
		$("#findPwd").click(function(){
			var name = $("input[name='uname']").val();
			var id = $("input[name='userid']").val();
	
	
			$.ajax({
				url : "/gb23/pwdFind", //url
				data : "uname=" + name + "&userid=" + id, //넘겨야 할 데이터  
				type : "get",
				dataType : "json",
				success : function(response) { //성고했을 때!
					console.log(response);
					if(response.uname == name){	
						alert("당신의 패스워드는 "+response.passwd+" 입니다.");
					 }else {						 
						alert("23GB에 등록되지 않은 아이디입니다.");
					 }
				},
				error : function(jqXHR, status, e) { //실패
					console.error(status + " : " + e);
				}
			});
		});	
	});

	$(function() {
		$("#find").click(function() {
			$(".find").show();
			$(".logIn").css("display", "none");
		});
	});
</script>
</head>
<body>


	<!-- -----------------------모달 타이틀---------------------- -->
	<div class="modal-header">

		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<div class="logIn">
			<h4 class="modal-title" id="myModalLabel">로그인</h4>
		</div>
		<div class="find" style="display: none">
			<h4 class="modal-title" id="myModalLabel">아이디/비번찾기</h4>
		</div>
	</div>
	<!-- ---------------------모달내용--------------------- -->
	<div class="modal-body">
		<div class="logIn">
			<div class="panel-body">

				<input type="text" class="form-control input-lg" placeholder="ID"
					name="id"> <input type="password"
					class="form-control input-lg" placeholder="PASSWORD" name="pwd">
				<br /> <input type="submit" id="go" value="로그인"
					class="btn btn-lg btn-info btn-block"> <input type="button"
					id="find" onclick="find(true)" value="비밀번호/아이디 찾기"
					class="btn btn-lg btn-info btn-block"> <br />

			</div>
		</div>

		<div class="find" style="display: none">
			<h5>* 회원가입시 작성하였던 이름과 비밀번호를 입력하여 주세요.</h5>


			<form>
				<div>
					<ul>
						<li><input type="text" class="form-control input-lg"
							placeholder="NAME" name="name"></li>
						<li><input type="password" class="form-control input-lg"
							placeholder="PASSWORD" name="passwd"> <input
							type="button" id="findId" onclick="find(true)" value="아이디 찾기"
							class="btn btn-lg btn-info btn-block"></li>
					</ul>
				</div>
			</form>
			
			<hr>
			<h5>* 회원가입시 작성하였던 이름과 아이디을 입력하여 주세요.</h5>
			<form>
				<div>
					<ul>
						<li>
						<input type="text" class="form-control input-lg" placeholder="NAME" name="uname" >		
							
						</li>
						<li>			
						
						<input type="text" class="form-control input-lg" placeholder="ID" name="userid" >	
						
						<input type="button" id="findPwd" onclick="find(true)" value="비밀번호 찾기" class="btn btn-lg btn-info btn-block">
				
						</li>
					</ul>
					
				</div>
			</form>
		</div>
	</div>
			<!-- <hr>
			<h5>비밀번호 찾기</h5>


			<form>
				<div>
					<ul>
						<li><strong>이름</strong> <input type="text" name="uname">
						</li>
						<li><strong>아이디</strong><input type="text" name="userid">
						</li>
						<li><strong>비밀번호질문</strong>
								<select name="qt_no">
								<option value="1">2015년 애인의 유무?</option>
								<option value="2">가장 기억에 남는 별명?</option>
								<option value="3">가장 친한 친구의 이름?</option>
								<option value="4">엄마가 자주 하지만 그만했으면 하는 음식?</option>
								<option value="5">엄마의 잔소리 베스트 1위?</option>
								<option value="6">좋아하는 영화 제목 또는 감독?</option>
								<option value="7">싫어하는 영화 제목 또는 감독</option>
						</select></li>
						<li><strong>비밀번호답변</strong> <input type="text" name="pwdans">
							<input type="button" id="findPwd" onclick="find(true)"
							value="비밀번호 찾기" class="btn btn-lg btn-info btn-block"></li>
					</ul>
					<p>* 회원가입시 작성하였던 이름과 아이디을 입력하여 주세요.</p>
				</div>
			</form>
		</div>
	</div> -->

	<!-- ---------------------모달 하단--------------------- -->
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	</div>

	<!-- 모달 	모달 	모달 	모달 	모달 	모달 	모달 	모달 	모달 	 -->
	<form>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myLargeModalLabel" aria-hidden="true"
			data-backdrop="false" style="background-color: rgba(0, 0, 0, 0.5);">
			<div class="modal-dialog">
				<div class="modal-content"></div>
			</div>
		</div>
	</form>


</body>
</html>