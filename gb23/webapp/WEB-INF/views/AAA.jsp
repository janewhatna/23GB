<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.gb23.gb23.vo.MemberVO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 		MemberVO vo=(MemberVO)session.getAttribute("loginInfo");
 %>
 
 			우선순위 1=<%=vo.getGenre1() %><br>
			우선순위 2=<%=vo.getGenre2() %><br>
			우선순위 3=<%=vo.getGenre3() %><br>
</body>
</html>