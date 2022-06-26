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
		font-size: 14px;
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

<div class="title"><b>게시판 관리</b></div>

<div class="mng_ctn">

	<form action="/admin/board/board_list" method="get">
	<table border=1 width=100% style="border-collapse: collapse; border:1px solid lightgray; margin-bottom:20px">
		<tr>
			<td class="r1">게시판 종류</td>
			<td class="r2">
				<select name="code" id="code" onchange="this.form.submit()">
					<option value="" <c:if test="${param.code eq ''}">selected</c:if>>===전체===</option>
					<option value="board" <c:if test="${param.code eq 'board'}">selected</c:if>>공지사항</option>
					<option value="free" <c:if test="${param.code eq 'free'}">selected</c:if>>자유게시판</option>
					<option value="qna" <c:if test="${param.code eq 'qna'}">selected</c:if>>문의사항</option>
				</select>
			</td>
			<td class="r1">분류</td>
			<td class="r2">
				<select name="gongji" id="gongji" onchange="this.form.submit()">
					<option value="" <c:if test="${param.gongji eq ''}">selected</c:if>>===전체===</option>
					<option value="1" <c:if test="${param.gongji eq '1'}">selected</c:if>>공지</option>
					<option value="2" <c:if test="${param.gongji eq '2'}">selected</c:if>>일반</option>
					<option value="3" <c:if test="${param.gongji eq '3'}">selected</c:if>>비밀</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="r1">작성자</td>
			<td class="r2"><input type="text" name="names" value="${param.names}" style="width:130px; text-align: right; padding-right: 5px"></td>
			<td class="r1">작성일</td>
			<td class="r2">
				<input type="text" name="signdate" value="${param.signdate}" style="width:130px; text-align: right; padding-right: 5px">
				<input type="submit" style="display: none">
			</td>
		</tr>
	</table>
	</form>
	
	<p class="tc">총 리뷰: <b><span class="tc2">${total}</span></b> </p>
	
	<table border=1 width=100%>
		<tr>
			<td class="row1" align=center width=20 >No.</td>
			<td class="row1" align=center width=60>게시판</td>
			<td class="row1" align=center width=40>분류</td>
			<td class="row1" align=center width=135>제목</td>
			<td class="row1" align=center width=200>내용</td>
			<td class="row1" align=center width=60>작성자</td>
			<td class="row1" align=center width=100>작성일</td>
			<td class="row1" align=center width="35" >기능</td>
		</tr>
		
		<c:set var="number" value="1"/>
		<c:forEach var="b" items="${b }">
		<tr>
			<td class="row2">${number }</td>
			<td class="row2">
				<c:if test="${b.code eq 'board'}"><font color="#f00d7e">공지사항</font></c:if>
				<c:if test="${b.code eq 'free'}"><font color="gray">자유게시판</font></c:if>
				<c:if test="${b.code eq 'qna'}"><font color="#305fcd">문의사항</font></c:if>
			</td>
			<td class="row2" style="text-align:left; padding-left:22px;">
				<c:if test="${b.gongji eq '1'}">공지</c:if>
				<c:if test="${b.gongji eq '2'}">일반</c:if>
				<c:if test="${b.gongji eq '3'}">비밀<img src="/img/key.png" width="12px"></c:if>
			</td>
			<td class="row2" style="text-align:left; font-size:12px; line-height:25px; padding:0px 10px 0px 10px;">${b.subject}</td>
			<td class="row2" style="text-align:left; font-size:12px; line-height:25px; padding:0px 10px 0px 10px;">${b.content}</td>
			<td class="row2">${b.names}</td>
			<td class="row2">${b.signdate}</td>
			<td class="row2">
				<button class="detail_btn" value="this" onclick="dlt(${b.uid})">삭제</button>
			</td>
		</tr>
		<c:set var="number" value="${number+1 }"/>
		</c:forEach>
	</table>
</div>

<script>
function dlt(aa){
	alert(aa);
	$.ajax({
		url: "/admin/board/boardDlt",
		type: "post",
		data: {"uid" : aa},
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
			<td class="p1"><a href="/admin/board/board_list${pageMaker.makeQuery(pageMaker.startPage - 1)}&code=${param.code }&gongji=${param.gongji }&names=${param.names }&signdate=${param.signdate }">&laquo;</a></td>
		</c:if>

		<c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
			<td class="p1">
				<c:if test="${pageMaker.cri.page == idx}"><b></c:if>
				<a href="/admin/board/board_list${pageMaker.makeQuery(idx)}&code=${param.code }&gongji=${param.gongji }&names=${param.names }&signdate=${param.signdate }">${idx}</a>
				<c:if test="${pageMaker.cri.page == idx}"></b></c:if>
			</td>
		</c:forEach>

		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<td class="p1"><a href="/admin/board/board_list${pageMaker.makeQuery(pageMaker.endPage +1)}&code=${param.code }&gongji=${param.gongji }&names=${param.names }&signdate=${param.signdate }">&raquo;</a></td>
		</c:if>
	</tr>
</table>


</main>

<%@ include file="/WEB-INF/views/admin/include/footer.jsp" %>