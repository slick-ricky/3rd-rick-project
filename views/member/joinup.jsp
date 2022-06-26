<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="/WEB-INF/views/include/nav_header.jsp" %>

<style>
.tt_2 {
	line-height: 50px;
	margin: auto;
	font-size: 24px;
	margin-top: -20px;
}

.join_ctn {
	padding-top: 40px;
	border: 0px solid lightgray;
	width: 750px;
	height: 500px;
	margin-bottom: 40px;
}

.join_ctn dl {
	border: 0px solid black;
	display: table;
	padding-bottom: 15px;
	width: 550px;
	height: 30px;
}

.join_ctn dt {
	border: 0px solid black;
	padding-top: 12px;
	float: left;
	width: 100px;
	height: 30px;
	text-align: left;
    margin-inline-start: 20px;
}

.join_ctn dd {
	float: left;
    margin-inline-start: 50px;
}

input {
	width: 250px;
	height: 30px;
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
	width: 250px; 
	height: 40px; 
	background-color: #007042; 
	border: 0px;
	font-size: 18px;
	font-weight: bold;
	color: white;
	margin-top: 15px;
	margin-inline-start: 40px;
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
	margin-inline-start: 3em;
	font-size: 10px;
	color: gray;
}

label {
	font-weight: bold;
	color: gray;
	font-size: 15px;
}

.idr {
	margin-left: -100px;
}
</style>

<script>
function id_select(id){
	$.ajax({
		url: "idok",
		type: "post",
		data: {"id":id},
		dataType: "text",
		success:function(text){//성공
			$("#id_result").html(text);
		},
		error:function(){//ajax 구문 실패
		}
	});
}
</script>

<center>
<h2 class="tt_2">회원정보수정</h2>

<form name="join" method="post">
<div class="join_ctn">
	<dl>
		<dt>
			<label>아이디</label>
		</dt>
		<dd>
			<input type="text" name="id" id="id" value="${member.id }" placeholder="&nbsp; 아이디 입력" readonly>
		</dd>
	</dl>
	<dl>
		<dt>
			<label>비밀번호</label>
		</dt>
		<dd>
			<input type="password" name="pw" id="pw" value="${member.pw }" placeholder="&nbsp; 비밀번호 입력">
		</dd>
	</dl>
	<p><font color="#007042">숫자, 문자 조합하여 6~10자 이상으로 입력해주세요.</font></p>
	<dl>
		<dt>
			<label>비밀번호 확인</label>
		</dt>
		<dd>
			<input type="password" name="pw1" id="pw1" value="${member.pw }" placeholder="&nbsp; 비밀번호 확인">
		</dd>
	</dl>
	<dl>
		<dt>
			<label>이름</label>
		</dt>
		<dd>
			<input type="text" name="names" id="names" value="${member.names }">
		</dd>
	</dl>
	<dl>
		<dt>
			<label>이메일</label>
		</dt>
		<dd>
			<input type="text" name="email" id="email" value="${member.email }">
		</dd>
	</dl>
	<dl>
		<dt>
			<label>휴대폰</label>
		</dt>
		<dd>
			<input name="tel" id="tel" value="${member.tel }" placeholder="&nbsp; 번호만 입력">
		</dd>
	</dl>
	<button class="join_btn">수정하기</button>
</div>
</form>
</center>

<%@ include file="/WEB-INF/views/include/nav_footer.jsp" %>