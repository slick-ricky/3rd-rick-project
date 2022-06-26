<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>

<style>
	main {
		min-height: 600px;
	}
	
	.title {
		margin-left: 20.5%;
		margin-block-start: 30px;
		height: 80px;
		font-size: 27px;
		font-weight: bold;
	}
	
	.mng_ctn {
		margin: auto;
		width: 1100px;
		border: 0px solid lightgray;
		font-size: 13px;
	}
	
	.mng_ctn > table{
		border-spacing: 0;
		border-collapse: collapse;
		border: 1px solid lightgray;
	}
	
	td {
		padding-left: 5px;
		height: 30px;
	}
	
	.row1 {
		font-weight: bold;
		background: #717984;
		color: white;
	}
	
	.row2 {
		text-align: center;
	}
	
	.row3 {
		background: #f2f2f2;
		padding-left: 20px;
	}
	
	.row4 {
		padding-left: 20px;
	}
	
	.row5 {
		background: #f2f2f2;
	}
	
	.apply_btn {
		font-size: 11px;
		background: #539fdd;
		width: 30px;
		height: 17px;
		border-radius: 2px;
		color: white;
		border: none;
		outline: none;
		cursor: pointer;
	}
	
	.tc {
		margin: 10px 0px;
	}
	
	.total {
		text-align: right;
		margin-bottom: 50px;
		font-size: 15px;
	}
	
	.od_handle {
		border-spacing: 0;
		border-collapse: collapse;
		border: 1px solid lightgray;
		width: 900px;
	}
	
	.btn2 {
		width: 120px;
		height: 40px;
		color: white;
		background-color: #007a48;
		font-weight: bold;
		margin-left: 46%;
		margin-top: 80px;
		margin-bottom: 50px;
		text-align: center;
		font-size: 18px;
		cursor: pointer;
	}
	
	.tc {
		margin: 10px 0px;
		font-size: 17px;
		font-weight: bold;
	}
</style>

<main>

<div class="title"><b>주문상세내역</b></div>

<div class="mng_ctn">
	<p class="tc">주문상품리스트</p>
	<table border=1 width=100% style="margin-bottom:10px;">
		<tr>
			<td class="row1" align=center width="150">상품고유코드</td>
			<td class="row1" align=center width="70">이미지</td>
			<td class="row1" align=center width="100">상품가격</td>
			<td class="row1" align=center width="80">상품온도</td>
			<td class="row1" align=center width="50">사이즈</td>
			<td class="row1" align=center width="50">수량</td>
			<td class="row1" align=center width="180">요청사항</td>
			<td class="row1" align=center width="50">배송</td>
			<td class="row1" align=center width="50">취소하기</td>
		</tr>
		<c:forEach var="detail" items="${detail }">
		<tr>
			<td class="row2">${detail.od_num }</td>
			<td class="row2"><img src="/upload/${detail.file1 }" width="50" height="50"></td>
			<td align=right style="padding-right: 40px;">${detail.od_price }원</td>
			<td class="row2">
				<c:if test="${detail.od_hot eq 'Y'}">Hot</c:if>
				<c:if test="${detail.od_hot eq 'N'}">Ice</c:if>
			</td>
			<td class="row2">${detail.od_size }</td>
			<td class="row2">${detail.od_amount }</td>
			<td class="row2" style="text-align:left; padding-left:1%;">${detail.od_request }</td>
			<td class="row2">${detail.od_dvr}</td>
			<td class="row2">
				<button class="apply_btn">취소</button>
			</td>
		</tr>
		</c:forEach>
	</table>
	
	<div class="total">
		상품합계<font color="#539fdd"><b>(${ordered.tp_od }원)</b></font> + 배송비<font color="#539fdd"><b>(${ordered.tp_dvr }원)</b></font> - 적용한 포인트<font color="#539fdd"><b>${ordered.point_use2 }<c:if test="${ordered.point_use2 eq ''}">(0 Point 사용)</c:if></b></font> = 총 결제금액<font color="#539fdd"><b>(${ordered.totalPay}원)</b></font>
	</div>
	
	<p class="tc">주문정보</p>
	<table border=1 width=100% style="margin-bottom: 50px;">
		<tr>
			<td class="row3" width=150>주문번호</td>
			<td class="row4" width=370>${ordered.od_group }</td>
			<td class="row3" width=150>결제방법</td>
			<td class="row4">${ordered.payway }</td>
		</tr>
		<tr>
			<td class="row3">주문일자</td>
			<td class="row4">${ordered.od_date }</td>
			<td class="row3">입금만료일</td>
			<td class="row4">${ordered.exp_time }</td>
		</tr>
		<tr>
			<td class="row3">입금은행</td>
			<td class="row4">${ordered.paybank }은행</td>
			<td class="row3">처리상태</td>
			<td class="row4">${ordered.od_status }</td>
		</tr>
		<tr>
			<td class="row3" style="height:100px;">처리시간</td>
			<td class="row4" colspan=3 style="height:100px;">
				<table border=1 class="od_handle">
					<tr>
						<td class="row5" align=center>주문접수</td>
						<td class="row5" align=center>결제완료</td>
						<td class="row5" align=center>배송출발</td>
						<td class="row5" align=center>배송완료</td>
						<td class="row5" align=center>주문취소</td>
						<td class="row5" align=center>반품</td>
					</tr>
					<tr>
						<td width=95 align=center>${ordered.od_date }</td>
						<td width=95 align=center>${time.pay_done}</td>
						<td width=95 align=center>${time.delivering}</td>
						<td width=95 align=center>${time.dvr_done}</td>
						<td width=95 align=center>${time.od_cancel}</td>
						<td width=95 align=center>${time.it_refund}</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<p class="tc">주문자정보</p>
	<table border=1 width=100% style="margin-bottom:50px;">
		<tr>
			<td class="row3" width=150>주문자명</td>
			<td class="row4" width=370>${orderer.names }</td>
			<td class="row3" width=150>이메일</td>
			<td class="row4">${orderer.email }</td>
		</tr>
		<tr>
			<td class="row3">연락처</td>
			<td class="row4">${orderer.tel }</td>
			<td class="row3">보유포인트</td>
			<td class="row4">${orderer.point }</td>
		</tr>
	</table>
	
	<p class="tc">수취인정보</p>
	<table border=1 width=100%>
		<tr>
			<td class="row3" width=150>수취인명</td>
			<td class="row4" width=370>${ordered.re_name }</td>
			<td class="row3" width=150>연락처</td>
			<td class="row4">${ordered.re_phone }</td>
		</tr>
		<tr>
			<td class="row3">우편번호</td>
			<td class="row4" colspan=3>${ordered.re_zip }</td>
		</tr>
		<tr>
			<td class="row3">배송지주소</td>
			<td class="row4" colspan=3>${ordered.re_addr1 }${ordered.re_addr2 }</td>
		</tr>
		<tr>
			<td class="row3">요청사항</td>
			<td class="row4" colspan=3>${ordered.re_rq}</td>
		</tr>
	</table>
	
</div>

<button class="btn2" type="button" onClick="location.href='/admin/order/od_mng'">주문목록</button>


</main>

<%@ include file="/WEB-INF/views/admin/include/footer.jsp" %>