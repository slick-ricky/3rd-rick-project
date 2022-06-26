<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>

<style>
.title {
	margin-left: 20.5%;
	margin-block-start: 30px;
	height: 100px;
	font-size: 27px;
	font-weight: bold;
}

.rgt_btn button {
	margin-left: 72%;
	width: 120px;
	height: 35px;
	background-color: #666666;
	border-radius: 5px;
	color: white;
	font-weight: bold;
	cursor: pointer;
	font-size: 16px;
}

.rgt_btn button:focus {
	margin-left: 72%;
	width: 120px;
	height: 35px;
	background-color: #666666;
	border-radius: 5px;
	color: white;
	font-weight: bold;
	cursor: pointer;
	font-size: 16px;
	box-shadow: 0px 0px 8px #003ea8;
}

.goods_ctn {
	margin: auto;
	margin-block-start: 50px;
	margin-block-end: 200px;
	width: 1100px;
	height: auto;
	display: flex;
	flex_direction: row;
	justify-content: space-between;
	flex-wrap: wrap;
	border:  0px solid black;
}

.goods_box {
	margin: 0px 30px 0px 30px;
	width:200px;
	height:300px;
}

.goods_img {
	width: 200px;
	height: 200px;
}

.goods_desc {
	margin-top: 10px;
	width: 200px;
	height: 80px;
	background-color: white;
	font-size: 13px;
	line-height: 20px;
}

ul {
	list-style: none;
}

.line {
	border-bottom: 1px solid lightgray;
	margin-top: 5px;
	margin-bottom: 5px;
}

main {
	min-height: 570px;
}
</style>

<main>

<div class="title"><b><%@include file="item_title.jsp" %></b></div>


<ul style="padding:0px;" class="goods_ctn">
		
	<c:forEach var="list" items="${list }">
		<li class="goods_box">
			<div class="goods_img"><a href="/admin/item/item_update?it_uid=${list.it_uid }"><img src="/upload/${list.file1}" width=100% height=100%></a></div>
			<div class="goods_desc">
				<span><b><font color="#555555"><c:out value="${list.it_name }"/></font></b></span><br>
				<div class="line"></div>
				<span>
					<font color="#555555">KRW: <fmt:formatNumber type="number" maxFractionDigits="3" value="${list.it_price}" /></font>
				</span><br>
				<span style= "display:block; padding-top: 10px; margin-block-start: -130px;">
					<c:if test="${list.it_new == 'Y'}">
						&nbsp;<img src="/img/new3.png" width="50px">
					</c:if>
					<c:if test="${list.it_season == 'Y'}">
						<img src="/img/limit.png" width="50px"> &nbsp; &nbsp;
					</c:if>
				</span>
			</div>
		</li>	
	</c:forEach>
</ul>

</main>

<%@ include file="/WEB-INF/views/admin/include/footer.jsp" %>