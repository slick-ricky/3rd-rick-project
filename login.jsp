<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp" %>


<script>
var msg = "${msg}";

if(msg != ""){
	alert(msg);
}
</script>

<style>
.join_tt {
	line-height: 100px;
	color: white;
}

.join_ctn {
	padding-top: 30px;
	border: 1px solid lightgray;
	width: 600px;
	height: 520px;
	margin-bottom: 40px;
	background-color: white;
}

.join_ctn dl {
	display: table;
	padding-bottom: 10px;
	line-height: 40px;
}

.join_ctn dt {
	padding-top: 15px;
	float: left;

    margin-inline-start: 0px;
}

.join_ctn dd {
	float: left;
}

input {
	width: 500px;
	height: 50px;
	border: 1px solid lightgray;
	font-size: 14px;
	font-weight: bold;
	color: #757575;
	padding: 10px;
}

input:focus {
	border: 1px solid #3168db;
	box-shadow: 0px 0px 8px #003ea8;
	outline:none;
}

.login_btn {
	width: 500px; 
	height: 70px; 
	background-color: #007042; 
	border: 0px;
	font-size: 25px;
	font-weight: bold;
	color: white;
}

.line {
	width: 500px;
	border-top: 1px solid lightgray;
	margin-top: 15px;
	margin-bottom: 20px;
}

.line2 {
	padding-top: 25px;
	height: 20px;
	border-right: 1px solid lightgray;
}

p {
	display: block;
	margin-block-start: 0px;
	margin-block-end: 20px;
	font-size: 19px;
	color: gray;
	font-weight: bold;
}

label {
	font-weight: bold;
	color: gray;
}

.search_box {
	padding-top: 10px;
	display: flex;
	margin: auto;
	justify-content: space-evenly;
}

.search {
	font-size: 18px;
	font-weight: bold;
	color: #003ea8;
}

.p2 {
	font-size: 14px; 
	text-align: left; 
	font-weight: normal; 
	margin-top: 20px;
	margin-inline-start: 20px;
	margin-inline-end: 20px;
	color: #007042;
	line-height: 20px;
}

.bg {
	display: block;
	height: 700px;
	background-image: url("/img/login_bg2.png");
	background-repeat : no-repeat;
    background-size : 100% 100%;
    min-height: 100%;
  	max-width: 100%;
  	margin-bottom: -50px;
}


</style>

<center>
<div class="bg">
	<h2 class="join_tt">로그인</h2>
	
	<div class="join_ctn">
		<p><font color="#007042">Welcome!</font> 커피킹덤에 오신 것을 환영합니다.</p>
		<form method="post">
		<div class="line"></div>
		<dl>
			<dd>
				<input type="text" name="id" id="id" value="" placeholder="아이디를 입력해주세요.">
			</dd>
		</dl>
		<dl>
			<dd>
				<input type="password" name="pw" id="pw" value="" placeholder="비밀번호를 입력해주세요.">
			</dd>
		</dl>
		<div class="line"></div>
		<button class="login_btn">로그인</button>
		</form>
		<p class="p2">
			* 타 사이트와 비밀번호를 동일하게 사용할 경우 도용의 위험이 있으므로, 정기적인 비밀번호 변경을 해주시길 바랍니다.<br>
		    * 커피킹덤의 공식 홈페이지는 Internet Explorer 9.0 이상, Chrome, Firefox, Safari 브라우저에 최적화 되어있습니다.
		</p>
		<div class="search_box">
			<div class="search"><a href="/member/join" style="color:gray">회원가입</a></div>
			<div class="line2"></div>
			<div class="search"><a href="/member/id_search" style="color:gray">아이디 찾기</a></div>
			<div class="line2"></div>
			<div class="search"><a href="/member/pw_search" style="color:gray">비밀번호 찾기</a></div>
		</div>
	</div>
</div>
</center>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>