<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<script src="//code.jquery.com/jquery.min.js"></script>

<style>
	html, body {
	margin: 0;
	padding: 0;
}

	.btn {
		width:500px;
		height: 60px;
		color: white;
		background: #3a1d1d;
		font-size: 20px;
		font-weight: bold;
	}
</style>



<div style="min-height:750px; background:#ffdf00; padding-bottom:120px;">

	<div style="margin-left:30%; padding-top:120px; margin-bottom: 30px;">
		<img src="/img/kk3.png" width=100>
		<div style="color:black; margin-top:-43px; margin-left: 200px; font-size:25px; font-weight:bold; color:#181818;">카카오페이에 오신 것을 환영합니다.</div>
	</div>
	<div style="margin-left:37%; margin-top:0px; margin-bottom:40px;"><img src="/img/kk3.jpg"></div>
	<div style="margin-left:37%;"><button class="btn" onclick="kk()" style="cursor:pointer;">카카오페이 진행하기</button></div>

</div>

<script>
function kk(){
// 	alert("kakaoPay 결제 페이지로 이동합니다.");

 	var od_count = "${param.od_count}";
 	var totalPay = "${param.totalPay}";
//	alert(totalPay);

 	$.ajax({
 		url: "/item/kakaoPay",
 		type: "post",
 		data: {"od_count" : od_count, "totalPay" : totalPay},
 		dataType: "json",
 		success: function(data){
 		//	alert(data);
 			var box = data.next_redirect_pc_url;
 			window.open(box);
 		},
 		error: function(error){
 			alert(error);
 		}
 	});	
}
</script>



<%@ include file="/WEB-INF/views/include/footer.jsp" %>