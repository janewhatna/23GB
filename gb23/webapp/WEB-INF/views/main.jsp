<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.gb23.gb23.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*" import="Boxoffice.Boxoffice"%>

<!DOCTYPE html>
<html>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">


/* 		------------------------박스오피스 링크 글자----------------------------- */
	#title a:link{
		text-decoration:none;
		color:black;
	}
	#title a:hover{
		font-weight:bold;
		text-decoration:underline;
		color:black;
	}
	#title a:visited{
		text-decoration:none;
		color:black;
	}
/* 		--------------글자가 테이블 밖으로 나갔을 시 ...으로 처리해주는 부분------------------- */
table {
	table-layout: fixed;
	width: 120px;
}

td {
	width: 100px;
	font-size: 9pt;
}

td#title {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	padding-left: 20px;
}

td#rank {
	text-align: center;
}

tbody {
	position: relative;
}
/* 		--------------------------------------------------------------- */
</style>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	
	///////////////////박스오피스 시간 마다 나라 바뀌게 해줌///////////////////
	var nowTime = 0;
	var check = true;
	var jfunctionKOR = null;
	var jfunctionUSA = null;

	function GetTime() {
		if (check) {
			document.getElementById("boxoffice_kor").style.display = "";
			document.getElementById("boxoffice_usa").style.display = "none";
			document.getElementById("nation").innerHTML = "한국 순위";
			check = false;
		}

		if (nowTime >= 3) {
			nowTime = 0;
			switchNation();
		} else {
			nowTime += 1;
		}
		//document.getElementById("nowTime").value = nowTime + "초 ";
		setTimeout("GetTime()", 1000);
	}
	function switchNation() {
		if (document.getElementById("boxoffice_kor").style.display == "none") {
			jfunctionKOR();
		} else {
			jfunctionUSA();
		}
	}
	///////////////////박스오피스 애니메이션///////////////////
	$(function() {
		function showKOR() {
			$("#boxoffice_usa").fadeOut(300, function() {
				$("#boxoffice_kor").fadeIn(300);
			});
			document.getElementById("nation").innerHTML = "한국 순위";
		}
		jfunctionKOR = showKOR;
	});

	$(function() {
		function showUSA() {
			$("#boxoffice_kor").fadeOut(300, function() {
				$("#boxoffice_usa").fadeIn(300);
			});
			document.getElementById("nation").innerHTML = "미국 순위";
		}
		jfunctionUSA = showUSA;
	});

	///////////////////박스오피스 클릭 시 페이지 넘어감///////////////////	 
		$(function() {
			$("td#title").children("a").click(function() {
				var data = $(this).text();
				var url = "/gb23/boxoffice_click/" + data;	//주소와 넣을 데이터
				setModal($(this));	//모달 속성 지정해주는 함수 
				$(this).attr("href", url);
			});
		});
	///////////////////Modal 속성 지정///////////////////	
		function setModal($input)
		{
			$input.attr("data-toggle", "modal");
			$input.attr("data-target", "#myModal");
		}
</script>
<%
	Boxoffice box = new Boxoffice(request);
%>
<!-- 현재 리퀘스트로 객체 생성 -->
<title>23GB</title>



 
    
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
	
