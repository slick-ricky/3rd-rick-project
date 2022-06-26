<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<link rel="stylesheet" href="/css/item_view.css">

<script>
function point(){
	var price = $("#default_price").val();
	var amount = $("#result").val();
	var totalPrice = price * amount;
	var point = eval(totalPrice * 0.01);
	$("#allpoint1").val(point);
	var delivery = $('input:radio[name="od_dvr"]:checked').val();

	$("#total_price").val(totalPrice);
}

$(document).ready(function(){
	$(".gesu2 input[type=button]").on("click", function(){
		var count = $(this).val(); // 클릭 시 들어온 input +1 또는 -1
		var resultNum = $("#result").val();
		var it_qty = "${item.it_qty}"
		resultNum = eval(resultNum + count);
		if(resultNum < 1){
			alert("주문수량은 1보다 작을 수 없습니다.");
			resultNum = 1;
		}
		if(resultNum > it_qty){
			alert("주문가능수량을 초과할 수 없습니다.");
			resultNum = 1;
		}
		$("#result").val(resultNum);
		point();
	});	
	
	$(".cupsize input[type=radio]").on("change", function(){	
		var itemPrice = $(this).val(); //클릭 시 들어온 input 컵사이즈 value값
		itemPrice = eval(itemPrice); 
		var resultNum = $("#result").val();
		$("#default_price").val(itemPrice);
		var total_price = eval(itemPrice * resultNum);
		point();
		if($(this).attr('id') == 'od_size1'){
			$("#od_size").val("S");
		}else if($(this).attr('id') == 'od_size2'){
			$("#od_size").val("M");
		}else{
			$("#od_size").val("L");
		}
	});
	
});

function doShow(imgSrc){ // 이미지 클릭시 빅사이즈 처리 
	document.getElementById("bigImg").src = imgSrc;
}

$(document).ready(function(){ //포인트 소수점 버림 처리
	var point2 = $("#allpoint1").val();
	point2 = Math.floor(point2);
	$("#allpoint1").val(point2);
});


function ok2(){
	var id = "${sessionScope.id}";
	
	if(!id){
		alert("먼저 로그인을 하세요.");
		location.href="/member/login";
		return false;
	}
}
</script>

<style>
.tt {
	margin-left: 24%;
	margin-block-start: 30px;
	margin-block-end: -20px;
	height: 100px;
	font-size: 27px;
	font-weight: bold;
}
.good12_wrap{
	width: 1000px;
	margin: 0 auto;
	margin-block-end: 50px;
	border:0px solid black;
	overflow: hidden;
}
.op1 {
	width:500px;
}
.opop{
	float: left;
	margin-top: 20px;
}
.good12_wrap .opop .imgbig{
	width:400px;
	height:390px;
	text-align:center;
	border:0px solid black;
}
.good12_wrap .imgsm{
	list-style:none;
}
.imgsm li{
	width:100px;
	display :inline-block;
	margin-top:10px; 
}
.imgsm li img{
	width:100%;
}

.sm1{
	width:90px;
	height:90px;
	margin-top:10px;
}
.sm2{
	width:90px;
	height:90px;
	margin-left:5px;
	margin-top:10px;
}
.option{
	float: right;
}
.option .op >div{
 text-align:left;
 width:520px;
 border:0px solid black;
}
.hugi,.like{
	display :inline-block;
}
.hugi{
	width:435px;
	border:0px solid black;
}
.baguni,
.bye,
.like1{
	margin-top:10px;
	display :inline-block;
}
.baguni,
.bye{
	width:200px;
	height:50px;
	text-align:center;
	border:1px solid #007042;
}
.like1{
	width:50px;
	height:50px;
	text-align:center;
	border:0px solid black;
}
.bye,
.like1{
	margin-left:10px;
}

.explan{
	width:100%;
	overflow: hidden;
	border:0px solid black;
}

