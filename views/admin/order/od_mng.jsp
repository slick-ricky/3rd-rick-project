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
		min-height: 500px;
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
		height: 25px;
	}
	
	.row1 {
		font-weight: bold;
		background: #717984;
		color: white;
		height: 25px;
	}
	
	.row2 {
		text-align: center;
		height: 30px
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
	
	.detail_btn {
		font-size: 10px;
		cursor: pointer;
	}
	.tc {
		margin: 10px 0px;
	}
	
	.r1 {
		background: #f2f2f2;
		width: 200px;
		height: 30px;
	}

	.r2 {
		padding-left: 15px;
		width: 300px;
		height: 30px;
	}
	
	.c1 {
		border-collapse: collapse;
		border: 1px solid lightgray;
		margin-bottom: 20px;
	}
	
	.b1 {
		margin-top: 20px;
		margin-bottom: 10px;
		background-color: #666666;
		color: white;
		height: 24px;
		font-size: 13px;
		font-weight: bold;
		border-radius: 5px;
		cursor: pointer;
	}
	
	.b1:hover {
		margin-top: 20px;
		margin-bottom: 10px;
		background-color: lightgray;
		color: white;
		height: 24px;
		font-size: 13px;
		font-weight: bold;
		border-radius: 5px;
		cursor: pointer;
		border:none;
	}
</style>

<main>

<div class="title"><b>주문관리</b></div>

<div class="mng_ctn">
	<form action="/admin/order/od_mng" method="get">
	<table border=1 width=100% class="c1">
		<tr>
			<td class="r1">주문상태</td>
			<td class="r2">
				<select name="od_status" id="od_status" onchange="this.form.submit()">
					<option value="" <c:if test="${param.od_status eq ''}">selected</c:if>>===전체===</option>
					<option value="입금대기중" <c:if test="${param.od_status eq '입금대기중'}">selected</c:if>>입금대기중</option>
					<option value="상품준비중" <c:if test="${param.od_status eq '상품준비중'}">selected</c:if>>상품준비중</option>
					<option value="배송출발" <c:if test="${param.od_status eq '배송출발'}">selected</c:if>>배송출발</option>
					<option value="배송완료" <c:if test="${param.od_status eq '배송완료'}">selected</c:if>>배송완료</option>
					<option value="주문취소" <c:if test="${param.od_status eq '주문취소'}">selected</c:if>>주문취소</option>
					<option value="반품" <c:if test="${param.od_status eq '반품'}">selected</c:if>>반품</option>
				</select>
			</td>
			<td class="r1">주문날짜</td>
			<td class="r2"><input type="text" name="od_date" value="${param.od_date}" style="width:160px; text-align: right; padding-right: 5px"></td>	
		</tr>
		<tr>
			<td class="r1">주문번호</td>
			<td class="r2"><input type="text" name="od_group" value="${param.od_group}" style="width:130px; text-align: right; padding-right: 5px"></td>
			<td class="r1">주문자명</td>
			<td class="r2">
				<input type="text" name="names" value="${param.names}" style="width:130px; text-align: right; padding-right: 5px">
				<input type="submit" style="display: none">
			</td>
		</tr>
	</table>
	</form>

<script>
$(document).ready(function(){
	$(".row2 input[type=checkbox]").on("change", function(){
		var check = "-1";
		if($(this).is(":checked")){check = "1";}else{check = "0";}
//		alert(check);
		var od_group = $(this).attr("value");
//		alert(od_group);
		var data = {"checked":check, "od_group":od_group};
		$.ajax({
			url:"/admin/order/orderCheck",
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
	$(".row1 input[type=checkbox]").on("change", function(){
		var checkAll = "-1";
		if($(this).is(":checked")){
			$(".row2 input[type=checkbox]").prop("checked", true);
			checkAll = "1";
		}else{
			$(".row2 input[type=checkbox]").prop("checked", false);
			checkAll = "0";
		}
//		alert(checkAll);
		$.ajax({
			url:"/admin/order/checkAll",
			type:"post",
			data:{"checkAll": checkAll},
			dataType:"text",
			success:function(result){
				location.reload();
			}
		});
	});
});

function prepare(){
	$.ajax({
		url:"/admin/order/prepare",
		type:"post",
		data:{},
		dataType:"text",
		success:function(result){
			location.reload();
		}
	});
}

function start(){
	$.ajax({
		url:"/admin/order/start",
		type:"post",
		data:{},
		dataType:"text",
		success:function(result){
			location.reload();
		}
	});
}

function complete(){
	$.ajax({
		url:"/admin/order/complete",
		type:"post",
		data:{},
		dataType:"text",
		success:function(result){
			location.reload();
		}
	});
}
</script>

	
	<p class="tc">총 주문수: <b><font color="#007a48">${total}</font></b> 
		<button class="b1" style="width:82px; margin-left:10px;" onclick="prepare()">상품준비중</button>
		<button class="b1" style="width:70px; margin-left:10px;" onclick="start()">배송출발</button>
		<button class="b1" style="width:70px; margin-left:10px;" onclick="complete()">배송완료</button>
	</p>
	
	<table border=1 width=100%>
		<tr>
			<td class="row1" align=center width="40"><input type="checkbox" name="checked" id="checked" value="" <c:if test="${allCheck eq 'Y'}">checked</c:if>></td>
			<td class="row1" width="180" align=center>주문날짜</td>
			<td class="row1" align=center>주문번호</td>
			<td class="row1" align=center>주문자명</td>
			<td class="row1" align=center width="120">주문방법</td>
			<td class="row1" width="170" align=center>주문금액</td>
			<td class="row1" width="160" align=center>주문상태</td>
			<td class="row1" width="130" align=center>기능</td>
		</tr>
		<c:forEach var="list" items="${list}">
		<tr>
			<td class="row2" align=center><input type="checkbox" name="checked" id="checked" value="${list.od_group }" <c:if test="${list.checked eq 'Y'}">checked</c:if>></td>
			<td class="row2">${list.od_date }</td>
			<td class="row2">${list.od_group }</td>
			<td class="row2">${list.names}</td>
			<td class="row2">${list.payway }</td>
			<td align=right style="padding-right: 40px;">${list.totalPay }원</td>
			<td class="row2">
				<select class="status" onchange="aaa(${list.od_group },this.value)">
					<option <c:if test="${list.od_status eq '입금대기중'}">selected </c:if>>입금대기중</option>
					<option <c:if test="${list.od_status eq '상품준비중'}">selected </c:if>>상품준비중</option>
					<option <c:if test="${list.od_status eq '배송출발'}">selected </c:if>>배송출발</option>
					<option <c:if test="${list.od_status eq '배송완료'}">selected </c:if>>배송완료</option>
					<option <c:if test="${list.od_status eq '주문취소'}">selected </c:if>>주문취소</option>
					<option <c:if test="${list.od_status eq '반품'}">selected </c:if>>반품</option>
				</select>
			</td>
			<td class="row2">
				<button class="apply_btn">적용</button> &nbsp;
				<a href="/admin/order/od_detail?od_group=${list.od_group }"><button class="detail_btn" value="this">상세보기</button></a>
			</td>
		</tr>
		</c:forEach>
	</table>
	
</div>

<script>
function aaa(od_group, val){
//	alert("od_group="+od_group+" : val="+val);
	var od_status = val;
//		alert(od_status);
	
	$(".apply_btn").on("click", function(){
//		alert(od_status+","+od_group);
	
		$.ajax({
			url: "/admin/order/orderStatus",
			type: "post",
			data: {"od_status" : od_status, "od_group" : od_group},
			dataType: "text",
			success: function(result){
				location.reload();
			}
		});
	});
}
</script>

</script>

<style>
.paging{
	border: 0px solid black;
	margin: auto;
	margin-top: 20px;
	font-size: 15px;
	font-weight: normal;
	letter-spacing: 8px;
}

.p1 {
	border: 0px;
}

</style>

<!-- 페이징 추가 -->
<table border=1 class="paging">
	<tr>
		<c:if test="${pageMaker.prev}">
			<td class="p1"><a href="/admin/order/od_mng${pageMaker.makeQuery(pageMaker.startPage - 1)}&od_status=${param.od_status }&od_date=${param.od_date }&od_group=${param.od_group }&names=${param.names }">&laquo;</a></td>
		</c:if>

		<c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
			<td class="p1">
				<c:if test="${pageMaker.cri.page == idx}"><b></c:if>
				<a href="/admin/order/od_mng${pageMaker.makeQuery(idx)}&od_status=${param.od_status }&od_date=${param.od_date }&od_group=${param.od_group }&names=${param.names }">${idx}</a>
				<c:if test="${pageMaker.cri.page == idx}"></b></c:if>
			</td>
		</c:forEach>

		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<td class="p1"><a href="/admin/order/od_mng${pageMaker.makeQuery(pageMaker.endPage +1)}&od_status=${param.od_status }&od_date=${param.od_date }&od_group=${param.od_group }&names=${param.names }">&raquo;</a></td>
		</c:if>
	</tr>
</table>

</main>

<%@ include file="/WEB-INF/views/admin/include/footer.jsp" %>