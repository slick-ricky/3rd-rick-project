<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<style>
.tt {
	margin: auto;
	padding-top: 30px;
	padding-bottom: 30px;
	width: 900px;
	font-size: 27px;
}

.create_ctn {
	margin: auto;
	width: 900px;
	height: 550px;
	border: 0px solid lightgray;
}

input {
	margin-left: 20px;
	width: 800px;
	height: 40px;
	font-size: 15px;
	border: 1px solid #dddddd;
	padding: 10px;
}

input:focus {
	border: 1px solid #3168db;
	box-shadow: 0px 0px 8px #003ea8;
	outline:none;
}

textarea {
	width: 900px;
	height: 200px;
	font-size: 16px;
	color: gray;
	border: 1px solid #dddddd;
	padding: 10px;
}

textarea:focus {
	border: 1px solid #3168db;
	box-shadow: 0px 0px 8px #003ea8;
	outline:none;
}

.slt {
	height: 40px;
	font-size: 15px;
	border: 1px solid #dddddd;
	color: #757575;
}

.slt:focus {
	border: 1px solid #3168db;
	box-shadow: 0px 0px 8px #003ea8;
	outline:none;
}

.subj {
	border-top: 0px solid #333333;
	border-bottom: 0px solid #333333;
	height: 70px;
	padding-top: 10px;
	display: flex;
	
}

.ctt {
	border-bottom: 0px solid lightgray;
	padding-top: 20px;
	padding-bottom: 20px;
	
}

.list_btn {
	float: right;
	margin-top: 20px;
	margin-bottom: 50px;
	background-color: #666666;
	color: white;
	width: 70px;
	height: 35px;
	font-size: 16px;
	font-weight: bold;
	border-radius: 5px;
	cursor: pointer;
}

.updown1 {
	display: flex;
	width: 1140px;
	height: 50px;
	border-top: 1px solid black;
	border-bottom: 1px solid #dddddd;
}

.updown2 {
	display: flex;
	width: 1140px;
	height: 50px;
	border-bottom: 1px solid black;
}

.updown_box1 {
	width: 200px;
	background-color: #f4f4f2;
}

.create_btn {
	margin-left: 45%;
	margin-top: 20px;
	background-color: #666666;
	color: white;
	width: 90px;
	height: 35px;
	font-size: 16px;
	font-weight: bold;
	border-radius: 5px;
	cursor: pointer;
}
</style>

<h1 class="tt">수정하기</h1>

<div class="create_ctn">
	<form method="post" enctype="multipart/form-data">
	<input type="hidden" name="uid" value="${view.uid}">
	<input type="hidden" name="page" value="${param.page}">
	<div class="subj">
		<select name="gongji" class="slt">
				<option value="">===선택===</option>
				<option value="1" <c:if test="${view.gongji eq '1'}">selected</c:if>>공지<option>
				<option value="2" <c:if test="${view.gongji eq '2'}">selected</c:if>>일반</option>
				<option value="3" <c:if test="${view.gongji eq '3'}">selected</c:if>>비밀</option>
		</select>
		<input name="subject" placeholder="제목을 입력하세요." value="${view.subject }">
	</div>
	<div class="ctt">
		<textarea name="content" placeholder="내용을 입력하세요.">${view.content }</textarea>
	</div>
	<div><button class="create_btn">수정하기</button></div>
	</form>
</div>


<br><br><br>




<%@ include file="/WEB-INF/views/include/footer.jsp" %>