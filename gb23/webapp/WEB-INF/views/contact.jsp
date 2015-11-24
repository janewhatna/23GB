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
			<p>* 회원가입시 작성하였던 이름과 이메일을 입력하여 주세요.</p>
		</div>
	</form>



	<!-- <h4 class="content_title">아이디/비밀번호 찾기</h4> -->

	<form method="POST" action="/gb23/contact?type=pwdFind">
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
						<input type="submit" value="찾기" />
					</div></li>
			</ul>
			<p>* 회원가입시 작성하였던 이름과 이메일을 입력하여 주세요.</p>
		</div>
	</form>

</body>
</html>