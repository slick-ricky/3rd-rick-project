<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/nav_header.jsp" %>

<style>
.tt_2 {
	line-height: 50px;
	font-size: 24px;
	margin-left: 50px;
	margin-top: -30px;
	margin-bottom: 30px;
}

.od_date{
	text-align: left;
	font-size: 14px;
	margin-top: 10px;
	margin-left: 90px;
}

.od_ctn {
	width: 700px;
	min-height: 130px;
	border: 0px solid lightgray;
	border-radius: 8px;
	margin-left: 80px;
	margin-top: 10px;
	text-align: left;
	font-size: 18px;
	padding: 10px;
}

.od_info {
	border: 0px solid black;
	width: 630px;
	height: 70px;
	font-size: 15px;
	padding: 5px;
	line-height: 20px;
	margin-left:10px;
	margin-top: 10px;
}

.cancel_btn {
	float: right;
	margin-top: -10px;
	background-color: #666666;
	color: white;
	width: 70px;
	height: 25px;
	font-size: 13px;
	font-weight: bold;
	border-radius: 5px;
	cursor: pointer;
}

.review_btn {
	float: right;
	margin-top: -10px;
	background-color: white;
	border: 1px solid gray;
	color: gray;
	width: 100px;
	height: 25px;
	font-size: 13px;
	font-weight: bold;
	border-radius: 5px;
	cursor: pointer;
}

.stf {
	margin-top: 7px;
	font-size: 13px;
}

.star_rating {
	font-size:0; 
	letter-spacing:-4px;
	padding-top: 15px;
	font-size: 13px;
	font-weight: normal;
	color: gray;
	}
	
.star_rating a {
    font-size:15px;
    font-weight: bolder;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    filter: opacity(0.2) drop-shadow(0 0 0 darkgray);
    text-decoration:none;
}
.star_rating a:first-child {margin-left:0;}
.star_rating a#on {filter: brightness(100%);}

button {
	background: white;
	border: 1px solid #717984;
	border-radius: 3px;
	color: #717984;
	width: 35px;
	cursor: pointer;
}
</style>


<h2 class="tt_2">리뷰관리</h2>


<div class="od_ctn">

	<c:forEach var="list" items="${list}">
	<div style="display:flex; margin-top:10px; height:50px; border-bottom:1px solid lightgray;">
		<div style="width:40px; height:40px; border:0px solid lightgray;">
			<img src="/upload/${list.it_file }" width="100%" height="100%">
		</div>
		<div class="od_info">
			<span>상품정보: <span style="font-size: 14px; font-weight: normal">${list.it_name}</span></span>
			<span style="float:right">
				<button onclick="aaa(${list.od_group})">삭제</button>
			</span>
		</div>
	</div>
	<div>
		<p class="star_rating">
		    <a href="#" id='<c:if test="${list.score >= 1}">on</c:if>'><img src="/img/star.png" width="20px" height="20px"></a>
		    <a href="#" id='<c:if test="${list.score >= 2}">on</c:if>'><img src="/img/star.png" width="20px" height="20px" <c:if test="${list.score < 2}">style="filter: brightness(0.5);"</c:if>></a>
		    <a href="#" id='<c:if test="${list.score >= 3}">on</c:if>'><img src="/img/star.png" width="20px" height="20px" <c:if test="${list.score < 3}">style="filter: brightness(0.5);"</c:if>></a>
		    <a href="#" id='<c:if test="${list.score >= 4}">on</c:if>'><img src="/img/star.png" width="20px" height="20px" <c:if test="${list.score < 4}">style="filter: brightness(0.5);"</c:if>></a>
		    <a href="#" id='<c:if test="${list.score >= 5}">on</c:if>'><img src="/img/star.png" width="20px" height="20px" <c:if test="${list.score < 5}">style="filter: brightness(0.5);"</c:if>></a>
		    <span style="margin-top:-21px; margin-left:130px; display:block; letter-spacing: 0px;">입력날짜: ${list.date }
		    <input type="hidden" name="star_result" id="star_result" value="${list.score }"> </span>
		</p>
	</div>
	<div style="margin-top:20px;"><img src="/upload/${list.file1 }" width="100" height="100"></div>
	<div>
		<textarea style="width:680px; min-height:50px; margin-top:20px; border:0px solid black" readonly>${list.comment }</textarea>
	</div>
	<div class="stf" style="border-bottom:1px solid #aaaaaa; height:40px">
		만족도 평가: <span style="font-weight: normal">"${list.satisfied }"</span>
	</div>
	<br>
	
	</c:forEach>
	
</div>

<script>

function aaa(od_group){
	alert(od_group);
	$.ajax({
		url: "/mypage/myReview_dlt",
		type: "post",
		data: {"od_group" : od_group},
		dataType: "text",
		success: function(result){
			location.reload();
		}	
	});

};

</script>


<%@ include file="/WEB-INF/views/include/nav_footer.jsp" %>
