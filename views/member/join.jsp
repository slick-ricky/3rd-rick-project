<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<style>
.tt {
	line-height: 100px;
}

.join_ctn {
	padding-top: 40px;
	border: 1px solid lightgray;
	width: 700px;
	height: 620px;
	margin-bottom: 40px;
}

.join_ctn dl {
	border: 0px solid black;
	display: table;
	padding-bottom: 15px;
	width: 570px;
	height: 50px;
}

.join_ctn dt {
	border: 0px solid black;
	padding-top: 12px;
	float: left;
	width: 120px;
	height: 50px;
	text-align: left;
    margin-inline-start: 20px;
}

.join_ctn dd {
	float: left;
    margin-inline-start: 50px;
}

input {
	width: 250px;
	height: 50px;
	border: 1px solid lightgray;
	font-size: 14px;
	padding: 10px;
}

input:focus {
	border: 1px solid #3168db;
	box-shadow: 0px 0px 8px #003ea8;
	outline:none;
}

.join_btn {
	width: 500px; 
	height: 70px; 
	background-color: #007042; 
	border: 0px;
	font-size: 25px;
	font-weight: bold;
	color: white;
	margin-top: 15px;
}

.line {
	width: 500px;
	border-top: 1px solid lightgray;
	margin-top: 15px;
	margin-bottom: 40px;
}

p {
	display: block;
	margin-block-start: 0px;
	margin-block-end: 20px;
	margin-inline-start: 9em;
	font-size: 13px;
	color: gray;
}

label {
	font-weight: bold;
	color: gray;
}

.idr {
	margin-left: -20px;
}
</style>

<script>
function id_select(id){
	$.ajax({
		url: "idok",
		type: "post",
		data: {"id":id},
		dataType: "text",
		success:function(text){
			$("#id_result").html(text);
		},
		error:function(){
		}
	});
}

function ok(){
	if(id.value == ""){
		alert("아이디를 입력하세요.");
		id.focus();
		return false;
	}
	
	if(pw.value == ""){
		alert("비밀번호를 입력하세요.");
		pw.focus();
		return false;
	}
	
	if(pw.value == ""){
		alert("비밀번호를 입력하세요.");
		pw.focus();
		return false;
	}
	
	if(pw1.value == ""){
		alert("비밀번호 확인을 하세요.");
		pw1.focus();
		return false;
	}
	
	if(names.value == ""){
		alert("이름을 입력하세요.");
		names.focus();
		return false;
	}
	
	if(email.value == ""){
		alert("이메일을 입력하세요.");
		email.focus();
		return false;
	}
	
	if(tel.value == ""){
		alert("휴대폰 번호를 입력하세요.");
		tel.focus();
		return false;
	}
}

</script>

<center>
<h2 class="tt">회원정보입력</h2>

<form name="join" method="post" onsubmit="return ok()">
<div class="join_ctn">
	<dl>
		<dt>
			<label>아이디</label>
		</dt>
		<dd>
			<input type="text" name="id" id="id" value="" placeholder="아이디를 입력하세요.">
		</dd>
		<dd>
			<span onclick="id_select(join.id.value)" style="cursor:pointer">[중복확인]</span>
		</dd>
	</dl>
	<p class="idr" id="id_result">${msg }</p>
	<dl>
		<dt>
			<label>비밀번호</label>
		</dt>
		<dd>
			<input type="password" name="pw" id="pw" value="" placeholder="비밀번호를 입력하세요.">
		</dd>
	</dl>
	<p><font color="#007042">숫자, 문자 조합하여 6~10자 이상으로 입력해주세요.</font></p>
	<dl>
		<dt>
			<label>비밀번호 확인</label>
		</dt>
		<dd>
			<input type="password" name="pw1" id="pw1" value="" placeholder="비밀번호 확인을 하세요.">
		</dd>
	</dl>
	<dl>
		<dt>
			<label>이름</label>
		</dt>
		<dd>
			<input type="text" name="names" id="names" value="" placeholder="이름을 입력하세요.">
		</dd>
	</dl>
	<dl>
		<dt>
			<label>이메일</label>
		</dt>
		<dd>
			<input type="text" name="email" id="email" value="" placeholder="이메일을 입력 하세요.">
		</dd>
	</dl>
	<dl>
		<dt>
			<label>휴대폰</label>
		</dt>
		<dd>
			<input name="tel" id="tel" value="" placeholder="번호만 입력하세요">
		</dd>
	</dl>
	<button class="join_btn">가입하기</button>
</div>
</form>
</center>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>