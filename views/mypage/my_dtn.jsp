<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/nav_header.jsp" %>

<style>
.subtitle {
	color: black;
	font-size: 25px;
	margin-top: -10px;
	margin-bottom: 10px;
}

.my_dtn {
	margin-top: 20px;
	margin-left: 50px;
	width: 660px;
	height: 255px;
	border: 0px solid lightgray;
	text-align: left;
	font-size: 15px;
	font-weight: normal;
	line-height: 25px;
}

.my_dtn2 {
	margin-top: 50px;
	margin-left: 50px;
	margin-bottom: 80px;
	width: 660px;
	min-height: 255px;
	border: 0px solid lightgray;
	text-align: left;
	font-size: 15px;
	font-weight: normal;
	line-height: 25px;
}

.btn {
	margin-bottom: 50px;
	background-color: #666666;
	color: white;
	width: 85px;
	height: 30px;
	font-size: 15px;
	font-weight: bold;
	border-radius: 5px;
	cursor: pointer;
	margin-left: 42%;
}

.my_ctn4 {
	margin-top: 0px;
	margin-left: 0px;
	padding-right: 20px;
	padding-left: 20px;
	min-height: 500px;
	border: 0px solid lightgray;
}

input {
	padding-left: 5px;
	border: 1px solid lightgray;
	font-size: 11px;
	height: 25px;
	margin-bottom: 10px;
}

table, td {
		border-collapse: collapse;
		padding: 5px;
	}

.apply {
		cursor: pointer;
		float: right;
		color: #007a48;
		font-weight: bold;
		padding-right: 5px; 
	}
	
.aa {
	background: #f3f3f3;
	text-align: center;
	font-weight: bold;
}
</style>

<script>
function bbb(){
	var name = $("#names").val();
	if(!name){
		alert("이름을 입력하세요");
		names.focus();
		return false;
	}
	var z = $("#zip").val();
	if(!z){
		alert("우편번호를 입력하세요");
		zip.focus();
		return false;
	}
	var a1 = $("#addr1").val();
	if(!a1){
		alert("주소를 입력하세요");
		addr1.focus();
		return false;
	}
	var a2 = $("#addr2").val();
	if(!a2){
		alert("상세주소를 입력하세요");
		addr2.focus();
		return false;
	}
	var t = $("#tel").val();
	if(!t){
		alert("연락처를 입력하세요");
		tel.focus();
		return false;
	}
	
	$.ajax({
		url: "/mypage/addDtn",
		type: "post",
		data: {"names" : name, "zip" : z, "addr1" : a1, "addr2" : a2, "tel" : t},
		dataType: "text",
		success: function(data){
			location.reload();
		}	
	});
}

function aaa(uid){
//	alert(uid);
	$.ajax({
		url: "/mypage/deleteDtn",
		type: "post",
		data: {"uid" : uid},
		dataType: "text",
		success: function(result){
			location.reload();
		}	
	});
}

</script>

<div class="subtitle">배송지 관리</div>

<div class="my_ctn4">
	<div class="my_dtn"><br>
		<div style="margin-bottom:18px; margin-left:0px; font-size:17px; margin-top:-30px; color:#666666; font-weight:bold;"><b>배송지 작성하기</b></div>
		<div style="margin-bottom:10px; margin-left:-10px; font-size:13px;"><b>&nbsp; 수취인:</b>
			<span style="margin-left:10px;">
				<input type="text" name="names" id="names" value="" style="text-align:left; width:100px;">
			</span>
		</div>
		<div style="margin-bottom:10px;  margin-left:-10px; font-size:13px;">
			<b>&nbsp; 주소지:</b>
			<span style="margin-left:10px;">
				<input type="text" name="zip"  id="zip" value="" placeholder="우편번호" style="text-align:left; width:100px; margin-right:10px"><br>
				<input type="text" name="addr1" id="addr1" value="" placeholder="주소" style="text-align:left; width:400px; margin-left:66px;"><br>
				<input type="text" name="addr2" id="addr2" value="" placeholder="상세주소" style="text-align:left; width:400px; margin-left:66px;">
			</span>
		</div>
		<div style="margin-bottom:-10px;  margin-left:-10px; font-size:13px;"><b>&nbsp; 연락처:</b>
			<span style="margin-left:10px;">
				<input type="text" name="tel" id="tel" value="" style="text-align:left; width:200px;">
			</span>
		</div><br>
		<div>&nbsp; <button  class="btn" onclick="bbb()">추가하기</button></div>
	</div>

	
	<div class="my_dtn2">
	<div style="font-size:18px; margin-bottom:15px; font-weight:bold; color:#666666;">배송지 리스트</div>
	
		<c:forEach var="dtn" items="${dtn }">
			<table style="font-size:13px; border:1px solid lightgray;" border=1 width=660>
				<tr>
					<td width=50 class="aa">이름</td>
					<td width=600><input id ="names${dtn.uid }" name ="names" value="${dtn.names }" style="width:70px; border:none" readonly><span class="apply" onclick="aaa(${dtn.uid})">[삭제하기]</span></td>
				</tr>
				<tr>
					<td width=50 class="aa">주소</td>
					<td>
						<input id ="zip${dtn.uid }" name ="zip" value="${dtn.zip }" style="width:70px; border:none" readonly><br>
						<input id ="addr1${dtn.uid }" name ="addr1" value="${dtn.addr1 }" style="width:300px; border:none" readonly><br>
						<input id ="addr2${dtn.uid }" name ="addr2" value="${dtn.addr2 }" style="width:160px; border:none" readonly>
					</td>
				</tr>
				<tr>
					<td width=50 class="aa">연락처</td>
					<td><input id ="tel${dtn.uid }" name ="tel" value="${dtn.tel }" style="width:200px; border:none" readonly></td>
				</tr>
			</table><br>
		</c:forEach>
	
	</div>
</div>


<%@ include file="/WEB-INF/views/include/nav_footer.jsp" %>