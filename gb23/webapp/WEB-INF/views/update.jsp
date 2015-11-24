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
아이디 : <input type="text" name="id" readonly="readonly" value="<%=vo.getId() %>"><br>
이름 : <input type="text" name="name" value="<%=vo.getName() %>"><br>
비밀번호 : <input type="text" name="pass" value="<%=vo.getPwd() %>"><br>
<input type="submit" value="확인">
</form>
<%
	}
%>
</body>
</html>