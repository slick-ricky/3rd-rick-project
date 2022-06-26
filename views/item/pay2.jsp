<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<script src="//code.jquery.com/jquery.min.js"></script>

<style>
table, td {
	border-collapse: collapse;
	padding: 10px;
}

input {
	margin: 4px;
	padding: 2px;
}

input:focus {
	margin: 5px;
	padding: 4px;
	outline: none;
	border: 1px solid #007a48;
}

.tt {
	margin-left: 24%;
	margin-block-start: 30px;
	margin-block-end: -20px;
	height: 100px;
	font-size: 27px;
	font-weight: bold;
}

.sub_tt {
	font-weight: normal;
	font-size: 19px;
}

.cart_ctn {
	margin: auto;
	margin-block-start: 20px;
	margin-block-end: 50px;
	width: 1000px;
	border: 0px solid black;
	font-size: 14px;
}

.table_box {
	margin-top: 15px;
	margin-bottom: 30px;
}

.table_box td {
	height: 30px;
}

.point_btn {
	background-color: #007a48;
	border: 0px solid black;
	border-radius: 5px;
	height: 20px;
	width: 80px;
	color: white;
	font-size: 11px;
	cursor: pointer;
}

.point_btn:hover {
	background-color: gray;
	border: 0px solid black;
	border-radius: 5px;
	height: 20px;
	width: 80px;
	color: white;
	font-size: 11px;
	cursor: pointer;
}

.point_btn:focus {
	background-color: #007a48;
	border: 0px solid black;
	border-radius: 5px;
	height: 20px;
	width: 80px;
	color: white;
	font-size: 11px;
	cursor: pointer;
	box-shadow: 0px 0px 8px #003ea8;
}

.hide > .nba {
	background-color: #f4f6fa;
	border: 3px solid lightgray;
	width: 600px;
	height: 210px;
	margin-top: 7px;
	padding: 7px;
}

.hide > .kakao {
	background-color: #fae101;
	border: 3px solid lightgray;
	width: 600px;
	height: 130px;
	margin-top: 7px;
	margin-left: -150px;
	padding: 7px;
	font-size: 12px;
}

#cur_point {
	margin-bottom: 10px;
	width: 100px;
}

#point_use2 {
	width: 150px;
	border: 0px solid black;
	font-size: 15px;
	color: blue;
	font-weight: bold;
}

#totalPay {
	text-align: left;
	width: 100px;
	border: 0px solid black;
	font-size: 19px;
	font-weight: bold;
	color: #007a48;
}

.btn_ctn {
	margin: auto;
	margin-block-start: 50px;
	margin-block-end: 100px;
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

#exp_time {
	border: 0px solid black;
	outline: none;
	background-color: #f4f6fa;
	text-align: right;
}

.exp {
	font-size: 12px;
}

.call {
	cursor: pointer;
	background: #007a48;
	color: white;
	display: inline-block;
	width: 70px;
	text-align: center;
	padding: 3px;
	border-radius: 3px;
}

.call:hover {
	cursor: pointer;
	background: gray;
	color: white;
	display: inline-block;
	width: 70px;
	text-align: center;
	padding: 3px;
	border-radius: 3px;
}

.kbtn {
	background-color: #666666;
	color: white;
	width: 70px;
	height: 25px;
	font-size: 13px;
	font-weight: bold;
	border-radius: 5px;
	cursor: pointer;
	border: 0px solid black;
	margin-top:20px;
}

.kbtn:hover {
	background-color: lightgray;
	color: white;
	width: 70px;
	height: 25px;
	font-size: 13px;
	font-weight: bold;
	border-radius: 5px;
	cursor: pointer;
	margin-top:20px;
}
</style>

<script>
function call(){
//	alert("call");
	
	window.open("/item/callDtn", "a", "width=700, height=300");
	
}
</script>

<div class="tt"><b>주문/결제</b></div> 