<!-- 박스오피스 폼 박스오피스 폼 박스오피스 폼 박스오피스 폼 박스오피스 폼 박스오피스 폼 박스오피스 폼 박스오피스 폼 박스오피스 폼 박스오피스 폼 박스오피스 폼 박스오피스 폼  -->
<table id = "boxoffice">	
	<tr>	<th width = "80" id = "nation"></th>	<th  width = "100">영화명</th>	</tr>
	<tbody id = "boxoffice_kor">
		<tr><td id = "rank"><img src="img/1.png"></td>		<td id = "title"><a href = ""><%=box.getTitle(0, "kor")%></a></td></tr>
		<tr><td id = "rank"><img src="img/2.png"></td>		<td id = "title"><a href = ""><%=box.getTitle(1, "kor")%></a></td></tr>
		<tr><td id = "rank"><img src="img/3.png"></td>		<td id = "title"><a href = ""><%=box.getTitle(2, "kor")%></a></td></tr>
		<tr><td id = "rank"><img src="img/4.png"></td>		<td id = "title"><a href = ""><%=box.getTitle(3, "kor")%></a></td></tr>
		<tr><td id = "rank"><img src="img/5.png"></td>		<td id = "title"><a href = ""><%=box.getTitle(4, "kor")%></a></td></tr>
		<tr><td id = "rank"><img src="img/6.png"></td>		<td id = "title"><a href = ""><%=box.getTitle(5, "kor")%></a></td></tr>
		<tr><td id = "rank"><img src="img/7.png"></td>		<td id = "title"><a href = ""><%=box.getTitle(6, "kor")%></a></td></tr>
		<tr><td id = "rank"><img src="img/8.png"></td>		<td id = "title"><a href = ""><%=box.getTitle(7, "kor")%></a></td></tr>
		<tr><td id = "rank"><img src="img/9.png"></td>		<td id = "title"><a href = ""><%=box.getTitle(8, "kor")%></a></td></tr>
		<tr><td id = "rank"><img src="img/10.png"></td> 	<td id = "title"><a href = ""><%=box.getTitle(9, "kor")%></a></td></tr>
	</tbody>
	<tbody id = "boxoffice_usa">
		<tr><td id = "rank"><img src="img/1.png"></td>		<td id = "title"><a href = ""><%=box.getTitle(0, "usa")%></a></td></tr>
		<tr><td id = "rank"><img src="img/2.png"></td>		<td id = "title"><a href = ""><%=box.getTitle(1, "usa")%></a></td></tr>
		<tr><td id = "rank"><img src="img/3.png"></td>		<td id = "title"><a href = ""><%=box.getTitle(2, "usa")%></a></td></tr>
		<tr><td id = "rank"><img src="img/4.png"></td>		<td id = "title"><a href = ""><%=box.getTitle(3, "usa")%></a></td></tr>
		<tr><td id = "rank"><img src="img/5.png"></td>		<td id = "title"><a href = ""><%=box.getTitle(4, "usa")%></a></td></tr>
		<tr><td id = "rank"><img src="img/6.png"></td>		<td id = "title"><a href = ""><%=box.getTitle(5, "usa")%></a></td></tr>
		<tr><td id = "rank"><img src="img/7.png"></td>		<td id = "title"><a href = ""><%=box.getTitle(6, "usa")%></a></td></tr>
		<tr><td id = "rank"><img src="img/8.png"></td>		<td id = "title"><a href = ""><%=box.getTitle(7, "usa")%></a></td></tr>
		<tr><td id = "rank"><img src="img/9.png"></td>		<td id = "title"><a href = ""><%=box.getTitle(8, "usa")%></a></td></tr>
		<tr><td id = "rank"><img src="img/10.png"></td> 	<td id = "title"><a href = ""><%=box.getTitle(9, "usa")%></a></td></tr>
	</tbody>
