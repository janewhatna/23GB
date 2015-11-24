<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.gb23.gb23.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="description" content="jQuery HTML Canvas Animation Demo developed using jQuery and JavaScript coding. Displays live animation using latest HTML5 technology with the google logo." />
	<meta name="keywords" content="jQuery html5 demo,jquery html5 canvas demo,html5 canvas demo,google html5 demo" />
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
 
 <style type="text/css">
img#asd {
/* 	position: absolute; */
	left: 250px;
	top: 30px;
}
#content { background-color:white; } 
</style>

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

<script type="text/javascript">
///////////////////OST페이지이동///////////////////
function ost(){
	if(confirm("'확인'을 누르시면 멜론 창으로 연결됩니다.")==true){
		var title = document.getElementById("Title").name;
		location.href="http://www.melon.com/search/total/index.htm?q="+title+"+OST&section=&searchGnbYn=Y&ipath=srch_form";
	}else{
		return ;
	}
}
//////////////////책 페이지이동///////////////////
function original(){
	if(confirm("'확인'을 누르시면 교보문고 창으로 연결됩니다.")==true){
		location.href="";
	}else{
		return ;
	}
}


</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="../script.js"></script>
	
<script type="text/javascript" src="js/ddd.js"></script>
<link rel="stylesheet" type="text/css" href="../style.css">
<link rel="stylesheet" type="text/css" href="css/style.css">

<script type="text/javascript">
$(document).ready(function() {
	$("ul.pagination1").quickPagination();
	$("ul.pagination2").quickPagination({pagerLocation:"both"});
	$("ul.pagination3").quickPagination({pagerLocation:"both",pageSize:"3"});
});
</script>
</head>
<body>

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
                <a class="navbar-brand" href="/gb23/main">무례한 23GB</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="/gb23/main">Main</a>
                    </li>
                    <li>
                        <a href="/gb23/logInForm" onclick="setModal($(this));">Login</a>
                    </li>
                    <li>
                        <a href="/gb23/joinForm" onclick="setModal($(this));">Join</a>
                    </li>
                    <li>
                        <a href="#">MyPage</a>
                    </li>
                    <li>
                        <a href="/gb23/contact">아이디/비밀번호찾기</a>
                    </li>
                      <li>
                        <a href="/gb23/movie_register_view">영화등록</a>
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
	<!--     ///////////////////////////////////////////////////////////////////////      -->

<!-- 검색창  -->
 <form action="/gb23/search_result" method="post">
	<select id="selector" name="selector" onChange="check()">
		<option value="title">TITLE</option>
		<option value="genre">GENRE</option>
		<option value="actors">ACTORS</option>
	</select>
	<input type="text" name=content size="50">
	<input type="submit" value="Go">
</form>

		
<div style="margin:0 auto; width:1000px;">		
 <ul class="pagination1">
	<c:forEach items="${requestScope.list}" var="mvo">
		<li>
			<div style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">
				<h2>${mvo.title}
					<!-- view단에 뜨는 제목 -->
	<!--  //////////////////////   버튼 	 //////////////////////	 -->
					<input type="button" id="Title" value="ost" name="${mvo.title}" onclick="ost();">
					<input type="button" id="Title" value="original" name="${mvo.title}" onclick="original();">
				</h2>
				<img src=${mvo.imgURL} width="100" height="100" data-toggle="modal" id="cuteBoy" href ="/gb23/detail_view/${mvo.movID}" data-target="#myModal"> <!-- view단에 뜨는 이미지  -->
				장르: ${mvo.title}<br /> <!-- view단에 뜨는 장르 -->
				감독: ${mvo.subTitle}<br /> <!-- view단에 뜨는 감독 -->
				배우: ${mvo.presum}<br /> <!-- view단에 뜨는 배우 -->
	
	<!-- 하트  -->	<!-- 하트  -->	<!-- 하트  -->	<!-- 하트  -->	<!-- 하트  -->	<!-- 하트  -->	<!-- 하트  -->	<!-- 하트  -->	<!-- 하트  -->		
		
				<div class="btn-group" data-no="${mvo.mv_no}">
					<input type="image" src="img/heart_l_blur.png" name="rating" value="1"> 
					<input type="image" src="img/heart_r_blur.png" name="rating" value="2" style="margin-left: -6.3px;"> 
					<input type="image" src="img/heart_l_blur.png" name="rating" value="3"> 
					<input type="image" src="img/heart_r_blur.png" name="rating" value="4" style="margin-left: -6px;"> 					
					<input type="image" src="img/heart_l_blur.png" name="rating" value="5"> 
					<input type="image" src="img/heart_r_blur.png" name="rating" value="6" style="margin-left: -6.2px;"> 
					<input type="image" src="img/heart_l_blur.png" name="rating" value="7"> 
					<input type="image" src="img/heart_r_blur.png" name="rating" value="8" style="margin-left: -6px;"> 
					<input type="image" src="img/heart_l_blur.png" name="rating" value="9"> 
					<input type="image" src="img/heart_r_blur.png" name="rating" value="10" style="margin-left: -6px;">
				</div>
			</div>
		</li>
	</c:forEach>
</ul>
</div>


<!-- 모달  -->	<!-- 모달  -->	<!-- 모달  -->	<!-- 모달  -->	<!-- 모달  -->	<!-- 모달  -->	<!-- 모달  -->	<!-- 모달  -->	<!-- 모달  -->	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    </div>
	  </div>
	</div>
</body>
</html>
