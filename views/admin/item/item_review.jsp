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
		width: 1200px;
		min-height: 500px;
		border: 0px solid lightgray;
		font-size: 13px;
	}
	
	.mng_ctn > table{
		border-spacing: 0;
		border-collapse: collapse;
		border: 1px solid lightgray;
		margin-bottom: 20px;
	}
	
	td {
		padding-left: 5px;
		height: 25px;
	}
	
	.row1 {
		font-weight: bold;
		background: #717984;
		color: white;
		border:0px solid black;
	}
	
	.row2 {
		text-align: center;
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
		padding: 2px 3px 2px 3px;
	}
	
	.detail_btn {
		font-size: 10px;
		cursor: pointer;
		padding: 1px 2px 1px 2px;
	}
	.tc {
		margin: 10px 0px;
	}
	
	.tc2 {
		color: #007a48;
		font-size: 15px;
		font-weight: bold;
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
	
	.src {
		margin-left: 10px;
		width: 50px;
		height: 20px;
		font-size: 13px;
		border-radius: 3px;
		cursor: pointer;
		background: #539fdd;
		color: white;
		border: none;
	}
	
	.src:focus {
		margin-left: 10px;
		width: 50px;
		height: 20px;
		font-size: 13px;
		border-radius: 3px;
		cursor: pointer;
		background: #539fdd;
		color: white;
		border: none;
		border: 1px solid #3168db;
		box-shadow: 0px 0px 8px #003ea8;
		outline:none;
	}
	
.star_rating {font-size:0; letter-spacing:-4px;}
.star_rating a {
    font-size:15px;
    font-weight: bolder;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    filter: opacity(0.2) drop-shadow(0 0 0 darkgray);
    text-decoration:none;
}
.star_rating a:first-child {margin-left:0;}
.star_rating a#on {filter: brightness(100%);}
</style>

<main>

<div class="title"><b>상품리뷰</b></div>

<div class="mng_ctn">

	<form action="/admin/item/item_review" method="get">
	<table border=1 width=100% style="border-collapse: collapse; border:1px solid lightgray; margin-bottom:20px">
		<tr>
			<td class="r1">상품분류</td>
			<td class="r2">
				<select name="it_category" id="category" onchange="this.form.submit()">
					<option value="" <c:if test="${param.it_category eq ''}">selected</c:if>>===전체===</option>
					<option value="1" <c:if test="${param.it_category eq '1'}">selected</c:if>>커피</option>
					<option value="2" <c:if test="${param.it_category eq '2'}">selected</c:if>>티</option>
					<option value="3" <c:if test="${param.it_category eq '3'}">selected</c:if>>기타음료</option>
					<option value="4" <c:if test="${param.it_category eq '4'}">selected</c:if>>브래드</option>
					<option value="5" <c:if test="${param.it_category eq '5'}">selected</c:if>>케이크</option>
					<option value="6" <c:if test="${param.it_category eq '6'}">selected</c:if>>커피용품</option>
				</select>
			</td>
			<td class="r1">별점</td>
			<td class="r2"><input type="text" name="score" value="${param.score}" style="width:50px; text-align: right; padding-right: 5px"> 점</td>	
		</tr>
		<tr>
			<td class="r1">작성자</td>
			<td class="r2"><input type="text" name="names" value="${param.names}" style="width:130px; text-align: right; padding-right: 5px"></td>
			<td class="r1">기타</td>
			<td class="r2" colspan=2>
				<input type="checkbox" name="it_new" value="Y" onclick="this.form.submit()" <c:if test="${param.it_new eq 'Y'}">checked</c:if>> 신상품 &nbsp;
				<input type="checkbox" name="it_season" value="Y" onclick="this.form.submit()" <c:if test="${param.it_season eq 'Y'}">checked</c:if>> 시즌상품 &nbsp;
				<input type="submit" style="display: none">
			</td>
		</tr>
	</table>
	</form>
	
	<p class="tc">총 리뷰: <b><span class="tc2">${total}</span></b> </p>
	
	<table border=1 width=100%>
		<tr>
			<td class="row1" align=center width=20 >No.</td>
			<td class="row1" align=center width=60>첨부파일</td>
			<td class="row1" align=center width=60>상품분류</td>
			<td class="row1" align=center width=100>상품명</td>
			<td class="row1" align=center width=50>신상품</td>
			<td class="row1" align=center width=50>시즌상품</td>
			<td class="row1" align=center width=200>상품평</td>
			<td class="row1" align=center width=60>별점</td>
			<td class="row1" align=center width=60>작성자</td>
			<td class="row1" align=center width=100>작성일</td>
			<td class="row1" align=center width="50" >기능</td>
		</tr>
		
		<c:set var="number" value="1"/>
		<c:forEach var="rv" items="${review }">
		<tr>
			<td class="row2">${number }</td>
			<td class="row2"><img src="/upload/${rv.file1 }" width=50 height=50 style="padding-top:2px;"></td>
			<td class="row2">
				<c:if test="${rv.it_category eq '1'}">커피</c:if>
				<c:if test="${rv.it_category eq '2'}">티</c:if>
				<c:if test="${rv.it_category eq '3'}">기타음료</c:if>
				<c:if test="${rv.it_category eq '4'}">브래드</c:if>
				<c:if test="${rv.it_category eq '5'}">케이크</c:if>
				<c:if test="${rv.it_category eq '6'}">커피용품</c:if>
			</td>
			<td class="row2">${rv.it_name}</td>
			<td class="row2">${rv.it_new}</td>
			<td class="row2">${rv.it_season}</td>
			<td class="row2" style="text-align:left; font-size:12px; line-height:25px; padding:0px 10px 0px 10px;">${rv.comment }</td>
			<td class="row2">
				<p class="star_rating">
				    <a href="#" id='<c:if test="${rv.score >= 1}">on</c:if>'><img src="/img/star.png" width="10px" height="10px"></a>
				    <a href="#" id='<c:if test="${rv.score >= 2}">on</c:if>'><img src="/img/star.png" width="10px" height="10px"></a>
				    <a href="#" id='<c:if test="${rv.score >= 3}">on</c:if>'><img src="/img/star.png" width="10px" height="10px"></a>
				    <a href="#" id='<c:if test="${rv.score >= 4}">on</c:if>'><img src="/img/star.png" width="10px" height="10px"></a>
				    <a href="#" id='<c:if test="${rv.score >= 5}">on</c:if>'><img src="/img/star.png" width="10px" height="10px"></a>
				</p>
			</td>
			<td class="row2">${rv.names}</td>
			<td class="row2">${rv.date}</td>
			<td class="row2">
				<button class="detail_btn" value="this" onclick="dlt(${rv.od_group})">삭제</button>
			</td>
		</tr>
		<c:set var="number" value="${number+1 }"/>
		</c:forEach>
		
		
	</table>
</div>

<script>
function dlt(od_group){
	alert(od_group);
	$.ajax({
		url: "/admin/item/reviewDlt",
		type: "post",
		data: {"od_group" : od_group},
		dataType: "text",
		success: function(result){
			location.reload();
		}	
	});
}
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
			<td class="p1"><a href="/admin/item/item_review/${pageMaker.makeQuery(pageMaker.startPage - 1)}">&laquo;</a></td>
		</c:if>

		<c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
			<td class="p1">
				<c:if test="${pageMaker.cri.page == idx}"><b></c:if>
				<a href="/admin/item/item_review/${pageMaker.makeQuery(idx)}">${idx}</a>
				<c:if test="${pageMaker.cri.page == idx}"></b></c:if>
			</td>
		</c:forEach>

		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<td class="p1"><a href="/admin/item/item_review/${pageMaker.makeQuery(pageMaker.endPage +1)}">&raquo;</a></td>
		</c:if>
	</tr>
</table>

</main>

</main>

<%@ include file="/WEB-INF/views/admin/include/footer.jsp" %>