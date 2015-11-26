<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

	<h4>아이디/비밀번호 찾기</h4>


	<form method="POST" action="/gb23/contact?type=idFind">
		<h5>아이디 찾기</h5>
		<div>
			<ul>
				<li><strong>이름</strong>
					<div>
						<input type="text" name="name" />
					</div></li>
				<li><strong>비밀번호</strong>
					<div>
						<input type="text" name="pwd" /> 
						<input type="submit" value="찾기" />
					</div></li>
			</ul>
			<p>* 회원가입시 작성하였던 정보를 입력하여 주세요.</p>
		</div>
	</form>



	<!-- <h4 class="content_title">아이디/비밀번호 찾기</h4> -->

	<form method="POST" action="/gb23/pwdhint">
		<h5>비밀번호 찾기</h5>
		<div>
			<ul>
				<li><strong>이름</strong>
					<div>
						<input type="text" name="name" />
					</div></li>
				<li><strong>아이디</strong>
					<div>
						<input type="text" name="id" /> 
					</div></li>
					<li><strong>비밀번호질문</strong>
					<div>
			<select id="selectBox" name="pqid">
			<option selected>비밀번호 힌트</option>
			<option value="1">2015년 애인의 유무?</option>
			<option value="2">가장 기억에 남는 별명?</option>
			<option value="3">가장 친한 친구의 이름?</option>
			<option value="4">엄마가 자주 하지만 그만했으면 하는 음식?</option>
			<option value="5">엄마의 잔소리 베스트 1위?</option>
			<option value="6">좋아하는 영화 제목 또는 감독?</option>
			<option value="7">싫어하는 영화 제목 또는 감독</option>
			</select>
					</div></li>
					<li><strong>비밀번호답변</strong>
					<div>
						<input type="text" name="pwdans" /> 
						<input type="submit" value="찾기" />
					</div></li>
			</ul>
			<p>* 회원가입시 작성하였던 정보를 입력하여 주세요.</p>
		</div>
	</form>

</body>
</html>