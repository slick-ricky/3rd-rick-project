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
	border: 1px solid lightgray;
	border-radius: 8px;
	margin-left: 80px;
	margin-top: 10px;
	text-align: left;
	font-size: 18px;
	padding: 10px;
}

.od_info {
	border: 0px solid black;
	width: 600px;
	height: 70px;
	font-size: 13px;
	padding: 5px;
	line-height: 25px;
	margin-left:10px;
	margin-bottom: 20px;
}

.cancel_btn {
	float: right;
	margin-top: 0px;
	background-color: #666666;
	color: white;
	width: 70px;
	height: 25px;
	font-size: 13px;
	font-weight: bold;
	border-radius: 5px;
	cursor: pointer;
}

.re_ctn {
	border: 0px solid black;
	width: 700px;
	height: 130px;
	font-size: 13px;
	padding: 5px;
	line-height: 20px;
	margin-left: 80px;
	margin-top: 20px;
}

.re_ctn2 {
	border: 0px solid black;
	width: 700px;
	height: 130px;
	font-size: 13px;
	padding: 5px;
	line-height: 20px;
	margin-left: 80px;
	margin-top: 20px;
	margin-bottom: 100px;
}

.re_info {
	text-align: left;
	font-weight: normal;
}

.re_list {
	width: 300px;
	color: gray;
}

.re_list2 {
	width: 150px;
	color: gray;
}

.priceInfo {
	width: 250px;
	height: 90px;
	background-color: #f5f5f5;
}
</style>

<h2 class="tt_2">주문상세 / 배송조회</h2>

<div class="od_date">주문시간: ${ordered.od_date } / 주문번호: ${ordered.od_group } </div>
<div class="od_ctn">
	<font color="#007a48" size="3px">${ordered.od_status}
		<c:if test="${tr.pay_done eq null}">
			(${ordered.exp_time }까지 입금)
		</c:if>
	</font>
	<c:forEach var="detail" items="${detail}">
		<div style="display:flex; margin-top:10px;">
			<div style="width:70px; height:70px; border:1px solid black;"><img src="/upload/${detail.file1}" width="100%" height="100%"></div>
			<div class="od_info">
				<div>
					${detail.it_name }
					<c:choose>
						<c:when test="${detail.od_hot == 'Y'}">
							(HOT)
						</c:when>
						<c:otherwise>
							(ICE)
						</c:otherwise>
					</c:choose>
				</div>
				<div>${detail.od_amount }개 / ${detail.od_price }원 / ${detail.od_size } / ${detail.od_request }</div>
			</div>
		</div>
	</c:forEach>
	
</div>

<div class="re_ctn">
	<p>수취인 정보</p>
	<hr style="margin: 5px 0px; border: 1px solid black">
	<table class="re_info">
		<tr>
			<td class="re_list">받는사람</td>
			<td>${ordered.re_name}</td>
		</tr>
		<tr>
			<td class="re_list">연락처</td>
			<td>${ordered.re_phone}</td>
		</tr>
		<tr>
			<td class="re_list">받는주소</td>
			<td>${ordered.re_zip} ${ordered.re_addr1}${ordered.re_addr2}</td>
		</tr>
		<tr>
			<td class="re_list">배송요청사항</td>
			<td>${ordered.re_rq}</td>
		</tr>
	</table>
</div>

<div class="re_ctn2">
	<p>결제정보</p>
	<hr style="margin: 5px 0px; border: 1px solid black">
	<div style="display:flex">
		<c:if test="${tr.pay_done eq null}">
			<table class="re_info">
				<tr>
					<td class="re_list2">은행명</td>
					<td style="width:330px">${ordered.paybank}은행</td>
				</tr>
				<tr>
					<td class="re_list2">예금주</td>
					<td>커피킹덤</td>
				</tr>
				<tr>
					<td class="re_list2">계좌번호</td>
					<td>
						<c:if test="${ordered.paybank eq '우리'}">
							100-100-100000
						</c:if>
						<c:if test="${ordered.paybank eq '국민'}">
							200-200-200000
						</c:if>
						<c:if test="${ordered.paybank eq '신한'}">
							300-300-300000
						</c:if>
					</td>
				</tr>
				<tr>
					<td class="re_list2">입금기한</td>
					<td><font color="#007a48">${ordered.exp_time}</font></td>
				</tr>
			</table>
		</c:if>
		
		<c:if test="${tr.pay_done ne null}">
			<table class="re_info" style="width:80%;">
				<tr>
					<td style="padding-left:35%;">카카오페이(결제완료)</td>
				</tr>
			</table>
		</c:if>
		
		<div class="priceInfo">
			<table style="text-align:left; padding-left:5px; width:100%">
				<tr>
					<td class="re_list2">총 주문금액</td>
					<td align=right>${ordered.tp_od}원</td>
				</tr>
				<tr>
					<td class="re_list2">배송비</td>
					<td align=right>${ordered.tp_dvr}원</td>
				</tr>
				<tr>
					<td colspan=2 align=right style="font-size:11px; color:gray;">${ordered.point_use2 }</td>
				</tr>
				<tr>
					<td class="re_list2">총 결제금액</td>
					<td align=right>${ordered.totalPay}원</td>
				</tr>
			</table>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/include/nav_footer.jsp" %>