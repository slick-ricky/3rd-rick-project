<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%String it_category = request.getParameter("it_category"); %>
<%String code = request.getParameter("code"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coffee Kingdom</title>
<link rel="stylesheet" href="/css/header.css">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
</head>
<body>

<style>
html, body {
	margin: 0;
	padding: 0;
}

.header_bg {
	background-color: #f6f5ef;
}

.header {
	margin: auto;
	width: 1195px;	
	border: 0px solid black;
	height: 150px;
	color: #555555;
	display: flex;
}

.img {
	border: 0px solid black;
	margin-block-start: 13px;
	margin-inline-start: 30px;
}

.container1 {
	border: 0px solid black;
	width: 300px;
	height: 150px;
}

.box1 {
	padding-top: 15px;
	padding-right: 20px;
	text-align: right;
	border: 0px solid black;
	width: 815px;
	height: 100px;
	font-size: 13px;
}

.box2 {
	border: 0px solid black;
	width: 815px;
	height: 50px;
}

.hello {
	margin-top: 11px;
	margin-right: 30px;
	color: #007042;
	font-weight: bold;
	border: 0px solid black;
	height: 47px;
	line-height: 25px;
}

.img_name {
	margin-inline-start: 30px;
	width: 300px;
	letter-spacing :0.7px;
}

.crtcnt {
	background-color: #007042;
	width: 18px;
	color: white;
	border-radius: 50%; 
	display: inline-block;
	text-align: center;
	padding-bottom: 1px;
}

.column > h4 {
	color:#c8ffe9;
}
</style>

<!-- 
id : ${sessionScope.id} /
name : ${sessionScope.names} / 
level : ${sessionScope.level} /
level : ${sessionScope.point} /
 -->
 
<div class="header_bg">
	<div class="header">
		<div>
			<div class="img"><a href="/"><img src="/img/logo5.png" width="170"></a></div>
			<div class="img_name"><a href="/"><font color="#007a48" size="4px"><b>COFFEE KINGDOM</b></font></a></div>
		</div>
		<div class="container1"></div>
		<div class="container2">
			<div class="box1">
				<c:if test="${sessionScope.level eq '10'}">
					<span style="margin-right: 37px; color:#007a48; font-weight:bold;"><a href="/admin/index"><font color="#007a48">Admin</font></a></span>
				</c:if>
				<c:choose>
					<c:when test="${sessionScope.id != null }">
						<a href="/item/cart" style="color:#555555; margin-right:30px;">
							<img src="/img/cart3.png" width="12px" style="margin-right:3px;">Cart
							<div class="crtcnt"></div>
						</a>
						<a href="/member/logout" style="color:#555555; margin-right:30px;">Sign Out</a>
						<a href="/member/joinup" style="color:#555555; margin-right:30px;">My Page</a>
					</c:when>
					<c:otherwise>
						<a href="/member/login" style="color:#555555; margin-right:30px;">Sign In</a>
						<a href="/member/join" style="color:#555555; margin-right:30px;">Join Us</a>
					</c:otherwise>
				</c:choose>
				<c:if test="${sessionScope.id ne null }">
					<div class="hello">
						${sessionScope.names }님, 오늘도 행복하세요!<br>
						<span style="margin-top:10px; color:white; font-size:13px; background:#007042; border-radius:3px; display:inline-block; width:50px; text-align:center; padding:-15px;">Point</span> : <span class="mempoint"></span>
						
					</div>
				</c:if>
			</div>

			<div class="box2">
				<nav class="navbar">
					<a href="/" style="width:150px;"><b>Home</b></a>
					<div class="d">
						<button class="d-btn" style="width:207px;"><b>COFFEE KINGDOM</b></button>
						<div class="d-content">
							<div class="row">
								<div class="space"></div>
								<div class="column">
									<h4><커피킹덤 소개></h4>
									<a href="">커피킹덤 사명</a>
									<a href="">매장 둘러보기</a>
								</div>
								<div class="column">
									<h4><게시판></h4>
									<a href="/board/list?code=board">공지사항</a>
									<a href="/board/list?code=free">자유게시판</a>
									<a href="/board/list?code=qna">문의사항</a>
								</div>
								<div class="column">
									<h4><오시는 길></h4>
									<a href="">약도</a>
								</div>
								<div class="space"></div>
							</div>
						</div>
					</div>
					<div class="d">
						<button class="d-btn" style="width:110px;"><b>MENU</b></button>
						<div class="d-content">
							<div class="row">
								<div class="space"></div>
								<div class="column">
									<h4><음료></h4>
									<a href="/item/list?it_category=1">커피</a>
									<a href="/item/list?it_category=2">티</a>
									<a href="/item/list?it_category=3">기타 음료</a>
								</div>
								<div class="column">
									<h4><푸드></h4>
									<a href="/item/list?it_category=4">브래드</a>
									<a href="/item/list?it_category=5">케이크</a>
								</div>
								<div class="column">
									<h4><상품></h4>
									<a href="/item/list?it_category=6">커피용품</a>
								</div>
								<div class="space"></div>
							</div>
						</div>
					</div>
					<div class="d">
						<button class="d-btn" style="width:160px;"><b>Rewards</b></button>
						<div class="d-content">
							<div class="row">
								<div class="space"></div>
								<div class="column">
									<h4><커피킹덤 리워드></h4>
									<a href="">커피킹덤 리워드 소개</a>
									<a href="">등급 및 혜택</a>
								</div>
								<div class="column">
									<h4><커피킹덤 카드></h4>
									<a href="">커피킹덤 카드 소개</a>
									<a href="">카드 등록</a>

								</div>
								<div class="column">
									<h4><커피킹덤 쿠폰></h4>
									<a href="">커피킹덤 쿠폰 소개</a>
									<a href="">쿠폰 사용법</a>
								</div>
								<div class="space"></div>
							</div>
						</div>
					</div>
					<a href="" style="width:170px;"><b>WHAT'S NEW</b></a>
				</nav>
			</div>
		</div>
	</div>
</div>


<input type="hidden" value="${sessionScope.id}" id="s_id">

<script>
<!--카트 추가시 숫자 업로드-->
	$(document).ready(function(){
		if(${!empty sessionScope.id}){
			$(document).ready(function(){
				setInterval(function(){
					$.ajax({
						url: "/item/cartCount",
						type: "POST",
						data: {
							id:$("#s_id").val()
						},
						success: function(cart_count){
//			 				alert("s");
							$(".crtcnt").text(cart_count)
						}
					});
				},1000);
			});
		}
	});

 	<!-- 실시간 포인트 정산-->
 	 	$(document).ready(function(){
 	 		if(${!empty sessionScope.id}){
 	 			$(document).ready(function(){
 	 				setInterval(function(){
 	 					$.ajax({
 	 						url: "/item/reloadPoint",
 	 						type: "POST",
 	 						data: {
 	 							id:$("#s_id").val()
 	 						},
 	 						success: function(mem_point){
 	//			 				alert("s");
 	 							$(".mempoint").text(mem_point)
 	 						}
 	 					});
 	 				},1000);
 	 			});
 	 		}
 	 	});
 	 	
</script>