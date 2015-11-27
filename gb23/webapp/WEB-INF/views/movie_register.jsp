<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>




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

<form action="/gb23/movie_register" method="post">
			영화ID<input type="text" name="movID"><br />
			제목<input type="text" name="title"><br />
			부제목,제작년도  <input type="text" name="subTitle"><br />
			줄거리    <input type="text" name="summary"><br />
			전체평점    <input type="text" name="score"><br />
			이미지URL<input type="text" name="imgURL"><br />
			개봉일 <input type="text" name="releaseDate"><br />
			상영시간<input type="text" name="runningTime"><br />
			감독ID<input type="text" name="dID" id ="dID"><br />
	
			
			배우ID<input type="text" name="aID"><br />
			주연/조연<input type="text" name="part"><br /> <!-- 체크박스 -->
			극중역할<input type="text" name="role"><br />
			장르ID<input type="text" name="gID"><br />
			국가ID<input type="text" name="nID"><br />
			              
			
			
			<input type="submit" value="등록"><br/>
</form>		
</div>
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