.riew1 .re_pic{
	float: left;
	width: 150px;
	height: 150px;
	text-align:center;
	border:0px solid black;
	clear:both;
}
.riew1 .re_sub{
	width: 836px;
	border:0px solid black;
	float: left;
	margin-left:10px;
	font-size:12px;
}
.riew1 .re_comall .re_com{
	width:530px;
	height:70px;
	border:0px solid black;
	float: left;
	margin-left:10px;
}
.riew1 .re_comall .re_star,
.riew1 .re_comall .re_day,
.re_day1,
.riew1 .re_comall .re_name{
	float: left;
	display :inline-block;
	margin-top:25px;
}
.riew1 .re_comall .re_star{
	width:100px;
	border:0px solid black;
	text-align:center;
}
.riew1 .re_comall .re_day{
	width:100px;
	border:0px solid black;
	text-align:center;
	font-size: 14px;
}
.riew1 .re_comall .re_name{
	width:100px;
	border:0px solid black;
	text-align:center;
}
.dodo{
	width:100px;
	margin-left:900px;
}
.explan2{
	width:100%;
	overflow: hidden;
	border:0px solid black;
}
.qu_why2,.qu_why1{
	display :inline-block;
}
.qu_why2{
	width:500px;
}
.explan2 .question .qu_why1{
	width:50px;
	
}
.explan2 .question .qu_name{
	width:150px;
	float: right;
	text-align:center;
	font-size: 14px;
}
.explan2 .question .qu_date{
	width:150px;
	float: right;
	font-size: 14px;
}
.explan2 .question .qu_why1,
.explan2 .question .qu_name,
.explan2 .question .qu_date{
	display :inline-block;
}
.sang1,.moon1{
	margin-top:60px;
	width:90%;
}
.moon1,.moon2{
	display :inline-block;
}
.sang1,.sang2{
	display :inline-block;
}
.moon2,.sang2{
	text-align:center;
	cursor:pointer;
}
.but1,.but2{
	width:100%;
	height:100%;
	border:1px solid #98a3b3;
	font-size:15px;
    cursor: pointer;	
}
.but1{
	background-color:#ffffff;
}
.but2{
	background-color:#007042;
	color: white;
}
.but3{
	background: none;
	border: none;
	outline: none;
	top:15px;
	position: relative;
	font-size:15px;
    cursor: pointer;
}
.likeboxs{
	border:0px solid #98a3b3;
	right:31px;
	top:-16px;
	position: relative;
	font-size:13px;
	text-align:center;
	color:#ffffff;
}
.likebox{
	top:15px;
	position: relative;
	border:0px solid #98a3b3;
}



.pri1,.point1,.tack1,.gesu1,.totalc1	{
	width:150px;
	margin-top:10px;
}
.both1{
	clear:both;
}
.pri1,.pri2,
.point1,.point2,
.tack1,.tack2,
.gesu1,.gesu2,
.totalc1,.totalc2{
	display :inline-block;
}
.gesu2{
	border:0px solid black;
	margin-top: 15px;
}
.plusbt,.minusbt{
    cursor: pointer;
    width: 30px;
    height: 30px;
    border-radius:50%; 
    font-size:20px; 
    border: 1px solid gray; 
    color: gray; 
    padding-bottom:30px;
}

.resultnum{
	border:0px solid black;
	text-align: right;
	margin-left: 8px;
	padding-left:10px;
	padding-right:10px;
	font-size: 15px;
}
.resultnum1{
	border:0px solid black;
	text-align:left;
	padding-left:0px;
	padding-right:0px;
	font-size: 17px;
	width: 150px;
}
.resultnum2{
	border:0px solid black;
	text-align:left;
	padding-left:0px;
	padding-right:0px;
	font-size: 17px;
	width: 70px;
}
.paging{
	text-align:center;
	margin-top: 30px;
	font-size:15px;
}
.momo1{
	background-color:#949494;
	color:#ffffff;
	padding:2px 5px 2px 5px;
	width:130px;
	font-size:14px;
}
.reply{
	background-color:#3a8afd;
	color:#ffffff;
	padding:2px 5px 2px 5px;
	width:130px;
	font-size:14px;
}
.qu_priname{
	font-size:13px;
	color:#bdbdbd;
	margin:10px 0px 5px 0px;
}
.moond{
	font-size:13px;
	float: right;
}
.nonono{
	margin-top: 15px;
	text-align:center;
}
.cupsize{
	display: flex;
	justify-content: space-between;
	width: 350px;
	height: 130px;
	margin-top: 20px;
	border: 0px solid black;
}
.cup_border{
	border: 1px solid lightgray;
	border-radius: 5px;
	width: 85px;
	text-align: center;
}
.cupsize input[type=radio]{
    display: none ;
}
.cupsize label:hover{
	border: 3px solid #18f98d;
	border-radius: 8px;
}
.cupsize input[type="radio"]:checked + label{
	border: 3px solid #18f98d;
	border-radius: 8px;
	box-shadow: 0 15px 45px rgba(24,249,141,0.3);
}
.gesu2 input[type=button]{
	display: none;
}
label{
	transition: 1s;
	cursor: pointer;
}
.gesu2 > label{
position: absolute;
    top: 490px;
}

.request {
	width: 400px;
	height: 100px;
	border: 1px solid lightgray;
	padding: 10px;
	margin-bottom: 10px;
}
.request:focus {
	border: 1px solid lightgray;
	outline: none;
	box-shadow: 0 15px 45px rgba(24,249,141,0.1);
}

