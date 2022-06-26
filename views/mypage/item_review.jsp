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

.review {
	width: 700px;
	min-height: 130px;
	border: 1px solid lightgray;
	border-radius: 8px;
	margin-left: 80px;
	margin-top: 0px;
	margin-bottom: 100px;
	text-align: left;
	font-size: 18px;
	padding: 0px 10px 20px 10px;
}

.star_rating {font-size:0; letter-spacing:-4px;}
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
.star_rating a.on {filter: brightness(100%);}

.rv1 {
	display: flex;
	margin-top: -10px;
}

.rv2 {
	display: flex;
	font-size: 13px;
	font-weight: normal;
}

.txt {
	width: 550px;
	height: 180px;
	border: 1px solid lightgray;
	padding: 5px;
	font-size: 13px;
}

.rg_btn {
	margin-left: 44%;
	background-color: #666666;
	color: white;
	width: 80px;
	height: 30px;
	font-size: 15px;
	font-weight: bold;
	border-radius: 5px;
	cursor: pointer;
}
</style>

<h2 class="tt_2">상품 품질 리뷰</h2>

<form action="myReview" method="post" enctype="multipart/form-data">
<input type="hidden" name="od_group" value="${review.od_group }">
<input type="hidden" name="it_name" value="${review.it_name }">
<input type="hidden" name="it_file" value="${review.file1 }">

<div class="review">
	<br>
	<div class="rv1">
		<div style="margin-bottom:10px;"><img src="/upload/${review.file1 }" width="100px" height="100px"></div>
		<div style="margin-bottom:10px; margin-left:20px;">
			<div style="margin: 10px 0px">상품 정보: <span style="font-weight:normal; font-size:17px;">${review.it_name }</span></div>
			<p class="star_rating">
			    <a href="#" class="on"><img src="/img/star.png" width="25px" height="25px" id="a1"></a>
			    <a href="#" class="on"><img src="/img/star.png" width="25px" height="25px" id="b2"></a>
			    <a href="#" class="on"><img src="/img/star.png" width="25px" height="25px" id="c3"></a>
			    <a href="#"><img src="/img/star.png" width="25px" height="25px" id="d4"></a>
			    <a href="#"><img src="/img/star.png" width="25px" height="25px" id="e5"></a>
			    <input type="hidden" name="score" id="star_result" value="3">
			</p>
			<p style="font-size:15px; font-weight:normal;">&nbsp;(필수)<font color="red">*</font></p>
		</div>
	</div>
	
	<hr style="margin: 20px 0px">
	
	<div class="rv2">
		<div style="width:120px; padding:20px; font-size: 15px;"><b>리뷰</b></div>
		<div style="line-height: 20px; font-size: 13px;">
			<p style="padding-bottom: 10px;"><b><font size="3px">Q.</font> 해당 상품에 대해 얼마나 만족하십니까?</b></p>
			<input type="radio" name="satisfied" value="만족"> 만족<br>
			<input type="radio" name="satisfied" value="보통"> 보통<br>
			<input type="radio" name="satisfied" value="불만"> 불만
		</div>
	</div>
	
	<hr style="margin: 20px 0px">
	
	<div class="rv2">
		<div style="width:120px; padding:20px; font-size: 15px;"><b>상세리뷰</b></div>
		<div style="line-height: 20px; font-size: 13px;">
			<textarea class="txt" name="comment"></textarea>
		</div>
	</div>
	
	<hr style="margin: 20px 0px">
	
	<div class="rv2">
		<div style="width:120px; padding:0px 20px; font-size: 15px;"><b>사진첨부</b></div>
		<div style="line-height: 20px; font-size: 13px;">
			<input multiple="multiple" type="file" name="file">
		</div>
	</div>
	
	<hr style="margin: 20px 0px">
	
	<button class="rg_btn">등록하기</button>
</div>
</form>

<script>
$(".star_rating a").click(function() {
	$(this).parent().children("a").removeClass("on");
    $(this).addClass("on").prevAll("a").addClass("on");
	return false;
});

$(document).ready(function(){
	var score = 0;
	
	$("#a1").on("click", function(){
		score = 1;
//		alert("score= "+score);
		$("#star_result").val(score);
	});
	$("#b2").on("click", function(){
		score = 2;
//		alert("score= "+score);
		$("#star_result").val(score);
	});
	$("#c3").on("click", function(){
		score = 3;
//		alert("score= "+score);
		$("#star_result").val(score);
	});
	$("#d4").on("click", function(){
		score = 4;
//		alert("score= "+score);
		$("#star_result").val(score);
	});
	$("#e5").on("click", function(){
		score = 5;
//		alert("score= "+score);
		$("#star_result").val(score);
	});
	
});	
</script>


<%@ include file="/WEB-INF/views/include/nav_footer.jsp" %>