<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.gb23.gb23.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*" %>


<!DOCTYPE html>
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
img {
	position: absolute;
	left: 250px;
	top: 30px;
}
</style>
<script type="text/javascript">
function ost(){
	if(confirm("'확인'을 누르시면 멜론 창으로 연결됩니다.")==true){
		var title = document.getElementById("Title").name;
		location.href="http://www.melon.com/search/total/index.htm?q="+title+"+&section=&searchGnbYn=Y&ipath=srch_form";
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

 <%
 		MemberVO vo=(MemberVO)session.getAttribute("loginInfo");
 %>

    
 <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/clean-blog.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
</head>
<body onload="GetTime()">
	
  <!-- Navigation -->
    <nav class="navbar navbar-default navbar-custom navbar-fixed-top">
     <div class="container-fluid">
 <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/gb23/member">무례한 23GB</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
      
                    <li>
                        <a href="/gb23/member">Main</a>
                    </li>
                                      
                    <li>
                        <a href="#">MyPage</a>
                    </li>
                    
                      <li>
                        <a href="/gb23/movie_register_view">영화등록</a>
                    </li>
                   <li>
                   <form action="/gb23/logout" method="post">
 					<input	type="submit" value="logout">
				</form>
</li>
                </ul>
            </div>
        </div>
        </nav>
        
          <header class="intro-header" style="background-image: url('img/laboum.jpg')">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div class="site-heading">
                        <h1>ㅇㅇㅇ</h1>
                        <hr class="small">
                        <span class="subheading">23GB가 추천하는 영화</span>
                    </div>
                </div>
            </div>
        </div>
    </header>
<!-- 검색창 검색창검색창검색창검색창검색창검색창검색창검색창검색창검색창검색창검색창검색창검색창검색창검색창  -->
<form action="/gb23/mem_search_result" method="post">
		<select id="selector" name="selector" onChange="check()">
			<option value="title">TITLE</option>
			<option value="genre">GENRE</option>
			<option value="actors">ACTORS</option>
		</select>
			 <input type="hidden" name=mb_no value = "<%=vo.getMb_no()%>"	> 
		 <input type="text" name=content style="margin-left: 550px;" size="50"> 
		 <input	type="submit" value="Go">
	</form>

	
	
	<!-- 메인으로  -->	<!-- 메인으로  -->	<!-- 메인으로  -->	<!-- 메인으로  -->	<!-- 메인으로  -->
	<a href="/gb23/go_mem_main">메인으로</a>	
	
	
<%
 		if(vo==null){
 %>

<a href="logIn.jsp">로그인</a>
<%   }else{ %>
			mb_no= <%=vo.getMb_no() %><br>
			우선순위 1=<%=vo.getGenre1() %><br>
			우선순위 2=<%=vo.getGenre2() %><br>
			우선순위 3=<%=vo.getGenre3() %><br>
			<a href="update.jsp">회원정보수정하기</a>
<%	  } %>
	
<!-- detail view --><!--detail view --><!-- detail view -->
	<a href="/gb23/detail_search">상세검색</a>	
<!--       logout              -->	
	<form action="/gb23/logout" method="post">
  <input	type="submit" value="logout">
</form>
	
	
<!-- 검색 결과 출력  --><!-- 검색 결과 출력  --><!-- 검색 결과 출력  --><!-- 검색 결과 출력  --><!-- 검색 결과 출력  --><!-- 검색 결과 출력  -->
	<c:forEach items="${requestScope.list}" var="mvo">
		<div
			style="border: 1px solid; border-width: 100; text-align: left; width: 50; height: 30; position: relative; top: 100px; left: 250px">
			<h2>${mvo.title}
				<!-- view단에 뜨는 제목 -->
<!--  //////////////////////   버튼 	 //////////////////////	 -->
				<input type="button" id="Title" value="ost" name="${mvo.title}" onclick="ost();">
				<input type="button" id="Title" value="original" name="${mvo.title}" onclick="original();">
			</h2>
		
			장르: ${mvo.genre}<br /> <!-- view단에 뜨는 장르 -->
			감독: ${mvo.director}<br /> <!-- view단에 뜨는 감독 -->
			배우: ${mvo.actors}<br /> <!-- view단에 뜨는 배우 -->
<!--  /////////////////이미지버튼 (디테일뷰 go)////////////////////// -->
		<form action="/gb23/detail_view" method="post">
			<TEXTAREA style="display:none" NAME=content COLS=20 ROWS=1>${mvo.getTitle()}</TEXTAREA>
			<input type="image" src=${mvo.getImage()} width="100" height="100" >
		</form> 	

<!-- 하트  -->	<!-- 하트  -->	<!-- 하트  -->	<!-- 하트  -->	<!-- 하트  -->	<!-- 하트  -->	<!-- 하트  -->	<!-- 하트  -->	<!-- 하트  -->		
	
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
	
</body>
</html>