</table>
	
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/clean-blog.min.js"></script>
	
	<!-- 모달 	모달 	모달 	모달 	모달 	모달 	모달 	모달 	모달 	 -->
 	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" data-backdrop="false" style="background-color: rgba(0, 0, 0, 0.5);">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    </div>
	  </div>
	</div>
	
	<div id = "moveOFcuteboy" positon ="relative" style="margin-left: 200px;  background-color:#FFDDCD; width : 1500px; height :500px" >
	 <header>
		<h1>주간순위</h1>
		
		<div id="fps">Framerate: 0/60 FPS</div>
	</header>
	

        <link rel="stylesheet" href="css/style.css">
	<div id="contentContainer" class="trans3d"> 
	<section id="carouselContainer" class="trans3d">
		<figure id="item1" class="carouselItem trans3d" ><div class="carouselItemInner trans3d"><img src="img/laboum.jpg"></div></figure>
		<figure id="item2" class="carouselItem trans3d"><div class="carouselItemInner trans3d"><img src="img/마션.jpg"></div></figure>
		<figure id="item3" class="carouselItem trans3d"><div class="carouselItemInner trans3d">3</div></figure>
		<figure id="item4" class="carouselItem trans3d"><div class="carouselItemInner trans3d">4</div></figure>
		<figure id="item5" class="carouselItem trans3d"><div class="carouselItemInner trans3d">5</div></figure>
		<figure id="item6" class="carouselItem trans3d"><div class="carouselItemInner trans3d">6</div></figure>
		<figure id="item7" class="carouselItem trans3d"><div class="carouselItemInner trans3d">7</div></figure>
		<figure id="item8" class="carouselItem trans3d"><div class="carouselItemInner trans3d">8</div></figure>
		<figure id="item9" class="carouselItem trans3d"><div class="carouselItemInner trans3d">9</div></figure>
		<figure id="item10" class="carouselItem trans3d"><div class="carouselItemInner trans3d">10</div></figure>
		<figure id="item11" class="carouselItem trans3d"><div class="carouselItemInner trans3d">11</div></figure>
		<figure id="item12" class="carouselItem trans3d"><div class="carouselItemInner trans3d">12</div></figure>	
	</section>
	</div>
	
    <script src='http://www.johnblazek.net/codepen-resources/3d-carousel/js/libs.min.js'></script>

        <script src="js/index.js"></script>
	
	</div>
	
    
    
    
     <!-- Footer -->
    <footer>
        <div class="container" style=" margin-top: 1000px;">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <ul class="list-inline text-center">
                        <li>
                            <a href="#">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-facebook fa-stack-1x fa-inverse"></i>
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-github fa-stack-1x fa-inverse"></i>
                                </span>
                            </a>
                        </li>
                    </ul>
                    <p class="copyright text-muted">Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </div>
    </footer>
    
</body>
</html>

<!-- 페이징 -->

<html>
<head>
	<meta name="description" content="jQuery HTML Canvas Animation Demo developed using jQuery and JavaScript coding. Displays live animation using latest HTML5 technology with the google logo." />
	<meta name="keywords" content="jQuery html5 demo,jquery html5 canvas demo,html5 canvas demo,google html5 demo" />

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="../script.js"></script>
	
<script type="text/javascript" src="http://www.jquery4u.com/demos/jquery-quick-pagination/js/jquery.quick.pagination.min.js"></script>


<script type="text/javascript">
$(document).ready(function() {
	$("ul.pagination1").quickPagination();
	$("ul.pagination2").quickPagination({pagerLocation:"both"});
	$("ul.pagination3").quickPagination({pagerLocation:"both",pageSize:"3"});
});
</script>

<style type="text/css">
#content { background-color:white; }
</style>


<title>jQuery4u demo - html5 canvas animation</title>
</head>
<body onload="init()"  >



		
 <ul class="pagination3">
	<li>1 - Item 1 of 25</li>
    <li>2 - Item 2 of 25</li>
    <li>3 - Item 3 of 25</li>
    <li>4 - Item 4 of 25</li>
    <li>5 - Item 5 of 25</li>
    <li>6 - Item 6 of 25</li>

    <li>7 - Item 7 of 25</li>
    <li>8 - Item 8 of 25</li>
    <li>9 - Item 9 of 25</li>
	<li>10 - Item 10 of 25</li>
    <li>11 - Item 11 of 25</li>
    <li>12 - Item 12 of 25</li>

    <li>13 - Item 13 of 25</li>
    <li>14 - Item 14 of 25</li>
    <li>15 - Item 15 of 25</li>
    <li>16 - Item 16 of 25</li>
    <li>17 - Item 17 of 25</li>
    <li>18 - Item 18 of 25</li>

    <li>19 - Item 19 of 25</li>
    <li>20 - Item 20 of 25</li>
    <li>21 - Item 21 of 25</li>
    <li>22 - Item 22 of 25</li>
    <li>23 - Item 23 of 25</li>
    <li>24 - Item 24 of 25</li>
	<li>25 - Item 25 of 25</li>
</ul>

</body>
</html>


   
    
    


