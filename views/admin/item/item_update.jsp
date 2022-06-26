<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>

<link rel="stylesheet" href="/css/item_create.css">

<script>

function checkNum(e) {
    var keyVal = event.keyCode;

    if(((keyVal >= 48) && (keyVal <= 57))){
        return true;
    }
    else{
        alert("숫자만 입력가능합니다");
        return false;
    }
}
function readURL1(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('preview1').src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	} else {
		document.getElementById('preview1').src = "";
	}
}

function readURL2(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('preview2').src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	} else {
		document.getElementById('preview2').src = "";
	}
}    

function readURL3(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('preview3').src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	} else {
		document.getElementById('preview3').src = "";
	}
}

function ok(){
	
	if(priname.value == ""){
		alert("상품명을 입력해주세요");
		return false;
	}
	if(pristock.value == ""){
		alert("상품판매 수량을 입력해주세요");
		return false;
	}
	if(price.value == ""){
		alert("가격을 입력해주세요");
		return false;
	}
	if(descr.value == ""){
		alert("상품설명을 입력해주세요");
		return false;
	}
	if(file1.value == ""){
		alert("메인 사진을 첨부해주세요");
		return false;
	}
}      
</script>

<style>
ul {
	display: flex;
	list-style: none;
}
</style>

<div class="title"><b>상품 업데이트</b></div>

<form action="itemUpdate" method="post" onsubmit="return ok()" enctype="multipart/form-data">
<input type="hidden" name="it_uid" value="${update.it_uid }">
<input type="hidden" name="file1" value="${update.file1 }">
<input type="hidden" name="file2" value="${update.file2 }">
<input type="hidden" name="file3" value="${update.file3 }">


<div class="goods_list_wrap">
	<div class="goods_list">
		<div class="goods_list_option">
			<div class="no1"><b>카테고리</b></div>
			<div>
				<select name="it_category">
				    <option value="">===선택===</option>
				  	<option value="1" <c:if test="${update.it_category eq '1'}">selected </c:if>>커피</option>
				    <option value="2" <c:if test="${update.it_category eq '2'}">selected </c:if>>티</option>
				    <option value="3" <c:if test="${update.it_category eq '3'}">selected </c:if>>기타 음료</option>
				    <option value="4" <c:if test="${update.it_category eq '4'}">selected </c:if>>브래드</option>
				    <option value="5" <c:if test="${update.it_category eq '5'}">selected </c:if>>케이크</option>
				    <option value="6" <c:if test="${update.it_category eq '6'}">selected </c:if>>커피용품</option>
				</select>
			</div>
			<div>
				<ul>
					<li><label style="cursor:pointer"><input type="checkbox" name="it_new" value="${update.it_new}" <c:if test="${update.it_new eq 'Y'}"> checked </c:if>>&nbsp;신상품 &nbsp;&nbsp;</label></li>
					<li><label style="cursor:pointer"><input type="checkbox" name="it_season" value="${update.it_season}" <c:if test="${update.it_season eq 'Y'}"> checked </c:if>>&nbsp;시즌한정 &nbsp;</label></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="goods_prina">
		<div class="p_code">상품이름</div>
		<div>
			<textarea name="it_name" id="it_name"   style="width:300px;  height:30px; resize: none; margin-left: 6px; padding:5px;">${update.it_name }</textarea>
		</div>
	</div>
	<div class="goods_list_option2" style="height:50px;">
		<div class="no2" style="height:22px;"><b>옵션</b></div>
		<div class="stock">수량</div>
		<div><input type = "number" id="it_qty" name="it_qty" value="${update.it_qty }" pattern="[0-9]+" style="text-align: center; height:30px; width:100px">&nbsp;개</div> &nbsp; /
		<div class="pprice">개당 가격</div>
		<div><input type = "number" id="it_price" name="it_price" value="${update.it_price }" pattern="[0-9]+" maxlength='5' style="text-align: center; height:30px; width:100px">&nbsp;원</div>
	</div>
	<div class="goods_prina" style="margin-top:0px">
		<div class="p_code2" style="height:22px;">상품설명</div>
		<div><textarea name="it_desc" id="it_desc" style="width:800px; height:300px; resize: none; padding:10px;">${update.it_desc}</textarea></div>
	</div>
	
	<div class="goods_list_dimg">
		<div class="nord" style="border:0px solid black;">
			<div class="no11"><b>대표이미지</b></div>
			<div class="ro1"><img src="/upload/${update.file1 }" id="preview1" height=250 width=250></div>
			<div class="ro2" style="font-size: 13px; color: gray;">
			크기:최소100~최대:5000(권장크기 500x500)<br>용량 : 5MB 이하, 파일형식 JPG,PNG<br><br><br><br><br><br>
			<input  multiple="multiple" type="file" name="file" id="file1" value="${update.file1 }"  onchange="readURL1(this);">
			</div>
		</div>
	</div>
	
	<div class="goods_list_dimg">
		<div class="nord" style="border:0px solid black;">
			<div class="no11"><b>서브이미지</b></div>
			<div class="ro1"><img src="/upload/${update.file2 }" id="preview2" height=250 width=250></div>
			<div class="ro2" style="font-size: 13px; color: gray;">
			크기:최소100~최대:5000(권장크기 500x500)<br>용량 : 5MB 이하, 파일형식 JPG,PNG<br><br><br><br><br><br>
			<input  multiple="multiple" type="file" name="file" id="file2" value="${update.file2 }" onchange="readURL2(this);">
			</div>
		</div>
	</div>
	
	<div class="goods_list_dimg">
		<div class="nord" style="border:0px solid black;">
			<div class="no11"><b>서브이미지</b></div>
			<div class="ro1"><img src="/upload/${update.file3 }" id="preview3" height=250 width=250></div>
			<div class="ro2" style="font-size: 13px; color: gray;">
			크기:최소100~최대:5000(권장크기 500x500)<br>용량 : 5MB 이하, 파일형식 JPG,PNG<br><br><br><br><br><br>
			<input  multiple="multiple" type="file" name="file" id="file3" value="${update.file3 }" onchange="readURL3(this);">
			</div>
		</div>
	</div>

	<div class="goods_list_end">
		<div class="end1"><button class="create_btn">작성</button></div>
		<div class="end2"><div class="cancelbt"><a onclick="cancel()">취소</a></div></div>
	</div>
</div>	
</form>

<script>
function cancel(){
//	alert("취소");
	history.go(-1);
}
</script>

<%@ include file="/WEB-INF/views/admin/include/footer.jsp" %>