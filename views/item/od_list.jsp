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
	height: 130px;
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
	line-height: 20px;
	margin-left:10px;
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

</style>


<h2 class="tt_2">주문목록/배송조회</h2>

<c:forEach var="list" items="${list}">
<div class="od_date">주문시간: ${list.od_date } / 주문번호: ${list.od_group}
	<a href="/item/od_detail?od_group=${list.od_group}"><span style="color:#007a48; float:right; font-size:13px; margin-right:10px; cursor:pointer;">주문 상세 보기>></span></a>
</div>

<div class="od_ctn">
	<c:if test="${list.payway eq '무통장입금'}">
		<font color="#007a48" size="3px">${list.od_status }
			<c:if test="${list.pay_done eq null}">
				(${list.exp_time}까지 입금)
			</c:if>
		</font>
	</c:if>
	<c:if test="${list.payway eq '카카오페이'}">
		<font color="#007a48" size="3px">${list.od_status }</font>
	</c:if>
	<div style="display:flex; margin-top:10px;">
		<div style="width:70px; height:70px; border:1px solid black;"><img src="/upload/${list.file1}" width="100%" height="100%"></div>
		<div class="od_info">
			<div style="margin-bottom: 10px;">(${list.it_name } 포함) 총 ${list.od_count}건</div>
			<div>총 결제금액: ${list.totalPay}원
			</div>
			<div>
				<c:choose>
					<c:when test="${list.od_status eq '배송완료'}">
						<c:choose>
							<c:when test="${list.review ne 'Y'}">
								<a href="/mypage/item_review?od_group=${list.od_group}"><button class="review_btn">리뷰 작성하기</button></a>
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<button class="cancel_btn" onclick="aaa(${list.od_group })">주문취소</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>
<br>
</c:forEach>

<script>
function aaa(od_group){
	alert("해당 주문이 취소됩니다.");
	
	$.ajax({
		url: "/item/od_dlt",
		type: "post",
		data: {"od_group" : od_group},
		dataType: "text",
		success: function(result){
			location.reload();
		}
	});
}
</script>


<%@ include file="/WEB-INF/views/include/nav_footer.jsp" %>