<form name="order" id="order" action="orderInsert" method="post" onsubmit="return ok()">    
<div class="cart_ctn">
	<span class="sub_tt">구매자정보</span>
	<table border=1 width=100% class="table_box">
		<tr>
			<td width=120 align=right style="background-color:#f4f4f4;"><b>구매자</b></td>
			<td>${pay.names }</td>
		</tr>
		<tr>
			<td align=right style="background-color:#f4f4f4;"><b>이메일</b></td>
			<td>${pay.email }</td>
		</tr>
		<tr>
			<td height=40 align=right style="background-color:#f4f4f4;"><b>연락처</b></td>
			<td>${pay.tel }</td>
		</tr>
	</table>
	
	<span class="sub_tt">수취인 정보</span>&nbsp; <span class="call" onclick="call()">불러오기</span>
	<table border=1 width=100% class="table_box">
		<tr>
			<td width=120 align=right style="background-color:#f4f4f4;"><b>이름</b></td>
			<td><input type="text" name="re_name" id="re_name" style="margin: -2px 4px;" value="${dtn.names }"></td>
		</tr>
		<tr>
			<td align=right style="background-color:#f4f4f4;"><b>배송주소</b></td>
			<td>
				<input type="text"  name="re_zip" id="sample6_postcode" value="${dtn.zip }" placeholder="우편번호" style="width: 150px; margin-top: -2px"> &nbsp;
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="margin-top: -2px"; width: 90px; font-size: 12px; background-color:#007a48; color:white; border-radius: 3px;"><br>
				<input type="text"  name="re_addr1" id="sample6_address"  value="${dtn.addr1 }" placeholder="주소" style="width:500px;"><br>
				<input type="text"  name="re_addr2" id="sample6_detailAddress" value="${dtn.addr2 }"  placeholder="상세주소" style="width:500px; margin-bottom: -2px">
				<input type="text" id="sample6_extraAddress" placeholder="참고항목" style="margin-bottom: -2px">
			</td>
		</tr>
		<tr>
			<td height=40 align=right style="background-color:#f4f4f4;"><b>연락처</b></td>
			<td><input type="text" id="re_phone" name="re_phone" value="${dtn.tel}" style="margin: -2px 4px; width: 200px"><font color="gray" size="2px">("-"없이 숫자만 입력하세요.)</font></td>
		</tr>
		<tr>
			<td height=40 align=right style="background-color:#f4f4f4;"><b>배송요청사항</b></td>
			<td><input type="text" name="re_rq" id="re_rq" value="" style="margin: -2px 4px; width: 500px" placeholder="30자 내외로 작성해주세요."></td>
		</tr>
	</table>
	
	<span class="sub_tt">결제요청 <font color="#007a48"><b>${amount}</b></font>건</span><input type=hidden name="od_count" id="od_count" value="${amount}">
	<table border=1 width=100% class="table_box">
		<tr>
			<td width=120 align=right style="background-color:#f4f4f4;"><b>도착예정</b></td>
			<td><font color="gray">상품 내용에 따라 차이가 있으며 자세한 사항은 주문내역에서 확인 가능합니다.</font></td>
		</tr>
		<tr>
			<td width=120 align=right style="background-color:#f4f4f4;"><b>주문정보</b></td>
			<td>
				<table>
					
					<tr>
						<td>${pay.it_name}</td>
						<td>${pay.od_amount}개 <input type="hidden" name="it_uid" id="it_uid" value="${pay.it_uid}"></td>
						<td width=400 align=right>배송서비스:
							<c:choose>
								<c:when test="${pay.od_dvr == 'Y'}">Yes</c:when>
								<c:otherwise>No</c:otherwise>
							</c:choose>
						</td>
					</tr>
				
				</table>
			</td>
		</tr>
	</table>

	<span class="sub_tt">결제정보</span>
	<table border=1 width=100% class="table_box">
		<tr>
			<td width=120 align=right style="background-color:#f4f4f4;"><b>총상품가격</b></td>
			<td>${tp.totalPrice}원 <input type="hidden" name="tp_od" id="tp_od" value="${tp.totalPrice}"></td>
		</tr>
		<tr>
			<td align=right style="background-color:#f4f4f4;"><b>마이 포인트</b></td>
			<td>
				<input type="text" id="cur_point" name="cur_point" value="${pay.point}" readonly style="width:100px; text-align:right;"> Point<br>
				사용할 포인트: <input type="text" id="point_use" name="point_use" value="${pay.point }" style="width:100px; text-align:right;">Point &nbsp; 
				<input type="button" class="point_btn" id="point_btn" onclick="aaaa(cur_point.value, point_use.value, totalPay.value)" value="포인트 적용">
			</td>
		</tr>	
		<tr>
			<td align=right style="background-color:#f4f4f4;"><b>배송비</b></td>
			<td>
				${tp.deliveryPrice}원 &nbsp;<font color="gray" size="1px">*주문 시 총 주문금액이 20000원 이상인 경우, 무료배송</font>
				<input type="hidden" name="tp_dvr" id="tp_dvr" value="${tp.deliveryPrice}">
			</td>
			
		</tr>
		<tr>
			<td align=right style="background-color:#f4f4f4;"><b>총결제금액</b></td>
			<td>
				<span style="font-size:19px; font-weight:bold; color:#007a48;">&#8361;</span><input id="totalPay" name="totalPay" value="${tp.totalPrice + tp.deliveryPrice}" readonly> &nbsp;
				<span style="margin-left:-50px;"><input id="point_use2" name="point_use2" value="" readonly></span>
			</td>
		</tr>
		<tr>
			<td rowspan=2 height=40 align=right style="background-color:#f4f4f4;"><b>결제방법</b></td>
			<td>
				<div style="display:flex;">
					<div style="width:160px;">
					    <div>
					        <div class="menu">
					            <a><input type="radio" id="directpay" name="payway" value="무통장입금"></a>무통장입금
					            <div class="hide">
					                <div class="nba">
					                	<b>은행선택:</b> 
					                	<select style="margin-bottom:5px;" id="paybank" name="paybank">
					                		<option value="">==선택==</option>
					                		<option value="국민"> 국민은행 </option>
					                		<option value="신한"> 신한은행 </option>
					                		<option value="우리"> 우리은행 </option>
					                	</select>
					                	<hr style="margin:2px 0px;">
					                	<b>입금기한:</b> <input name="exp_time" id="exp_time" value="${tm.time2 }"><span class="exp">까지</span><br>
										
										<p style="margin-top: 10px;">
											<font color="gray" size="1px">
												* 현금으로 결제한 모든 금액은 해당 은행과 채무지급보증계약을 체결하여 고객님의 안전거래를 보장하고 있습니다.
											</font>
										</p><br>
										<ul style="font-size:11px; color:gray; line-height:20px;">
											<p>&nbsp;<b>무통장입금 시 유의사항</b></p>
											<li>-입금완료 후 상품품절로 인해 자동취소된 상품은 환불 처리해 드립니다.</li>
											<li>-무통장입금 결제 시 부분취소가 불가하며 전체취소 후 다시 주문하시기 바랍니다.</li>
											<li>-은행 이체 수수료가 발생될 수 있습니다. 입금시 수수료를 확인해주세요.</li>
										</ul>
					                </div>
					            </div>
					        </div>
					     </div>
					</div>
					 <div style="width:120px;">
					    <div>
					        <div class="menu2">
					            <a><input type="radio" id="kakao" name="payway" value="카카오페이"></a>카카오페이
					            <div class="hide">
					                <div class="kakao">
					                	<img src="/img/kkpay.png" width="100px;">
					                	<p>카카오페이로 간편결제를 경험해보세요.</p>
					                	<b>클릭>></b> <button type="button" class="kbtn" style="cursor:pointer;" onclick="go()">결제하기</button>
					                </div>
					            </div>
					        </div>
					    </div>
					</div>
				</div>
			</td>
		</tr>
	</table>
	<div class="btn_ctn">
		<div class="btn1"><a href="/item/list" class="atag">계속 쇼핑하기</a></div>
			<button class="btn2">결제하기</button>
	</div>
