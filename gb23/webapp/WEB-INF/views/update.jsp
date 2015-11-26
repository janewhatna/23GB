<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="com.gb23.gb23.vo.MemberVO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	MemberVO vo = (MemberVO)session.getAttribute("loginInfo"); 

	if(vo == null){
%>
	접근할 수 없음
<%

	}else{

%>
<form method="post" action="/gb23/update">
<!-- <input type="hidden" name="command" value="update"> -->
아이디 : <input type="text" name="userid" readonly="readonly" value="<%=vo.getUserid() %>"><br>
<%-- 이름 : <input type="text" name="name" value="<%=vo.getUname() %>"><br> --%>
비밀번호 : <input type="text" name="passwd" value="<%=vo.getPasswd() %>"><br>
비밀번호힌트 : <select id="selectBox" name="pqid">
			<option selected>비밀번호 힌트</option>
			<option value="1">2015년 애인의 유무?</option>
			<option value="2">가장 기억에 남는 별명?</option>
			<option value="3">가장 친한 친구의 이름?</option>
			<option value="4">엄마가 자주 하지만 그만했으면 하는 음식?</option>
			<option value="5">엄마의 잔소리 베스트 1위?</option>
			<option value="6">좋아하는 영화 제목 또는 감독?</option>
			<option value="7">싫어하는 영화 제목 또는 감독</option>
			</select><br>
비밀번호답변 <input type="text" name="passwdans" value="<%=vo.getPasswdans() %>"><br/> 
			<br>
			<hr>
			<h2>좋아하는 장르 선택</h2>
			<hr>
			<h5>1순위 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2순위&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3순위</h5>
			<select name="preferGID1">
				<option value="">장르</option>
				<option value=19>액션</option>
				<option value=5>로맨스 </option>
				<option value=1>드라마</option>
				<option value=18>SF</option>
				<option value=10>다큐</option>
				<option value=4>공포</option>
				<option value=21>에로</option>
				<option value=2>판타지</option>
				<option value=11>코미디</option>
				<option value=17>뮤지컬</option>
				<option value=7>스릴러</option>
				<option value=12>가족</option>
			</select> 
			<select name="preferGID2">
				<option value="">장르</option>
				<option value=19>액션</option>
				<option value=5>로맨스 </option>
				<option value=1>드라마</option>
				<option value=18>SF</option>
				<option value=10>다큐</option>
				<option value=4>공포</option>
				<option value=21>에로</option>
				<option value=2>판타지</option>
				<option value=11>코미디</option>
				<option value=17>뮤지컬</option>
				<option value=7>스릴러</option>
				<option value=12>가족</option>
			</select>
			<select name="preferGID3">
				<option value="">장르</option>
				<option value=19>액션</option>
				<option value=5>로맨스 </option>
				<option value=1>드라마</option>
				<option value=18>SF</option>
				<option value=10>다큐</option>
				<option value=4>공포</option>
				<option value=21>에로</option>
				<option value=2>판타지</option>
				<option value=11>코미디</option>
				<option value=17>뮤지컬</option>
				<option value=7>스릴러</option>
				<option value=12>가족</option>
			</select>
<input type="submit" value="확인">
</form>
<%
	}
%>
</body>
</html>