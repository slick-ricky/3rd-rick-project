<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
.id_result {
	margin: auto;
	display: flex;
	justify-content: center;
	align-items: center;
	font-weight: bold;
}

span {
	margin: auto;
	display: table-cell;
	width: 50px;
	height: 30px;
	text-align: center;
	vertical-align: middle;
}

.cfm {
	margin: auto;
	width: 50px;
	background-color: #007042;
	color: white;
	font-size: 13px;
	cursor: pointer;
}

.emt {
	margin-top: 100px;
}
</style>

<script>
function id_sch_ok(){
	opener.location.href="/member/login";
	window.close();
}

function id_sch_ok2(){
	opener.location.href="/member/id_search";
	window.close();
}
</script>

<div class="emt"></div>

<c:choose>
	<c:when test="${member.id eq null}">
		<div class="id_result">
			회원님의 아이디를 찾을 수 없습니다.
		</div><br>
		<div class="cfm">
			<span onclick="id_sch_ok2()" >확인</span>
		</div>
	</c:when>
	<c:otherwise>
		<div class="id_result">
			회원님의 아이디는 <font color="#9475cc">"${member.id}"</font>입니다.
		</div><br>
		<div class="cfm">
			<span onclick="id_sch_ok()" >확인</span>
		</div>
	</c:otherwise>
</c:choose>