.thumb_img {
	border: 0px solid lightgray;
	border-collapse: collapse;
}
</style>

<div class="tt"><b>상품</b></div> 
<!-- 사진 -->	

<form action="cartinsert" method="post" onsubmit="return ok2()">

<input type="hidden" name="it_uid" value="${param.it_uid }">


<!-- 상품 이미지 -->

<div class="good12_wrap">
	<div class="opop">
		<div class="imgbig">
			<img src="/upload/${item.file1 }"width=400 height=390 id="bigImg">
		</div>
		<div class="imgsm">
			<li><img class="thumb_img" src="/upload/${item.file1 }" width=90 height=90 onclick="doShow(this.src)"></li>
			<c:if test="${item.file2 eq ''}"><li></li></c:if>
			<c:if test="${item.file2 ne ''}"><li><img class="thumb_img" src="/upload/${item.file2 }" width=90 height=90 onclick="doShow(this.src)"></li></c:if>
			<c:if test="${item.file3 eq ''}"><li></li></c:if>
			<c:if test="${item.file3 ne ''}"><li><img class="thumb_img" src="/upload/${item.file3 }" width=90 height=90 onclick="doShow(this.src)"></li></c:if>
			
		</div>
	</div>
	
<!-- 상품 정보 -->	
	<c:if test="${item.it_qty ne 0}">
		<div class="option">
			<div class="op1">
			<div><h2 style="margin-top:10px; margin-bottom:0px;"><c:out value="${item.it_name }"/></h2></div>
				<div style ="margin-top:15px; border: 1px solid black; width: 500px;"></div>
			<div style="margin-top: 15px; color: #444444;"><b>${item.it_desc }</b></div>
<!--선-->		<div style ="margin-top:15px; border-top: 1px solid lightgray; width: 500px;"></div>
				<div class="pri1" style="font-size: 15px;"><b>가격</b></div>
				<div class="pri2">
					<input type="number" id="default_price" value="${item.it_price }" style="border:1px solid lightgray; font-size: 15px; width:100px;" readonly>원
				</div><br>
				
				<div class="pri1" style="font-size: 15px;"><b>주문가능 수량</b></div>
				<div class="pri2">
					<input type="number" value="${item.it_qty}" style="border:1px solid lightgray; font-size: 15px; width:70px;" readonly>
				</div>
			<div class="both1"></div>
			<div class="point1" style="font-size: 15px;"><b>포인트 적립</b></div>
			<div class="point2">
				<input type="number" style="border:none; outline:none;" class="resultnum2" id= "allpoint1" name="od_point" value="${item.it_price *0.01}" readonly>
			</div>
			<div class="both1"></div>
<!--선-->		<div style ="margin-top:15px; border-top: 1px solid lightgray; width: 500px;"></div>
			<div class="gesu1" style="font-size: 15px; margin-top:15px;"><b>주문수량</b></div>
			<div class="gesu2" style="margin-left: -6px;">
				<input class="minusbt" type="button" id="minusbt" value="-1"><label for = "minusbt"><img src="/img/minus.png"></label> <!--form_btn(절대값,"변수") -->
				<input type="number" class="resultnum" id= "result" name="od_amount" value="1" style="width:60px;margin-left: 37px;" readonly>
				<input class="plusbt" type="button" id="plusbt" value="+1"><label for = "plusbt"><img src="/img/plus.png"></label>
			</div>
			
			<%if(it_category.equals("1") || it_category.equals("2")){%>
			<div style="margin-top:20px;"><b>컵사이즈 선택</b></div>
			<div class="cupsize">
				<input type="radio" name="od_size0" id="od_size1" value="${item.it_price}" class="cup_line" style="width:90px; border:1px solid lightgray" checked><label for = "od_size1"><img src="/img/small1.png" width="95px" style="margin-top:10px;"></label>
				<input type="radio" name="od_size0" id="od_size2" value="${item.it_price}+500" class="cup_line" style="width:90px; border:1px solid lightgray"><label for = "od_size2"><img src="/img/medium1.png" width="95px" style="margin-top:10px;"></label>
				<input type="radio" name="od_size0" id="od_size3" value="${item.it_price}+1000" class="cup_line" style="width:90px; border:1px solid lightgray"><label for = "od_size3"><img src="/img/large1.png" width="95px" style="margin-top:10px;"></label>
				<input type="hidden" id="od_size" name="od_size" value="S">
			</div>
			<div>
				<div style="font-size:12px; color: gray; margin-top:10px;">* Size Up 할 때마다 500원씩 추가</div>
			</div>
			<div style="margin-top:20px; margin-bottom:20px;">
				<input type="radio" name="od_hot" value="Y" checked> <font color="#e91e63"><b>HOT</b></font> &nbsp;
				<input type="radio" name="od_hot" value="N"> <font color="#039be5"><b>COLD</b></font>
			</div>
			<%}%>
			
			<div style="margin-top:40px; margin-bottom:20px;" class="dvr">
				<input type="radio" name="od_dvr" id="od_dvr" value="Y"> <b>배송 주문</b><font size="2px" color="gray"></font> &nbsp;
				<input type="radio" name="od_dvr" id="od_dvr1" value="N" checked> <b>매장/포장 주문</b>
			</div>
			<div style="margin-top:20px; margin-bottom:15px;"><b>요청사항</b></div>
			<div>
				<textarea class="request" name="od_request"></textarea>
			</div>
