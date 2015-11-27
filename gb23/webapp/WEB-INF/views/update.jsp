<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="com.gb23.gb23.vo.MemberVO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
 <script >
	$(function() {
		$("#good").click(function() {
			var passwd = $("input[name='passwd']").val();
			var pqid = $("input[name='pqid']").val();
			var passwdans = $("input[name='passwdans']").val();
			var preferGID1 = $("input[name='preferGID1']").val();
			var preferGID2 = $("input[name='preferGID2']").val();
			var preferGID3  = $("input[name='preferGID3 ']").val();
			
			$.ajax({
				url : "/gb23/update", //url
				data : "passwd=" + passwd + "&pqid =" +pqid +"&passwdans=" + passwdans + "&preferGID1 =" +preferGID1+"&preferGID2=" + preferGID2 + "&preferGID3 =" +preferGID3, //넘겨야 할 데이터  
				type : "get",
				dataType : "json",
				success : function(response) { //성고했을 때!
					alert("회원정보 수정 시, 다시 로그인 하셔야 합니다. ");
				
					window.location.href = "/gb23/main";
				},
				error : function(jqXHR, status, e) { //실패
					console.error(status + " : " + e);
				}
			});
		});
	});

</script>
</head>
<body>

	<!-- -----------------------모달 타이틀---------------------- -->
	<div class="modal-header">

		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		
	</div>
	<!-- ---------------------모달내용--------------------- -->
	<div class="modal-body">