</div>
</form>

<script>

function ok(){
	
	if (!$("input:radio" ).is( ":checked")){
		alert("결제방법을 선택해주세요.");
		return false;
	}	
	
	if($('input:radio[id=directpay]').is(':checked')){
		if (!$("#paybank").val()){
			alert("입금은행을 선택해주세요.");
			return false;
		}
	}
	
// 	if($('input:radio[id=kakao], .btn').is(':checked')){
// 			alert("카카오페이 결제 버튼을 클릭하세요.");
// 			return false;
// 	}
}

function go(){
 	alert("kakaoPay 결제 페이지로 이동합니다.");
	
  	var od_count = $("#od_count").val();
  	
  	var totalPay = $("#totalPay").val();
//  	alert(totalPay);

 	$.ajax({
 		url: "/item/kakaoPay",
 		type: "post",
 		data: {"od_count" : od_count, "totalPay" : totalPay},
 		dataType: "json",
 		success: function(data){
 		//	alert(data);
 			var box = data.next_redirect_pc_url;
 			window.open(box, "카카오페이", "width=500 , height=600");
 		},
 		error: function(error){
 			alert(error);
 		}
 	});	
}


function aaaa(cur_point, point_use, totalPay){
//	alert(totalPay);
	var changes = cur_point - point_use;
	var totalPay2 = totalPay - point_use;
	var od_num = ${pay.od_num};
	
	
	if(point_use < 0){
		alert("사용할 포인트 금액이 -값은 안됩니다.");
		return;
	}
	if(changes < 0){
		alert("현재 포인트보다 사용할 포인트가 클 수 없습니다.");
		return;
	}
	if(totalPay2 < 0){
		alert("사용할 포인트가 총 결제금액보다 클 수 없습니다.");
		return;
	}
//	alert(totalPay2);
//	alert(od_num);
	
	point_use = ${tp.totalPrice + tp.deliveryPrice} - totalPay2;
	
	document.getElementById("cur_point").value = changes;
	document.getElementById("totalPay").value = totalPay2;
	document.getElementById("point_use2").value = "("+point_use+" Point 사용)";
	
	$.ajax({
		url: "/item/updatePoint",
		type: "post",
		data: {"point" : changes, "od_num" : od_num},
		dataType: "text",
		success: function(result){
			location.reload();
		}
	});
}


