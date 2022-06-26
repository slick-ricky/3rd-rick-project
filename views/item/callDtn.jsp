<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 불러오기</title>

<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>

</head>
<body>

<style>
	table, td {
		border-collapse: collapse;
		padding: 5px;
	}

	.my_dtn2 {
		margin-top: 20px;
		margin-left: 5px;
		width: 660px;
		min-height: 255px;
		border: 0px solid lightgray;
		text-align: left;
		font-size: 15px;
		font-weight: normal;
		line-height: 25px;
	}
	
	.apply {
		cursor: pointer;
		float: right;
		color: #007a48;
		font-weight: bold;
		padding-right: 5px; 
	}
	
	.aa {
		background: lightgray;
		text-align: center;
		font-weight: bold;
	}
</style>

<script>
function aaa(uid){
//alert(popup.names.value);	
	var aa = $("#names"+uid).val();
	var bb = $("#zip"+uid).val();
	var cc = $("#addr1"+uid).val();
	var dd = $("#addr2"+uid).val();
	var ee = $("#tel"+uid).val();
	opener.order.re_name.value = aa;
	opener.order.sample6_postcode.value = bb;
	opener.order.sample6_address.value = cc;
	opener.order.sample6_detailAddress.value = dd;
	opener.order.re_phone.value = ee;
	window.close();
	
	
// 	$.ajax({
// 		url: "/item/setDtn",
// 		type: "post",
// 		data: {"uid" : uid},
// 		dataType: "text",
// 		success: function(result){
// 			window.close();
// 		}	
// 	});
}

</script>

<div class="my_dtn2">
	
	<c:forEach var="dtn" items="${dtn }">
		<table style="font-size:13px;" border=1>
			<tr>
				<td width=50 class="aa">이름</td>
				<td width=600><input id ="names${dtn.uid }" name ="names" value="${dtn.names }" style="width:70px; border:none"><span class="apply" onclick="aaa(${dtn.uid})">[적용하기]</span></td>
			</tr>
			<tr>
				<td width=50 class="aa">주소</td>
				<td>
					<input id ="zip${dtn.uid }" name ="zip" value="${dtn.zip }" style="width:70px; border:none"><br>
					<input id ="addr1${dtn.uid }" name ="addr1" value="${dtn.addr1 }" style="width:300px; border:none"><br>
					<input id ="addr2${dtn.uid }" name ="addr2" value="${dtn.addr2 }" style="width:160px; border:none">
				</td>
			</tr>
			<tr>
				<td width=50 class="aa">연락처</td>
				<td><input id ="tel${dtn.uid }" name ="tel" value="${dtn.tel }" style="width:200px; border:none"></td>
			</tr>
		</table><br>
	</c:forEach>
	
</div>

</body>
</html>