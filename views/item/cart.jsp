<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<style>
table, td {
	border-collapse: collapse;
}

.tt {
	margin-left: 24%;
	margin-block-start: 30px;
	margin-block-end: -20px;
	height: 100px;
	font-size: 27px;
	font-weight: bold;
}

.cart_ctn {
	margin: auto;
	margin-block-start: 20px;
	margin-block-end: 100px;
	width: 1000px;
	border: 0px solid black;
	font-size: 14px;
	min-height: 410px;
}

.checkAll {
	background-color: #f4f4f2;
	font-weight: bold;
	font-size: 14px;
	height: 30px;
}

.sumUp {
	height: 60px;
	background-color: white;
	font-size: 19px;
}

.sumUp2 {
	height: 30px;
	background-color: white;
	font-size: 12px;
	color: gray;
	height: 50px;
}

.btn_ctn {
	margin: auto;
	margin-block-start: 50px;
	height: 50px;
	border: 0px solid black;
	display: flex;
	width: 450px;
	justify-content: space-between;
}

.btn1 {
	width: 200px;
	height: 50px;
	font-weight: bold;
	color: #007a48;
	border: 2px solid #007a48;
	margin: auto;
	text-align: center;
	line-height: 50px;
	font-size: 18px;
	background-color: white;
	cursor: pointer;
}

.btn2 {
	width: 200px;
	height: 50px;
	color: white;
	background-color: #007a48;
	font-weight: bold;
	margin: auto;
	text-align: center;
	line-height: 50px;
	font-size: 18px;
	cursor: pointer;
}
.atag {
	color: #007a48;
}

.total {
	margin-top: 50px;
	border: 3px solid lightgray;
}
</style>

<script>
$(document).ready(function(){
	$(".list_item input[type=checkbox]").on("change", function(){
		var check = "-1";	
		
		if($(this).is(":checked")){check = "1";}else{check = "0";}
		
		var odNum = $(this).attr("value");
		var qty = $("#it_qty"+odNum).val();
		
		if($(this).is(":checked") && qty == "0"){
			alert("해당 상품은 품절되어 구매할 수 없습니다.");
			check = "0"}
	//	alert(qty);
		var data = {"checked":check, "od_num":odNum};
		$.ajax({
			url:"/item/itemCheck",
			type:"post",
			data: data,
			dataType:"text",
			success:function(result){
				location.reload();
			}
		});
	});
});

$(document).ready(function(){
	$(".checkAll input[type=checkbox]").on("change", function(){
		var checkAll = "-1";
		
		if($(this).is(":checked")){
			$(".list_item input[type=checkbox]").prop("checked", true);
			checkAll = "1";
		}else{
			$(".list_item input[type=checkbox]").prop("checked", false);
			checkAll = "0";
		}
//		alert(checkAll);
		$.ajax({
			url:"/item/checkAll",
			type:"post",
			data:{"checkAll": checkAll},
			dataType:"text",
			success:function(result){
				location.reload();
			}
		});
	});
});


</script>


<div class="tt"><img src="/img/cart.png" style="vertical-align:middle; padding-bottom:10px; margin-right:5px;"><b>장바구니</b></div> 