/*
 $("#point_btn").click(function(){
	var cur_point = $("#cur_point").val();
	var point_use = $("#point_use").val();
	var changes = cur_point - point_use;
	
	if(point_use > "${pay.point}"){
		alert("보유 포인트a: "+cur_point);
		alert("적용 포인트a: "+point_use);
		alert("잔여 포인트a: "+changes);
		
		alert("사용가능한 포인트를 초과했습니다.");
		$("#cur_point").val(cur_point);
		$("#point_use").val(cur_point);
		
	}else if(point_use < 0){
		alert("포인트 사용은 0보다 작을 수 없습니다.");
		$("#cur_point").val(cur_point);
		$("#point_use").val(cur_point);
		
	}else{
		alert("보유 포인트c: "+cur_point);
		alert("적용 포인트c: "+point_use);
		alert("잔여 포인트c: "+changes);
		
		$("#cur_point").val(changes);
		$("#point_use").val(changes);
	}
});
*/
</script>

<style>
	ul {list-style:none;}
    .menu a{cursor:pointer;}
    .menu .hide{display:none;}
    .menu2 a{cursor:pointer;}
    .menu2 .hide{display:none;}
</style>


<script>
	$(".menu>div").slideUp();
	$(".menu2>div").slideUp();
	
    // html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".menu>a").change(function(){
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( $(".menu>div").is(":visible") ){
            	$(".menu>div").slideUp();
                $(".menu2>div").slideDown();
            }else if($(".menu>div").is(":hidden")){
            	$(".menu>div").slideDown();
                $(".menu2>div").slideUp();
            }
            
        });
		$(".menu2>a").change(function(){
        	
            var submenu = $(this).next("div");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
                $(".menu>div").slideDown();
            }else if(submenu.is(":hidden")){
                submenu.slideDown();
                $(".menu>div").slideUp();
            }
        });
    });
</script>



<!--주소 api-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
    
<%@ include file="/WEB-INF/views/include/footer.jsp" %>