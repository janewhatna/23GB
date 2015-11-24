<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.gb23.gb23.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery-1.11.3.js"></script>
<script>
	$(function() { // jQuery를 시작하는 데... main()

		$("input[name='rating']").click(function() {
			var value = $(this).val();
			console.log("!!!!!!!!!!!! - " + value);

			$.ajax({
				url : "/gb23/rating_result", //url
				data : "command=RatingController&rating=" + value, //넘겨야 할 데이터  
				type : "post",
				dataType : "json",
				contentType : 'application/json',
				success : function(response) { //성고했을 때!
					console.log(response.result);
					console.log(response.rating);
				},
				error : function(jqXHR, status, e) { //실패
					console.error(status + " : " + e);
				}
			});
		});

	});
</script>
<title>23GB</title>
<style type="text/css">
img {
	position: absolute;
	left: 250px;
	top: 30px;
}
</style>
<script type="text/javascript">
	function ost() {
		if (confirm("'확인'을 누르시면 멜론 창으로 연결됩니다.") == true) {
			var title = document.getElementById("Title").name;
			document.write(title);
			location.href = "http://www.melon.com/search/total/index.htm?q="
					+title+ "+OST&section=&searchGnbYn=Y&ipath=srch_form";
		} else {
			return;
		}
	}

	function original() {
		if (confirm("'확인'을 누르시면 교보문고 창으로 연결됩니다.") == true) {
			location.href = "";
		} else {
			return;
		}
	}
</script>
</head>
<body>
	<h2>hello!</h2>
<!-- main 이미지main 이미지main 이미지main 이미지main 이미지main 이미지main 이미지 -->
	<img src="img/laboum.jpg" width="950" height="400">

<!-- 검색창 검색창검색창검색창검색창검색창검색창검색창검색창검색창검색창검색창검색창검색창검색창검색창검색창  -->
	<form action="/gb23/search_result" method="post">
		<select id="selector" name="selector">
			<option value="title">TITLE</option>
			<option value="genre">GENRE</option>
			<option value="actors">ACTORS</option>
		</select> <input type="text" name=content
			style="margin-left: 550px; margin-top: 500px;" size="50"> <input
			type="submit" value="Go">
	</form>
	
<!-- 검색 결과 출력  --><!-- 검색 결과 출력  --><!-- 검색 결과 출력  --><!-- 검색 결과 출력  --><!-- 검색 결과 출력  --><!-- 검색 결과 출력  -->
	<c:forEach items="${requestScope.list}" var="list">
		<div
			style="border: 1px solid; border-width: 100; text-align: left; width: 50; height: 30; position: relative; top: 100px; left: 250px">
			<h2>${list.getTitle()}
				<!-- view단에 뜨는 제목 -->
<!--  //////////////////////   버튼 	 //////////////////////	 -->
				<input type="button" id="Title" value="ost" name="${list.getTitle()}" onclick="ost();">
				<input type="button" id="Title" value="original" name="${list.getTitle()}" onclick="original();">
			</h2>
			<img src=${list.getImage() } width="100" height="100"> <!-- view단에 뜨는 이미지  -->
			장르: ${list.getGenre()}<br /> <!-- view단에 뜨는 장르 -->
			감독: ${list.getDirector()}<br /> <!-- view단에 뜨는 감독 -->
			배우: ${list.getActors()}<br /> <!-- view단에 뜨는 배우 -->
			
<!-- 하트  -->	<!-- 하트  -->	<!-- 하트  -->	<!-- 하트  -->	<!-- 하트  -->	<!-- 하트  -->	<!-- 하트  -->	<!-- 하트  -->	<!-- 하트  -->		
			<form action="/gb23/rating_result" method="post">
	
			<TEXTAREA style="display: none" NAME=title COLS=20 ROWS=1>${list.getTitle()}</TEXTAREA> 
			<TEXTAREA style="display: none" NAME=genre COLS=20 ROWS=1>${list.getGenre()}</TEXTAREA> 
			<TEXTAREA style="display: none" NAME=director COLS=20 ROWS=1>${list.getDirector()}</TEXTAREA>
			<TEXTAREA style="display: none" NAME=actors COLS=20 ROWS=1>${list.getActors()}</TEXTAREA>
			<TEXTAREA style="display: none" NAME=list1 COLS=20 ROWS=1>
				<%request.getAttribute("list"); %> </TEXTAREA>
			<input type="hidden">
			<div class="btn-group">
				<input type="image" src="img/heart_l.png" border="0" onfocus='this.blur()' name="rating" value="1"> 
				<input type="image" src="img/heart_r.png" border="0" onfocus='this.blur()' name="rating" value="2" style="margin-left: -6.5px;"> 
				<input type="image" src="img/heart_l.png" border="0" onfocus='this.blur()' name="rating" value="3"> 
				<input type="image" src="img/heart_r.png" border="0" onfocus='this.blur()' name="rating" value="4" style="margin-left: -6.5px;"> 
				<input type="image" src="img/heart_l.png" border="0" onfocus='this.blur()' name="rating" value="5"> 
				<input type="image" src="img/heart_r.png" border="0" onfocus='this.blur()' name="rating" value="6" style="margin-left: -6.5px;"> 
				<input type="image" src="img/heart_l.png" border="0" onfocus='this.blur()' name="rating" value="7"> 
				<input type="image" src="img/heart_r.png" border="0" onfocus='this.blur()' name="rating" value="8" style="margin-left: -6.5px;"> 
				<input type="image" src="img/heart_l.png" border="0" onfocus='this.blur()' name="rating" value="9"> 
				<input type="image" src="img/heart_r.png" border="0" onfocus='this.blur()' name="rating" value="10" style="margin-left: -6.5px;">
			</div>
			</form>
		</div>
	</c:forEach>
</body>
</html>












