<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<style>
.tt {
	margin-left: 24%;
	margin-block-start: 30px;
	margin-block-end: -20px;
	height: 70px;
	font-size: 27px;
	font-weight: bold;
}

.ctn {
	margin: auto;
	margin-block-start: -20px;
	margin-block-end: 50px;
	padding-top: 35px;
	width: 1000px;
	border-top: 2px solid lightgray;
	font-size: 14px;
}

.b1 {
	border: 1px solid lightgray;
	width: 400px;
	margin: auto;
	margin-block-start: 20px;
	padding: 15px;
	line-height: 30px;
}

.ctn2 {
	border: 0px solid black;
	margin-block-start: 55px;
	display: flex;
	justify-content: center;
}

.b2 {
	border-top: 1px solid lightgray;
	border-right: 0px solid lightgray;
	border-bottom: 1px solid lightgray;
	border-left: 0px solid lightgray;
	width: 400px;
	padding: 15px;
}

.b3 {
	border-top: 1px solid lightgray;
	border-right: 0px solid lightgray;
	border-bottom: 1px solid lightgray;
	border-left: 1px solid lightgray;
	width: 400px;
	padding: 15px;
}

.re {
	font-size: 18px;
	font-weight: bold;
}

.re_table {
	line-height: 20px;
	border: 0px solid gray;
}

.cl {
	color: gray;
	font-size: 12px;
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
	color: white;
}
</style>

<div class="tt"><b>주문완료</b></div>

<div class="ctn">
	<div style="margin-bottom:15px;">
		<c:if test="${ordered.payway ne '카카오페이'}">
			<div style="font-size: 20px; color: #007a48; text-align: center;"><b>상품이 품절될 수 있습니다.</b></div><br>
			<div style="font-size: 20px; text-align: center;">입금을 서둘러 주세요!</div>
			<div class="b1">
				<p style="text-align:center;">
				<b>${ordered.paybank}은행</b><br>
				<c:if test="${ordered.paybank eq '우리'}">
					<b>100-100-100000</b>
				</c:if>
				<c:if test="${ordered.paybank eq '국민'}">
					<b>200-200-200000</b>
				</c:if>
				<c:if test="${ordered.paybank eq '신한'}">
					<b>300-300-300000</b>
				</c:if>
				</p>
				<p style="text-align:center;"><font color="#007a48"><b>${ordered.exp_time}</b></font>까지 미입금 시 취소</p>
			</div>
		</c:if>
		<c:if test="${ordered.payway eq '카카오페이'}">
			<div style="margin-left: 22%; font-weight:bold; font-size:20px;">
				<img src="/img/kkpay2.jpg" width=100>
				<div style="margin-top:-50px; margin-left:100px;">카카오페이 결제로 구매가 완료되었습니다.</div>
			</div>
		</c:if>
	</div>
	<div class="ctn2">
		<div class="b2">
			<p class="re">수취인 정보</p><br>
			<table width=100% class="re_table">
				<tr>
					<td width=110>받는사람</td>
					<td class="cl">${ordered.re_name }</td>
				</tr>
				<tr>
					<td>받는주소</td>
					<td class="cl">(${ordered.re_zip})&nbsp;${ordered.re_addr1}&nbsp;${ordered.re_addr2}</td>
				</tr>
				<tr>
					<td>배송요청사항</td>
					<td class="cl">${ordered.re_rq }</td>
				</tr>
			</table>
		</div>
		<div class="b3">
			<p class="re">결제 정보</p><br>
			<table width=100% class="re_table">
				<tr>
					<td width=110>주문금액</td>
					<td align=right class="cl">${ordered.tp_od}원</td>
				</tr>
				<tr>
					<td>배송비</td>
					<td align=right class="cl">${ordered.tp_dvr}원</td>
				</tr>
				<tr>
					<td colspan=2 height=20><div style="border-top:1px solid lightgray; width:365px;"></div> </td>
				</tr>
				<tr>
					<td colspan=2 height=30><font size="3.5em"><b>총 결제금액</b></font>  
						<span style="float:right;">
							<font color="#007a48" size="4.2em"><b>${ordered.totalPay}원</b></font> 
							<font color="gray" size="2.2em">${ordered.point_use2}</font>
						</span>
					</td>
				</tr>
				<tr>
					<td colspan=2>
						<font size="1px" color="gray">
							*결제금액이 출금내역과 다른 경우, 은행에서 이체수수료가 부과된 것입니다.<br>
							(해당 은행으로 확인해주세요.)
						</font>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>

<div class="btn_ctn">
	<button class="btn1" type="button" onClick="location.href='/item/od_list'">주문내역 보기</button>
	<div class="btn2"><a href="/item/list?it_category=1" class="atag">쇼핑 계속하기</a></div>
</div>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>