<!--선-->		<div style ="margin-top:15px; border-top: 1px solid lightgray; width: 500px;"></div>	
			</div>
			<div class="both1" style="margin-top: 5px;"></div>
			<div class="totalc1" style="font-size: 20px;"><b>총 금액:</b></div>
			<div class="totalc2">
				<span id="alltotal1">
					<font size="4px" color="#007042"><b>&#8361;</b></font>
						<input type="text" style="border:none; outline:none; color:#007042; font-size:22px; font-weight:bold;" class="resultnum1" id="total_price" name="od_price"  readonly value="${item.it_price }">
				</span>
			</div>
				<div style ="margin-top:15px; margin-bottom: 20px; border-top: 1px solid lightgray; width: 500px;"></div>
			<div class="baguni">
				<button class="but1"><b>장바구니 담기</b></button>
			</div>
			<div class="bye"><button type="submit" formaction="/item/buynow" class="but2"><b>구매하기</b></button></div>
		</div>
		</c:if>
		
		
	<c:if test="${item.it_qty <= 0}">
		<div class="option">
		<div class="op1" style="height:500px; padding-top:150px;">
			<img src="/img/soldout.png" width="450">
		</div>	
		</div>	

	</c:if>
	
	</div>
</form>


<style>
.review {
	margin: auto;
	margin-block-end: 150px;
	width: 1000px;
	min-height: 300px;
	border: 0px solid black;
	padding: 10px;
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
.star_rating a#on {filter: brightness(100%);}

</style>

<div class="review">
	<hr><br>
	<p style="font-size:25px; font-weight:bold;">상품평</p>
	<br>
	<c:forEach var="rv" items="${review}">
	<div>
		<div style="height:30px;">
			<div style="margin-bottom:10px;">${rv.names}
				<span style="color:gray; font-size: 13px;">
					${rv.date} <input type="hidden" name="star_result" id="star_result" value="${rv.score}">
				</span>
			</div>
		</div>
		<div style="margin-bottom:10px;">
			<p class="star_rating">
			    <a href="#" id='<c:if test="${rv.score >= 1}">on</c:if>'><img src="/img/star.png" width="20px" height="20px"></a>
			    <a href="#" id='<c:if test="${rv.score >= 2}">on</c:if>'><img src="/img/star.png" width="20px" height="20px" <c:if test="${rv.score < 2}">style="filter: brightness(0.5);"</c:if>></a>
			    <a href="#" id='<c:if test="${rv.score >= 3}">on</c:if>'><img src="/img/star.png" width="20px" height="20px" <c:if test="${rv.score < 3}">style="filter: brightness(0.5);"</c:if>></a>
			    <a href="#" id='<c:if test="${rv.score >= 4}">on</c:if>'><img src="/img/star.png" width="20px" height="20px" <c:if test="${rv.score < 4}">style="filter: brightness(0.5);"</c:if>></a>
			    <a href="#" id='<c:if test="${rv.score >= 5}">on</c:if>'><img src="/img/star.png" width="20px" height="20px" <c:if test="${rv.score < 5}">style="filter: brightness(0.5);"</c:if>></a>
			</p>	
		</div>
		<div style="margin-bottom:10px"><img src="/upload/${rv.file1}" width="100" height="100"></div>
		<div style="margin-bottom:20px; font-size:14px;">${rv.comment}</div>
		<div class="stf" style="border-bottom:1px solid #aaaaaa; height:40px; font-size:14px; margin-bottom:20px;">
			<b>만족도 평가:</b> <span style="font-weight: normal; margin-left:10px;">"${rv.satisfied }"</span>
		</div>
	</div>
	</c:forEach>
</div>



<%@ include file="/WEB-INF/views/include/footer.jsp" %>