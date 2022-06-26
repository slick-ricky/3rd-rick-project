<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<style>
.tt {
	margin-left: 21%;
	margin-block-start: 20px;
	margin-block-end: 20px;
	height: 30px;
	font-size: 27px;
	font-weight: bold;
}

ul {
 	list-style: none;
}

.my_ctn {
	margin: auto;
	margin-block-start: 50px;
	min-height: 550px;
	display: flex;
	justify-content: space-between;
	width: 1130px;
	border: 0px solid black;
}

.my_list {
	padding-left: 40px;
	padding-top: 20px;
	height: 500px;
	width: 200px;
	border: 1px solid lightgray;
	line-height: 35px;
	background-color: #f9f9f9;
	margin-top: 60px;
}

.my_title {
	font-size: 17px;
	font-weight: bold;
	color: #007a48;
}

.my_subt {
	font-size: 13px;
	color: #555555;
}

.my_ctn2 {
	margin-right: 150px;
	text-align: center;
	width: 800px;
	min-height: 660px;
	font-size: 25px;
	font-weight: bold;
	border: 0px solid black;
}

.subtitle {
	margin: auto;
	width: 700px;
	height: 50px;
	border: 0px solid black;
	color: #555555;
}

.my_info {
	padding-top: 100px;
	padding-left: -100px;
	width: 250px;
	height: 350px;
	border: 0px solid lightgray;
	font-size: 17px;
	line-height: 30px;
}

.my_order {
	padding-top: 100px;
	width: 550px;
	height: 350px;
	border: 0px solid black;
	font-size: 17px;
}

.pic {
	margin-left: 25%;
	margin-bottom: 10px;
	width: 120px;
	height: 120px;
	border: 1px solid black;
	border-radius: 50%;
}

.pic img {
	border-radius: 50%;
}

p {
	display: table-cell;
	vertical-align: middle;
}

.order_box {
	display: table;
	margin-left: 25px;
	border: 1px solid black;
	width: 300px;
	height: 200px;
	font-size: 14px;
	font-weight: normal;
}

a {
	color: #555555;
}

a:hover {
	font-weight: bold;
}

.wrapper {
	
	min-height: 0px;
}

.footer {
	position: absolute;
	margin-top: 100%;
}
</style>

<div class="wrapper">

<div class="tt"><b>마이페이지</b></div>

<div class="my_ctn">
	<nav class="my_list">
		<ul>
			<li class="my_title">MY 정보</li>
			<li class="my_subt"><a href="/member/joinup">개인정보확인/수정</a></li>
			<li class="my_subt"><a href="/mypage/my_dtn">배송지 관리</a></li>
		</ul><br>
		<ul>
			<li class="my_title">MY 활동</li>
			<li class="my_subt"><a href="/mypage/my_review">상품리뷰 관리</a></li>
			<li class="my_subt"><a href="/mypage/my_board">게시글 확인</a></li>
		</ul><br>
		<ul>
			<li class="my_title">MY 쇼핑</li>
			<li class="my_subt"><a href="/item/od_list">주문목록/배송조회</a></li>
			<li class="my_subt"><a href="/item/od_cancel">주문취소/반품내역</a></li>
		</ul>
	</nav>

	<div class="my_ctn2">

