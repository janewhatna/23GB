<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.gb23.gb23.vo.MemberVO"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page import ="java.util.*"%>  
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>23GB</title>
<style type="text/css">		
</style>
<script>
	///////////////////평점 설정///////////////////
	$(function() { // jQuery를 시작하는 데... main()
		$("input[name='rating']").click(function() {
			var $input = $(this);
			var value = $input.val();
			
			var $parent = $input.parent( "div.btn-group" );
			var no = $parent.attr( "data-no" );
			
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
				}
			});
			
			$.ajax({
				url : "/gb23/rating_result", //url
				data : "n=" + no + "&r=" + value, //넘겨야 할 데이터  
				type : "get",
				dataType : "json",
				success : function(response) { //성고했을 때!
				},
				error : function(jqXHR, status, e) { //실패
					console.error(status + " : " + e);
				}
			});
		});
	});
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
</head>
<body>
<!-----------------------모달 타이틀----------------------->
	<div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">상세 페이지</h4>
    </div>
<!-----------------------모달 내용----------------------->
<%-- 
<%
	ArrayList<MemberVO> vo=(ArrayList<MemberVO>)session.getAttribute("loginInfo");
 %> --%>
    <div class="modal-body">
  
	<!-- 검색 결과 출력  --><!-- 검색 결과 출력  --><!-- 검색 결과 출력  --><!-- 검색 결과 출력  --><!-- 검색 결과 출력  --><!-- 검색 결과 출력  -->
		<c:forEach items="${requestScope.listM}" var="listM">
				<div style="text-align: left;">
					<h2>${listM.title}
						<!-- view단에 뜨는 제목 -->
						<!--  //////////////////////   버튼 	 //////////////////////	 -->
						<input type="button" id="Title" value="ost" name="${listM.title}" onclick="ost();"> 
					</h2>
				<input type="image" src=${listM.imgURL} width="100" height="100"> <!-- view단에 뜨는 이미지  -->
				</div>
		</c:forEach>
		장르: <c:forEach items="${requestScope.listM}" var="listM">${listM.genre}   </c:forEach> 
		| 상영시간:  <c:forEach items="${requestScope.listM}" var="listM">${listM.runningTime}   </c:forEach>
		| 국가: <c:forEach items="${requestScope.listN}" var="listN">${listN.nName}    </c:forEach><br/>
		감독: <c:forEach items="${requestScope.listD}" var="listD">${listD.dKname}.   </c:forEach><br/> 
		배우: <c:forEach items="${requestScope.listA}" var="listA">${listA.aKname}.   </c:forEach><br/> <!-- view단에 뜨는 배우 -->	
		전체평점:  <c:forEach items="${requestScope.listM}" var="listM">${listM.score}</c:forEach><br/>
		개봉일:  <c:forEach items="${requestScope.listM}" var="listM">${listM.releaseDate}</c:forEach> 
		
		<br/><br/>
		줄거리: <c:forEach items="${requestScope.listM}" var="listM">${listM.summary}</c:forEach><br />
	<!-- 하트  -->	<!-- 하트  -->	<!-- 하트  -->	<!-- 하트  -->	<!-- 하트  -->	<!-- 하트  -->	<!-- 하트  -->	<!-- 하트  -->	<!-- 하트  -->		
		<c:forEach items="${requestScope.listM}" var="listM">
				<div class="btn-group" data-no="${listM.movID}">
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
		</c:forEach> 
			 
	</div>
<!-----------------------모달 하단----------------------->
    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
    </div>
    
    
	<!-- 모달 	모달 	모달 	모달 	모달 	모달 	모달 	모달 	모달 	 -->
 <form>
 	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" data-backdrop="false" style="background-color: rgba(0, 0, 0, 0.5);">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    </div>
	  </div>
	</div>
</form> 
 
</body>
</html>
