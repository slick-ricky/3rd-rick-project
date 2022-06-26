<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>   



<style>
	main {
		min-height: 600px;
	}
	
	.main_ctn {
		width: 900px;
		border: 1px solid black;
		margin-left: 19%;
		margin-block-start:50px;
		min-height: 500px;
	}
	
	.nav_ctn {
		width: 230px;
		border: 0px solid lightgray;
		margin-left: 30px;
		margin-block-start:50px;
		min-height: 500px;
	}
	
	table, td {
		font-size: 13px;
		border-spacing: 0;
		border:0px solid black;
	}
	
	.dotted {
		border-width:0px 0px 1px 0px; 
		border-style:dotted;
		height: 25px;
	}
</style>

<main>
<div style="display:flex;">
	<div class="main_ctn">
	
		<div style="background:#4b6a7c; color:white; padding:5px 0px 5px 20px; font-weight:bold;">공지사항</div>
		<table width=100% style="margin-bottom:30px;">
			<c:set var="number" value="1"/>
			<c:forEach var="board" items="${board}">
				<tr>
					<td>
						<table width=100% class="dotted">
							<tr>
								<td width=50 align=center>${number}</td>
								<td width=100 align=center>${board.code}</td>
								<td width=450 style="padding-left:30px;">${board.subject }</td>
								<td width=200 align=center>${board.signdate}</td>
								<td width=100 align=center>${board.names}</td>
							</tr>
						</table>
					</td>
				</tr>
			<c:set var="number" value="${number + 1}"/>
			</c:forEach>
		</table>
		
		<div style="background:#587c92; color:white; padding:5px 0px 5px 20px; font-weight:bold;">주문접수</div>
		<table width=100% style="margin-bottom:30px;">
			
			<c:set var="number" value="1"/>
			<c:forEach var="order" items="${order}">
				<tr>
					<td>
						<table width=100% class="dotted">
							<tr>
								<td width=50 align=center>${number}</td>
								<td width=100 align=center>${order.od_group}</td>
								<td width=280  style="padding-left:30px;">${order.it_name} 포함 총 ${order.od_count}건</td>
								<td width=100 align=right style="padding-right:10px;">${order.totalPay}원</td>
								<td width=70 align=center>${order.paybank}</td>
								<td width=200 align=center>${order.od_date}</td>
								<td width=100 align=center>${order.names}</td>
							</tr>
						</table>
					</td>
				</tr>
			<c:set var="number" value="${number + 1}"/>
			</c:forEach>
		</table>
		
		<div style="background:#7899ad; color:white; padding:5px 0px 5px 20px; font-weight:bold;">문의사항</div>
		<table width=100% style="margin-bottom:30px;">
			
			<c:set var="number" value="1"/>
			<c:forEach var="qna" items="${qna}">
				<tr>
					<td>
						<table width=100% class="dotted">
							<tr>
								<td width=50 align=center>${number}</td>
								<td width=100 align=center>
									<c:if test="${qna.gongji eq '2'}">일반글</c:if>
									<c:if test="${qna.gongji eq '3'}">비밀글</c:if>
								</td>
								<td width=450 style="padding-left:30px;">${qna.subject }</td>
								<td width=200 align=center>${qna.signdate}</td>
								<td width=100 align=center>${qna.names}</td>
							</tr>
						</table>
					</td>
				</tr>
			<c:set var="number" value="${number + 1}"/>
			</c:forEach>
		</table>
		
	</div>
	
	<div class="nav_ctn">
		<table style="width:100%; height:100px; border:2px solid lightgray; padding-bottom: 5px;">
			<tr>
				<td>
					<div style="border:0px solid black; width:100px; margin-left:9px; margin-top:5px; margin-bottom: 10px; text-align:center; ">
						<div style="height:25px; border:1px solid lightgray; padding-top:3px; background:#4a6575; color:white;">Today</div>
						<div style="height:35px; border:1px solid lightgray; padding-top:8px; color:#007a48; font-weight:bold;">${today}</div>
					</div>
				</td>
				<td>
					<div style="border:0px solid black; width:100px; text-align:center; margin-top:5px; margin-bottom: 10px; ">
						<div style="height:25px; border:1px solid lightgray; padding-top:3px; background:#6a8da2; color:white;">Total</div>
						<div style="height:35px; border:1px solid lightgray; padding-top:8px; color:#007a48; font-weight:bold;">${total}</div>
					</div>
				</td>
			</tr>
			<tr>
				<td height=25 colspan=2 style="padding-left:5px;"><span style="width:110px; display:inline-block;">오늘 등록한 상품</span>: <span style="margin-left:10px; color:#007a48; font-weight:bold;">${item.d}</span>개</td>
			</tr>
			<tr>
				<td height=25 colspan=2 style="padding-left:5px;"><span style="width:110px; display:inline-block;">총 상품</span>: <span style="margin-left:10px; color:#007a48; font-weight:bold;">${item.e}</span>개</td>
			</tr>
		</table>
		
		<div style="width:100%; height:120px; border:0px solid lightgray; margin-top:30px;">
			<div style="font-size:13px; height:20px; margin-top:5px; padding-left:5px;"><span style="width:110px; display:inline-block;">오늘 결제완료 </span>: <span style="margin-left:10px; color:#007a48; font-weight:bold;">${order2.p }</span>건</div>
			<hr style="border-style:dotted; color:lightgray;">
			<div style="font-size:13px; height:20px; margin-top:5px; padding-left:5px;"><span style="width:110px; display:inline-block;">상품준비 </span>: <span style="margin-left:10px; color:#007a48; font-weight:bold;">${order2.a }</span>건</div>
			<hr style="border-style:dotted; color:lightgray;">
			<div style="font-size:13px; height:20px; margin-top:5px; padding-left:5px;"><span style="width:110px; display:inline-block;">배송중 </span>: <span style="margin-left:10px; color:#007a48; font-weight:bold;">${order2.b }</span>건</div>
			<hr style="border-style:dotted; color:lightgray;">
			<div style="font-size:13px; height:20px; margin-top:5px; padding-left:5px;"><span style="width:110px; display:inline-block;">배송완료 </span>: <span style="margin-left:10px; color:#007a48; font-weight:bold;">${order2.c }</span>건</div>
			<hr style="border-style:dotted; color:lightgray;">
		</div>
	</div>
	
	
</div>



<!-- 데이터 그래프화 작업 보류중...
<div style="width:500px; height:500px; margin-left:20%; margin-top:2%">
<canvas id="chart"></canvas> 
</div>


<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script> 
<script type="text/javascript">

var 
var barChartData = {labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월"], 
					datasets: [{ label: '주문접수', backgroundColor: "#007a48", 
					data: [533, 
					       Math.random()*90000, 
						   Math.random()*90000, 
						   Math.random()*90000, 
						   Math.random()*90000, 
						   Math.random()*90000, 
						   Math.random()*90000 ]}, 
					{label: '주문취소', backgroundColor: "lightgray", 
					 data: [Math.random()*90000, 
						    Math.random()*90000, 
						    Math.random()*90000, 
						    Math.random()*90000, 
						    Math.random()*90000, 
						    Math.random()*90000, 
						    Math.random()*90000] }]};  

window.onload = function() {
	var ctx = $('#chart').get(0).getContext("2d");     

	window.theChart = new Chart(ctx, 
		{type: 'bar', 
		 data: barChartData, 
		 options: {
			 
		 }  
	}); 
} 
</script> 
-->




</main>

<%@ include file="/WEB-INF/views/admin/include/footer.jsp" %> 