<form name="cart" action="/pay" method="post" onsubmit="return ok()">
<div class="cart_ctn">
	<table border=1>
		<tr>
			<td class="checkAll" width=30 align=center><input type="checkbox" id="cchhkk" <c:if test="${allCheck eq 1}">checked</c:if>></td>
			<td class="checkAll" width=80 align=center>전체선택</td>
			<td class="checkAll" width=660 align=center>상품정보</td>
			<td class="checkAll" width=130 align=center>상품금액</td>
			<td class="checkAll" width=100 align=center>배송서비스</td>
		</tr>
		
		<c:forEach var="list" items="${list}">
		<tr>
			<td class="list_item" width=10 align=center rowspan=2>
				<c:choose>
					<c:when test="${list.checked == '1'}">
						<input type="checkbox" id="chk" value="${list.od_num }" checked>
					</c:when>
					<c:otherwise>
						<input type="checkbox" id="chk" value="${list.od_num }">
					</c:otherwise>
				</c:choose>
			</td>
			<td rowspan=2 style="position:relative;">
				<c:if test="${list.it_qty eq 0}">
					<img src="/upload/${list.file1}" width="80px" height="80px"  style="display:block; opacity:0.3;">
					<p style="position:absolute; top:30%; left:2%;"><img src="/img/soldout.png" width="75"></p>
				</c:if>
				<c:if test="${list.it_qty ne 0}">
					<img src="/upload/${list.file1}" width="80px" height="80px"  style="display:block;">
				</c:if>
			</td>
			<td>
				<b>&nbsp; ${list.it_name}, 사이즈 ${list.od_size}, ${list.od_amount}개</b>
				&nbsp; <input type="hidden" value="${list.ct_uid}" style="width:170px; text-align:center;">
	<!--재고수량 -->	   <input type="hidden" id="it_qty${list.od_num }" value="${list.it_qty }">
				<img src="/img/dlt2.png" width="17px" height="17px" style="float:right; margin-right:10px; cursor:pointer" onclick="aaa(${list.ct_uid})">
			</td>
			<td rowspan=2 align=center>${list.it_price}원</td>
			<td rowspan=2 align=center>
				<c:choose>
					<c:when test="${list.od_dvr == 'Y'}">
						Yes
					</c:when>
					<c:otherwise>
						No
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td>
				<span>&nbsp; 장바구니 등록일자: ${list.ct_date}</span>
				<span style="margin-left:245px;">주문금액: ${list.od_price}원</span>
			</td>
		</tr>
		</c:forEach>
	</table>
	
	<table class="total" border=0 width=100%>	
		<tr>
			<td class="sumUp" colspan=5 align=right>총 주문금액 <b>${tp.totalPrice}</b>원 + 배송비 <b>${tp.deliveryPrice}</b>원 = 총 결제금액 <font color="#007a48"><b>${tp.totalPrice + tp.deliveryPrice}</b></font>원 &nbsp;</td>
		</tr>
	</table>
	
	<table border=0 width=100%>
		<tr>
			<td class="sumUp2" colspan=5 align=right>*주문하신 총 주문금액이 20000원 이상인 경우, 무료배송해드립니다.</td>
		</tr>
	</table>
	
	<div class="btn_ctn">
		<div class="btn1"><a href="/item/list?it_category=1" class="atag">계속 쇼핑하기</a></div>
		<button type="submit" formaction="/item/pay" class="btn2">구매하기</button>
	</div>
</div>
</form>

<script>
function aaa(ct_uid){
	alert("해당 상품이 삭제됩니다.");
	
	$.ajax({
		url: "/item/ct_dlt",
		type: "post",
		data: {"ct_uid" : ct_uid},
		dataType: "text",
		success: function(result){
			location.reload();
		}
	});
}

function ok(){
	if (!$("input:checkbox" ).is( ":checked")){
		alert("구매상품을 선택해주세요.");
		return false;
	}	
}
</script>

<script>
// function checkall() {//체크박스 전체 선택 , 해제
// 	if(Form1.all.checked) {
// 		for(i=1; i < (document.Form1.length); i++){
// 			document.Form1.elements[i].checked = true;
// 		}
// 	}else{
// 		for(i=1; i < (document.Form1.length); i++){
// 			document.Form1.elements[i].checked = false;
// 		}
// 	}
// }

// function check_select(){//체크박스 부분 선택
// 	myForm = document.getElementsByName("ap_check");
// 	myFormLen = myForm.length; //체크박스 전체수
	
// 	if(myFormLen==1){
// 		document.Form1.ap_check.checked = true;
// 		document.Form1.ap_check_hide.value=document.Form1.ap_check.value;
// 	} 

// 	for(var i = 0;  i < document.Form1.ap_check.length; i++) {
// 		 if(document.Form1.ap_check[i].checked == true) break;
// 	}
// 	if(i == document.Form1.ap_check.length) {
// 		alert("선택된 항목이 없습니다.");         
// 		return;
// 	}
// 	if(confirm('선택한 항목을 확인하시겠습니까?')){
// 		check_select2();
// 	} 
// }

// function check_select2(){//체크된 값들
// 	var check_hide = new Array();

// 	for(var i = 0;  i < document.Form1.ap_check.length; i++) {
// 		if(document.Form1.ap_check[i].checked == true) {
// 			check_hide[i] = document.Form1.ap_check[i].value;
// 		}
// 	}
// 	alert(check_hide);//체크된 값들 확인
// }
</script>


<!-- <form name="Form1" id="Form1"> -->
<!-- 	<input type="checkbox" name="all" value="checkbox" onClick="checkall()"> 전체 <br><br> -->
<!-- 	<input type='checkbox' name='ap_check' value='1'> 1 <br> -->
<!-- 	<input type='checkbox' name='ap_check' value='3'> 3 <br> -->
<!-- 	<input type='checkbox' name='ap_check' value='5'> 5 <br> -->
<!-- </form> -->
<!-- <br> -->
<!-- <button onClick="check_select();return false;" style="cursor:pointer;">선택된 값 확인</button> -->

<%@ include file="/WEB-INF/views/include/footer.jsp" %>