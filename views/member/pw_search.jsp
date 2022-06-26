<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<style>
.tt {
	line-height: 100px;
}

.id_sch_title {
	margin: auto;
	width:500px;
	justify-content: center;
}

.id_sch_box {
	margin: auto;
	width: 600px;
	height: 600px;
	line-height: 50px;
	border: 1px solid black;
}

.id_sch_input {
	margin: auto;
	width:500px;
	justify-content: center;
}

.id_sch_btn {
	margin: auto;
	width:500px;
	justify-content: center;
}

li{
   list-style: none;
   padding-left: 0px;
}

input {
	width: 500px;
	height: 50px;
	margin-bottom: 15px;
	padding-left: 10px;
}

input:focus {
	border: 1px solid #3168db;
	box-shadow: 0px 0px 8px #003ea8;
	outline:none;
}

.log_btn {
	width: 500px; 
	height: 50px; 
	background-color: #007042; 
	border: 0px;
	font-size: 17px;
	color: white;
	cursor: pointer;
	display: table-cell;
	text-align: center;
	vertical-align: middle;
}

.img2 {
	margin-top: 30px;
	width: 100%;
	display: inline-block;
	text-align: center;
	
}

p {
	font-weight: bold;
	display: block;
	text-align: center;
	margin-bottom: 20px;
}

.space {
	height: 50px;
}
</style>

<script>
function pw_search(){
	var id1 = id.value;
	var tel2 = tel.value;
	var email2 = email.value;
	window.open("pw_result?id="+id1+"&tel="+tel2+"&email="+email2, "a", "width=400, height=300");
}
</script>

<center>
<h1 class="tt">비밀번호 찾기</h2>
</center>
<form method="post">
<div class="id_sch_box">
	<div class="img2"><img src="/img/br1.png" width="200px;"></div>
	<p><font size="5px">비밀번호가 기억나지 않으세요?</font><br>아래 인증 방법을 통해 비밀번호를 확인 하실 수 있습니다.</p>
	<div class="id_sch_input">
		<li><input name="id" id="id" placeholder="아이디를 입력해주세요."></li>
		<li><input name="tel" id="tel" placeholder="연락처를 입력해주세요."></li>
		<li><input name="email" id="email" placeholder="이메일주소를 입력해주세요."></li>
	</div>
	<div class="id_sch_btn"><span onclick="pw_search()" class="log_btn">확인</span></div>
</div>
</form>
<div class="space"></div>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>