<%
	MemberVO vo = (MemberVO)session.getAttribute("loginInfo"); 

	if(vo == null){
%>
	접근할 수 없음
<%

	}else{

%>
<form>
<!-- <form method="post" action="/gb23/update"> -->
<input type="hidden" name="command" value="update"> -->
아이디 : <input type="text" name="userid" readonly="readonly" value="<%=vo.getUserid() %>"><br>
<%-- 이름 : <input type="text" name="name" value="<%=vo.getUname() %>"><br> --%>
비밀번호 : <input type="text" name="passwd" value="<%=vo.getPasswd() %>"><br>
비밀번호힌트 : <select id="selectBox" name="pqid">
			<option selected>비밀번호 힌트</option>
			<option value="1" <%if(vo.getPqid() == 1){%>selected<%}%>>2015년 애인의 유무?</option>
			<option value="2" <%if(vo.getPqid() == 2){%>selected<%}%>>가장 기억에 남는 별명?</option>
			<option value="3" <%if(vo.getPqid() == 3){%>selected<%}%>>가장 친한 친구의 이름?</option>
			<option value="4" <%if(vo.getPqid() == 4){%>selected<%}%>>엄마가 자주 하지만 그만했으면 하는 음식?</option>
			<option value="5" <%if(vo.getPqid() == 5){%>selected<%}%>>엄마의 잔소리 베스트 1위?</option>
			<option value="6" <%if(vo.getPqid() == 6){%>selected<%}%>>좋아하는 영화 제목 또는 감독?</option>
			<option value="7" <%if(vo.getPqid() == 7){%>selected<%}%>>싫어하는 영화 제목 또는 감독</option>
			</select><br>
비밀번호답변 <input type="text" name="passwdans" value="<%=vo.getPasswdans() %>"><br/> 
			<br>
			<hr>
			<h2>좋아하는 장르 선택</h2>
			<hr>
			<h5>1순위 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2순위&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3순위</h5>
			<select name="preferGID1">
				<option value="">장르</option>
				
				<option value="1" <%if ("1".equals((vo.getPreferGID1()))){%>selected<%}%>>드라마</option>
				<option value="2" <%if ("2".equals((vo.getPrefergid1()))){%>selected<%}%>>판타지 </option>
				<option value="3" <%if ("3".equals((vo.getPrefergid1()))){%>selected<%}%>>서부</option>
				<option value="4" <%if ("4".equals((vo.getPrefergid1()))){%>selected<%}%>>공포</option>
				<option value="5" <%if ("5".equals((vo.getPrefergid1()))){%>selected<%}%>>로맨스</option>
				<option value="6" <%if ("6".equals((vo.getPrefergid1()))){%>selected<%}%>>모험</option>
				<option value="7" <%if ("7".equals((vo.getPrefergid1()))){%>selected<%}%>>스릴러</option>
				<option value="8" <%if ("8".equals((vo.getPrefergid1()))){%>selected<%}%>>느와르</option>
				<option value="9" <%if ("9".equals((vo.getPrefergid1()))){%>selected<%}%>>컬트</option>
				<option value="10" <%if ("10".equals((vo.getPrefergid1()))){%>selected<%}%>>다큐멘터리</option>
				<option value="11" <%if ("11".equals((vo.getPrefergid1()))){%>selected<%}%>>코미디</option>
				<option value="12" <%if ("12".equals((vo.getPrefergid1()))){%>selected<%}%>>가족</option>
				<option value="13" <%if ("13".equals((vo.getPrefergid1()))){%>selected<%}%>>미스터리</option>
				<option value="14" <%if ("14".equals((vo.getPrefergid1()))){%>selected<%}%>>전쟁</option>
				<option value="15" <%if ("15".equals((vo.getPrefergid1()))){%>selected<%}%>>애니메이션</option>
				<option value="16" <%if ("16".equals((vo.getPrefergid1()))){%>selected<%}%>>범죄</option>
				<option value="17" <%if ("17".equals((vo.getPrefergid1()))){%>selected<%}%>>뮤지컬</option>
				<option value="18" <%if ("18".equals((vo.getPrefergid1()))){%>selected<%}%>>SF</option>
				<option value="19" <%if ("19".equals((vo.getPrefergid1()))){%>selected<%}%>>액션</option>
				<option value="20" <%if ("20".equals((vo.getPrefergid1()))){%>selected<%}%>>무협</option>
				<option value="21" <%if ("21".equals((vo.getPrefergid1()))){%>selected<%}%>>에로</option>
				<option value="22" <%if ("22".equals((vo.getPrefergid1()))){%>selected<%}%>>서스펜스</option>
				<option value="23" <%if ("23".equals((vo.getPrefergid1()))){%>selected<%}%>>서사</option>
				<option value="24" <%if ("24".equals((vo.getPrefergid1()))){%>selected<%}%>>블랙코미디</option>
				<option value="25" <%if ("25".equals((vo.getPrefergid1()))){%>selected<%}%>>실험</option>
				<option value="26" <%if ("26".equals((vo.getPrefergid1()))){%>selected<%}%>>영화카툰</option>
				<option value="27" <%if ("27".equals((vo.getPrefergid1()))){%>selected<%}%>>영화음악</option>
				<option value="28" <%if ("28".equals((vo.getPrefergid1()))){%>selected<%}%>>영화패러디포스터</option>
				<option value="29" <%if ("29".equals((vo.getPrefergid1()))){%>selected<%}%>>맬로</option>
			</select> 
			<select name="preferGID2">
				<option value="">장르</option>
				<option value="1" <%if ("1".equals((vo.getPreferGID2()))){%>selected<%}%>>드라마</option>
				<option value="2" <%if ("2".equals((vo.getPrefergid2()))){%>selected<%}%>>판타지 </option>
				<option value="3" <%if ("3".equals((vo.getPrefergid2()))){%>selected<%}%>>서부</option>
				<option value="4" <%if ("4".equals((vo.getPrefergid2()))){%>selected<%}%>>공포</option>
				<option value="5" <%if ("5".equals((vo.getPrefergid2()))){%>selected<%}%>>로맨스</option>
				<option value="6" <%if ("6".equals((vo.getPrefergid2()))){%>selected<%}%>>모험</option>
				<option value="7" <%if ("7".equals((vo.getPrefergid2()))){%>selected<%}%>>스릴러</option>
				<option value="8" <%if ("8".equals((vo.getPrefergid2()))){%>selected<%}%>>느와르</option>
				<option value="9" <%if ("9".equals((vo.getPrefergid2()))){%>selected<%}%>>컬트</option>
				<option value="10" <%if ("10".equals((vo.getPrefergid2()))){%>selected<%}%>>다큐멘터리</option>
				<option value="11" <%if ("11".equals((vo.getPrefergid2()))){%>selected<%}%>>코미디</option>
				<option value="12" <%if ("12".equals((vo.getPrefergid2()))){%>selected<%}%>>가족</option>
				<option value="13" <%if ("13".equals((vo.getPrefergid2()))){%>selected<%}%>>미스터리</option>
				<option value="14" <%if ("14".equals((vo.getPrefergid2()))){%>selected<%}%>>전쟁</option>
				<option value="15" <%if ("15".equals((vo.getPrefergid2()))){%>selected<%}%>>애니메이션</option>
				<option value="16" <%if ("16".equals((vo.getPrefergid2()))){%>selected<%}%>>범죄</option>
				<option value="17" <%if ("17".equals((vo.getPrefergid2()))){%>selected<%}%>>뮤지컬</option>
				<option value="18" <%if ("18".equals((vo.getPrefergid2()))){%>selected<%}%>>SF</option>
				<option value="19" <%if ("19".equals((vo.getPrefergid2()))){%>selected<%}%>>액션</option>
				<option value="20" <%if ("20".equals((vo.getPrefergid2()))){%>selected<%}%>>무협</option>
				<option value="21" <%if ("21".equals((vo.getPrefergid2()))){%>selected<%}%>>에로</option>
				<option value="22" <%if ("22".equals((vo.getPrefergid2()))){%>selected<%}%>>서스펜스</option>
				<option value="23" <%if ("23".equals((vo.getPrefergid2()))){%>selected<%}%>>서사</option>
				<option value="24" <%if ("24".equals((vo.getPrefergid2()))){%>selected<%}%>>블랙코미디</option>
				<option value="25" <%if ("25".equals((vo.getPrefergid2()))){%>selected<%}%>>실험</option>
				<option value="26" <%if ("26".equals((vo.getPrefergid2()))){%>selected<%}%>>영화카툰</option>
				<option value="27" <%if ("27".equals((vo.getPrefergid2()))){%>selected<%}%>>영화음악</option>
				<option value="28" <%if ("28".equals((vo.getPrefergid2()))){%>selected<%}%>>영화패러디포스터</option>
				<option value="29" <%if ("29".equals((vo.getPrefergid2()))){%>selected<%}%>>맬로</option>
			</select>
			<select name="preferGID3">
				<option value="">장르</option>
				<option value="1" <%if ("1".equals((vo.getPreferGID3()))){%>selected<%}%>>드라마</option>
				<option value="2" <%if ("2".equals((vo.getPrefergid3()))){%>selected<%}%>>판타지 </option>
				<option value="3" <%if ("3".equals((vo.getPrefergid3()))){%>selected<%}%>>서부</option>
				<option value="4" <%if ("4".equals((vo.getPrefergid3()))){%>selected<%}%>>공포</option>
				<option value="5" <%if ("5".equals((vo.getPrefergid3()))){%>selected<%}%>>로맨스</option>
				<option value="6" <%if ("6".equals((vo.getPrefergid3()))){%>selected<%}%>>모험</option>
				<option value="7" <%if ("7".equals((vo.getPrefergid3()))){%>selected<%}%>>스릴러</option>
				<option value="8" <%if ("8".equals((vo.getPrefergid3()))){%>selected<%}%>>느와르</option>
				<option value="9" <%if ("9".equals((vo.getPrefergid3()))){%>selected<%}%>>컬트</option>
				<option value="10" <%if ("10".equals((vo.getPrefergid3()))){%>selected<%}%>>다큐멘터리</option>
				<option value="11" <%if ("11".equals((vo.getPrefergid3()))){%>selected<%}%>>코미디</option>
				<option value="12" <%if ("12".equals((vo.getPrefergid3()))){%>selected<%}%>>가족</option>
				<option value="13" <%if ("13".equals((vo.getPrefergid3()))){%>selected<%}%>>미스터리</option>
				<option value="14" <%if ("14".equals((vo.getPrefergid3()))){%>selected<%}%>>전쟁</option>
				<option value="15" <%if ("15".equals((vo.getPrefergid3()))){%>selected<%}%>>애니메이션</option>
				<option value="16" <%if ("16".equals((vo.getPrefergid3()))){%>selected<%}%>>범죄</option>
				<option value="17" <%if ("17".equals((vo.getPrefergid3()))){%>selected<%}%>>뮤지컬</option>
				<option value="18" <%if ("18".equals((vo.getPrefergid3()))){%>selected<%}%>>SF</option>
				<option value="19" <%if ("19".equals((vo.getPrefergid3()))){%>selected<%}%>>액션</option>
				<option value="20" <%if ("20".equals((vo.getPrefergid3()))){%>selected<%}%>>무협</option>
				<option value="21" <%if ("21".equals((vo.getPrefergid3()))){%>selected<%}%>>에로</option>
				<option value="22" <%if ("22".equals((vo.getPrefergid3()))){%>selected<%}%>>서스펜스</option>
				<option value="23" <%if ("23".equals((vo.getPrefergid3()))){%>selected<%}%>>서사</option>
				<option value="24" <%if ("24".equals((vo.getPrefergid3()))){%>selected<%}%>>블랙코미디</option>
				<option value="25" <%if ("25".equals((vo.getPrefergid3()))){%>selected<%}%>>실험</option>
				<option value="26" <%if ("26".equals((vo.getPrefergid3()))){%>selected<%}%>>영화카툰</option>
				<option value="27" <%if ("27".equals((vo.getPrefergid3()))){%>selected<%}%>>영화음악</option>
				<option value="28" <%if ("28".equals((vo.getPrefergid3()))){%>selected<%}%>>영화패러디포스터</option>
				<option value="29" <%if ("29".equals((vo.getPrefergid3()))){%>selected<%}%>>맬로</option>
			</select>
			<br/>
<input type="button" id="good" value="확인">
</form>
<%
	}
%>

<!-- ---------------------모달 하단--------------------- -->
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	</div>

	<!-- 모달 	모달 	모달 	모달 	모달 	모달 	모달 	모달 	모달 	 -->
	<form>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myLargeModalLabel" aria-hidden="true"
			data-backdrop="false" style="background-color: rgba(0, 0, 0, 0.5);">
			<div class="modal-dialog">
				<div class="modal-content"></div>
			</div>
		</div>
	</form>
</body>
</html>