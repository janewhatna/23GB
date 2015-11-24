<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

<form action = "/gb23/detail_search2" method="post" >
장르 : <input type="text" name="genre"><br><br>
감독 : <input type="text" name="director"><br><br>
배우 : <input type="text" name="actors"><br><br>

<input type="submit" value="상세검색">

	
</form>
</body>
</html>