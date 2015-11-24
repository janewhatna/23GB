<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.gb23.gb23.vo.MemberVO" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page import ="java.util.*"%>  
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="js/jquery-1.11.3.js"></script>
 <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function() { // jQuery를 시작하는 데... main()

			$("input[name='rating']").click(function() {
			var $input = $(this);
			var value = $input.val(); //value
			
			var $parent = $input.parent( "div.btn-group" );
			var no = $parent.attr( "data-no" ); //number of movies
			
			var result = "";
			console.log("!!!!!!!!!!!! - " + value + ":" + no);
			
			$parent.children("input").each(function(index){
				if(index >= value)
				{	
					if(index % 2 == 1)
					{	$(this).attr("src", "img/heart_r_blur.png");	}
					else
					{	$(this).attr("src", "img/heart_l_blur.png");	}
				}
				else
				{	
					if(index % 2 == 1)
					{	
						 $(this).fadeOut(150,function(){
							$(this).fadeIn(800).attr("src", "img/heart_r.png");
				             });
					}
					else
					{	
						 $(this).fadeOut(150,function(){
							 $(this).fadeIn(800).attr("src", "img/heart_l.png");
				             });
						}
					//$(this).fadeIn(300);
				}
			});
		 
			$.ajax({
				url : "/gb23/rating_result", //url
				data : "n=" + no + "&r=" + value, //넘겨야 할 데이터  
				type : "get",
				dataType : "json",
				success : function(response) { //성고했을 때!
 					console.log(response);
					result = response;
				},
				error : function(jqXHR, status, e) { //실패
					console.error(status + " : " + e);
				}
			});
			return result;
		});
	});
</script>
<title>23GB</title>
<style type="text/css">
	div{border:1px solid; padding:10px; }
	
	img{
		position:absolute;
		left:200px; 
		top:30px;
	}
	
	button{
		display:hidden;
		height:15px;
		
		width:15px;
	}
	#button_l{
		display:hidden;
		height:15px;
		width:15px;
	}
	
</style>
<script type="text/javascript">
	function ost(){
		if(confirm("'확인'을 누르시면 멜론 창으로 연결됩니다.")==true){
			var title = document.getElementById("Title").name;
			location.href="http://www.melon.com/search/total/index.htm?q="+title+"+OST&section=&searchGnbYn=Y&ipath=srch_form";
		}else{
			return ;
		}
	}
	
	function original(){
		if(confirm("'확인'을 누르시면 교보문고 창으로 연결됩니다.")==true){
			location.href="";
		}else{
			return ;
		}
	}

</script>
</head>
<body>
<h2> </h2>
 <%
 		MemberVO vo=(MemberVO)session.getAttribute("loginInfo");
 %>

<!-- 검색 결과 출력  -->
<c:set var="i" value="0"></c:set>
<c:forEach items="${requestScope.list}" var="mvo">
<img type="image" src=${mvo.getImage()} width="950" height="400"> 
<div style="text-align:left; width:100; height:100; position:relative; top:450px; left:190px">
	<c:set var="i" value="${i+1 }"></c:set>
	<h2>${mvo.getTitle()} <!-- view단에 뜨는 제목 -->
<!-- 버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼  -->

	<input type="button" id="Title" value="ost" name="${mvo.getTitle()}" onclick="ost();">
	<input type="button" id="Title" value="original" name="${mvo.getTitle()}" onclick="original();"></h2>
	
<!-- 버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼버튼  -->

	장르: ${mvo.getGenre()}   | 미국 | 121분 | 2-15.09.24<br/>  <!-- detail_view단에 뜨는 장르 -->
	감독: ${mvo.getDirector()}<br/>  <!-- detail_view단에 뜨는 감독 -->
	배우: ${mvo.getActors()}<br/>  <!-- detail_view단에 뜨는 배우 -->
	줄거리:  불라불라불라 <br/> <!-- detail_view단에 뜨는 줄거리 -->

 	<div class="btn-group" data-no="${mvo.mv_no}">
				<input type="image" src="img/heart_l_blur.png" onfocus='this.blur()' name="rating" value="1"> 
				<input type="image" src="img/heart_r_blur.png" onfocus='this.blur()' name="rating" value="2" style="margin-left: -6.5px;"> 
				<input type="image" src="img/heart_l_blur.png" onfocus='this.blur()' name="rating" value="3"> 
				<input type="image" src="img/heart_r_blur.png" onfocus='this.blur()' name="rating" value="4" style="margin-left: -6.5px;"> 
				<input type="image" src="img/heart_l_blur.png" onfocus='this.blur()' name="rating" value="5"> 
				<input type="image" src="img/heart_r_blur.png" onfocus='this.blur()' name="rating" value="6" style="margin-left: -6.5px;"> 
				<input type="image" src="img/heart_l_blur.png" onfocus='this.blur()' name="rating" value="7"> 
				<input type="image" src="img/heart_r_blur.png" onfocus='this.blur()' name="rating" value="8" style="margin-left: -6.5px;"> 
				<input type="image" src="img/heart_l_blur.png" onfocus='this.blur()' name="rating" value="9"> 
				<input type="image" src="img/heart_r_blur.png" onfocus='this.blur()' name="rating" value="10" style="margin-left: -6.5px;">
			
			</div>
 	


</div>

</c:forEach>
<!-- 검색창 검색창검색창검색창검색창검색창검색창검색창검색창검색창검색창검색창검색창검색창검색창검색창검색창  -->
<form action="/gb23/mem_search_result" method="post">
		<select id="selector" name="selector" onChange="check()">
			<option value="title">TITLE</option>
			<option value="genre">GENRE</option>
			<option value="actors">ACTORS</option>
		</select>
			 <input type="hidden" name=mb_no value = "<%=vo.getMb_no()%>"	> 
		 <input type="text" name=content style="margin-left: 550px; margin-top: 500px;" size="50"> 
		 <input	type="submit" value="Go">
	</form>
	

<!-- 검색창 검색창검색창검색창검색창검색창검색창검색창검색창검색창검색창검색창검색창검색창검색창검색창검색창  -->
<a href="/gb23/go_mem_main">메인으로</a><br>

<!--       logout              -->	
	<form action="/gb23/logout" method="post">
  <input	type="submit" value="logout">
</form>
	

</body>
</html>












