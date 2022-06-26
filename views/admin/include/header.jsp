<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%String it_category = request.getParameter("it_category"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	background-color: #007a48;
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
	padding-left: 15px;
}

.img_name {
	margin-inline-start: 30px;
	width: 300px;
	letter-spacing :0.7px;
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
	width: 800px;
	height: 50px;
	margin-left: 7%;
}

.hello {
	margin-top: 20px;
	margin-right: 30px;
	color: white;
	font-weight: bold;
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

.d-btn > b {
	color: white;
}

li {
	list-style: none;
}

a {
	text-decoration: none;
	color: #000;
}

h1 {
	text-align:center;
	padding: 10px 0;
}

#gnb {
	width: 775px;
	margin: 0 auto;
	margin-left: 12%;
	margin-top: 7px;

}

#gnb:after {
	content: "";
	display: block;
	clear: both;
}

#gnb .m {
	float: left;
	width: 140px;           
	text-align: center;
	position: relative;            
} 

#gnb .m > a {
	display: block;
	height: 40px;            
	line-height: 40px;
	font-size: 17px;
	font-weight: bold;
	color: white;
}        

#gnb .m.on > a {
	border-bottom: 4px solid white;
	box-sizing: border-box;

}     

#gnb .m ul {
	position: absolute;
	left: 0;
	top: 40px;            
	width: 100%;
	background: #2c2a29;
	display: none;
}        

#gnb .m ul li a {
	display: block;
	color: white;
	padding: 12px 0;
	font-size: 14px;
	font-weight: bold;
}

#gnb .m ul li:last-child a{
	border: none;
}
#gnb .m ul li a:hover,
#gnb .m ul li a:active,
#gnb .m ul li a:focus {            
	background: gray;
	color: white;
}

#visual {
	background: url(f1.jpg) no-repeat center center;             
	height: 300px;
}

#visual a{
	display: block;
	width: 1000px;
	height: 300px;
	margin: 0 auto;
	text-indent: -99999%;
	overflow: hidden;
}

</style>


<!-- 
id : ${sessionScope.id} /
name : ${sessionScope.names} / 
level : ${sessionScope.level} /
 -->
 
<div class="header_bg">
	<div class="header">
		<div>
			<div class="img"><a href="/admin/index"><img src="/img/setting.png" width="95px" height="95px"></a></div>
			<div class="img_name"><a href="/admin/index"><font color="white" size="4px"><b>ADMIN ONLY</b></font></a></div>
		</div>
		<div class="container1"></div>
		<div class="container2">
			<div class="box1">
				<c:choose>
					<c:when test="${sessionScope.id ne null}">
						<a href="/member/logout" style="color:white; margin-right:30px;">Sign Out</a>
						<a href="/" style="color:white; margin-right:30px;">User Page</a>
						<div class="hello">${sessionScope.names }님, 오늘도 행복하세요!<br></div>
					</c:when>
					<c:otherwise>
						<a href="/member/login" style="color:white; margin-right:40px;">Sign In</a>
					</c:otherwise>
				</c:choose>
			</div>

			<ul id="gnb">
				<li class="m"><a href="/admin/index">HOME</a></li>
				<li class="m"><a href="/admin/member/list">MEMBER</a></li>
				<li class="m"><a href="#">ITEM</a>
					<ul>
						<li><a href="/admin/item/item_rgt">상품등록</a></li>
						<li><a href="/admin/item/item_list">상품목록</a></li>
						<li><a href="/admin/item/item_review/">상품리뷰</a></li>
					</ul>
				</li>
				<li class="m"><a href="/admin/order/od_mng">ORDER</a></li>
				<li class="m"><a href="/admin/board/board_list">BOARD</a></li>
			</ul>
			
		</div>
	</div>
</div>


<script>
	$(document).ready(function() {
		$("#gnb .m").on("mouseenter focusin", function() {
			$("ul", this).show();
			$(this).siblings("li").find("ul").hide();
			$(this).addClass("on").siblings("li").removeClass("on");                
		}).on("mouseleave", function() {
			$("#gnb ul").hide().add("#gnb .m").removeClass("on");                
		});

		$("*:not('#gnb a')").on("focus", function() {
			$("#gnb ul").hide().add("#gnb .m").removeClass("on");
		});
	});
</script>


<input type="hidden" value="${sessionScope.id}" id="s_id">
