<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.gb23.gb23.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
/**/

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

<!-- 현재 리퀘스트로 객체 생성 -->
	///////////////////박스오피스 시간 마다 나라 바뀌게 해줌///////////////////
	var nowTime = 0;
	var jfunctionKOR = null;
	var jfunctionUSA = null;

	function GetTime() {
		if (nowTime >= 3) {
			nowTime = 0;
			switchNation();
		} else {
			nowTime += 1;
		}
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
			$('#myModal').find('.modal-content').html('');	//모달을 켰을 시 이전에 있던 모달 데이터 초기화
			$input.attr("data-toggle", "modal");
			$input.attr("data-target", "#myModal");
		}
</script>

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
    <nav class="navbar navbar-default navbar-custom navbar-fixed-top is-fixed is-visible">
     <div class="container-fluid">
 	<!-- Brand and toggle get grouped for better mobile display -->
           <a href="/gb23/main">무례한 23GB</a>
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
<div style="position:absolute; left:50%;">
<div style="position:absolute; left:-400px; width:800px;">	
 <form action="/gb23/search_result" method="post">
	<select id="selector" name="selector" onChange="check()">
		<option value="title">TITLE</option>
		<option value="genre">GENRE</option>
		<option value="actors">ACTORS</option>
	</select>
	<input type="text" name=content size="50">
	<input type="submit" value="Go">
</form>
</div>
</div>
	
<!-- 박스오피스 폼 박스오피스 폼 박스오피스 폼 박스오피스 폼 박스오피스 폼 박스오피스 폼 박스오피스 폼 박스오피스 폼 박스오피스 폼 박스오피스 폼 박스오피스 폼 박스오피스 폼  -->
<table id = "boxoffice">	
	<tr>	<th width = "80" id = "nation">한국 순위</th>	<th  width = "100">영화명</th>	</tr>
	<tbody id = "boxoffice_kor">
		<c:forEach items="${requestScope.bKorea}" var="kor">
			<tr><td id = "rank"><img src="img/${kor.rank}.png"></td>		<td id = "title"><a href = "">${kor.title}</a></td></tr>
		</c:forEach>
	</tbody>
	<tbody id = "boxoffice_usa"  style="display:none">
		<c:forEach items="${requestScope.bUsa}" var="usa">
			<tr><td id = "rank"><img src="img/${usa.rank}.png"></td>		<td id = "title"><a href = "">${usa.title}</a></td></tr>
		</c:forEach>
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
