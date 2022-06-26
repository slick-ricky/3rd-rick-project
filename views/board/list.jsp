<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<style>
main {
	min-height: 460px;
}

a {
	text-decoration: none;
	color: #666666
}

a:hover {
	font-weight: bold;
}

.tt {
	margin: auto;
	padding-top: 30px;
	padding-bottom: 30px;
	width: 1100px;
	font-size: 27px;
}

.create_ctn {
	margin: auto;
	width: 1100px;
	border: 0px solid lightgray;
}

.list_clm {
	border-top: 1px solid #333333;
	border-bottom: 1px solid #333333;
	height: 50px;
	padding-top: 15px;
	display: flex;
	font-size: 15px;
}

.ctt {
	border-bottom: 1px solid lightgray;
	padding-top: 20px;
	padding-bottom: 20px;
	display: flex;
	color: #666666;
	font-size: 14px;
}

.updown1 {
	display: flex;
	width: 1140px;
	height: 50px;
	border-top: 1px solid black;
	border-bottom: 1px solid #dddddd;
}

.updown2 {
	display: flex;
	width: 1140px;
	height: 50px;
	border-bottom: 1px solid black;
}

.updown_box1 {
	width: 200px;
	background-color: #f4f4f2;
}

.search_ctn {
	margin: auto;
	padding-top: 20px;
	width: 1100px;
	height: 70px;
	background-color: #f4f4f2;
}

.slt {
	border: 1px solid #dddddd;
	height: 30px;
}

input {
	border: 1px solid #dddddd;
	height: 30px;
}

.search_btn {
	margin-top: -1px;
	margin-left: 7px;
	float: right;
	background-color: #666666;
	color: white;
	width: 70px;
	height: 30px;
	font-size: 13px;
	font-weight: bold;
	border-radius: 5px;
	cursor: pointer;
}

.list2_ctn{
	margin: auto;
	margin-block-start: 90px;
	margin-block-end: 170px;
	border: 0px solid black;
	width: 1100px;
}

.paging{
	border: 0px solid black;
	margin: auto;
}

.paging table,td {
	border: 0px;
}

.list_btn {
	margin-block-start: 30px;
	margin-left: 75%;
	background-color: #666666;
	color: white;
	width: 70px;
	height: 35px;
	font-size: 16px;
	font-weight: bold;
	border-radius: 5px;
	cursor: pointer;
}

.arrow2 {
	border: 1px solid lightgray;
	width: 22px;
	text-align: center;
}

.secret {
	cursor: pointer;
}

.secret:hover {
	font-weight: bold;
}
</style>

<%@include file="board_title.jsp" %>

<script>
function change(ppn){
	location.href="list?page=1&perPageNum="+ppn+"&searchType=${cri.searchType}&keyword=${cri.keyword}&code=${param.code}";
}
</script>

<!-- 
param.page : ${param.page } <br>
cri.page : ${cri.page } <br>
pageMaker.cri.page : ${pageMaker.cri.page } <br>
-->

<main>

<form method="get">
<div class="search_ctn" style="padding-left:20px;">
	<table border=0 width=1050 align=center>
		<tr>
			<td>
				<b>Total</b> : ${pageMaker.totalCount } &nbsp;
				<select class="slt" name="perPageNum" onchange="change(this.value)">
					<option value="1" <c:if test="${pageMaker.cri.perPageNum == 1}">selected</c:if>>1개</option>
					<option value="2" <c:if test="${pageMaker.cri.perPageNum == 2}">selected</c:if>>2개</option>
					<option value="4" <c:if test="${pageMaker.cri.perPageNum == 4}">selected</c:if>>4개</option>
					<option value="5" <c:if test="${pageMaker.cri.perPageNum == 5}">selected</c:if>>5개</option>
					<option value="10" <c:if test="${pageMaker.cri.perPageNum == 10}">selected</c:if>>10개</option>
				</select>
			</td>
			<td align=right>
			<!-- search 시작 -->
			
				<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum}">
				<input type="hidden" name="code" value="${param.code}">
				<select name="searchType">
					<option value="n" ${cri.searchType == null?'selected':''}>---</option>		
					<option value="t" ${cri.searchType eq 't'?'selected':''}>Title</option>		
					<option value="c" ${cri.searchType eq 'c'?'selected':''}>Content</option>		
					<option value="w" ${cri.searchType eq 'w'?'selected':''}>Writer</option>		
					<option value="tc" ${cri.searchType eq 'tc'?'selected':''}>Title OR Content</option>		
					<option value="cw" ${cri.searchType eq 'cw'?'selected':''}>Content OR Writer</option>		
					<option value="tcw" ${cri.searchType eq 'tcw'?'selected':''}>Title OR Content OR Writer</option>		
				</select> 		
				<input type="text" name='keyword' id="keywordInput" value='${cri.keyword }'>		
				<input type="submit" value="Search" class="search_btn">
			
			<!-- search 끝 --> 
		</td>			
		</tr>
		<tr><td height=5></td></tr>
	</table>
	
</div>
</form>

<br><br>

<div class="create_ctn">
	<div class="list_clm">
		<dl style="width: 50px; font-weight: bold; text-align: center;">NO</dl>
		<dl style="width: 110px; font-weight: bold; text-align: center;">분류</dl>
		<dl style="width: 580px; font-weight: bold; text-align: center;">제목</dl>
		<dl style="width: 100px; font-weight: bold;">작성자</dl>
		<dl style="width: 200px; font-weight: bold; text-align: center;">날짜</dl>
		<dl style="width: 50px; font-weight: bold; text-align: center;">조회수</dl>
	</div>
		
	<c:forEach var="list_top" items="${list_top}">
		<!-- 공지글 -->
		<c:if test="${list_top.gongji eq '1'}">
			<div class="ctt" style="background-color: #f6f5ef; font-weight: bold;">	
				<div style="width: 50px; text-align: center;"><font color="#007042"><b>New</b></font></div>
				<div style="width: 110px; text-align: center;">공지</div>
				<div style="width: 580px;"><a href="/board/view${pageMaker.makeSearch(pageMaker.cri.page)}&uid=${list_top.uid }">&nbsp;${list_top.subject } <c:if test="${list_top.uid_count ne ''}"><b>(${list_top.uid_count })</b></c:if></a></div>
				<div style="width: 100px;">${list_top.names }</div>
				<div style="width: 200px; text-align: center;">${list_top.signdate }</div>
				<div style="width: 50px; text-align: center;">${list_top.ref }</div>
			</div>
		</c:if>
	</c:forEach>
		
	<c:set var="number" value="${pageMaker.totalCount - (pageMaker.cri.page - 1) * pageMaker.cri.perPageNum }" />
	<c:forEach var="list" items="${list}">	
		<!-- 일반글 -->
		<c:if test="${list.gongji eq '2'}">
			<div class="ctt">	
				<div style="width: 50px; text-align: center;">${number }</div>
				<div style="width: 110px; text-align: center;">일반</div>
				<div style="width: 580px;"><a href="/board/view${pageMaker.makeSearch(pageMaker.cri.page)}&uid=${list.uid }">&nbsp;${list.subject }</a> <c:if test="${list.uid_count ne ''}"><b>(${list.uid_count })</b></c:if></div>
				<div style="width: 100px;">${list.names }</div>
				<div style="width: 200px; text-align: center;">${list.signdate }</div>
				<div style="width: 50px; text-align: center;">${list.ref }</div>
			</div>
		</c:if>
		
		<!-- 비밀글 -->
		<c:if test="${list.gongji eq '3'}">
			<div class="ctt">	
				<div style="width: 50px; text-align: center;">${number }</div>
				<div style="width: 110px; text-align: center;">비밀</div>
				<c:choose>
					<c:when test="${sessionScope.id eq list.id || sessionScope.level >= 10 }">
						<div style="width: 580px;"><a href="/board/view${pageMaker.makeSearch(pageMaker.cri.page)}&uid=${list.uid }">&nbsp;${list.subject } <img src="/img/key.png" width="15px"></a> <c:if test="${list.uid_count ne ''}"><b>(${list.uid_count })</b></c:if></div>
					</c:when>
					<c:otherwise>
						<span class="secret" style="width: 580px;" onclick="alert('비밀글입니다.')">&nbsp;${list.subject } <img src="/img/key.png" width="15px"> <c:if test="${list.uid_count ne ''}"><b>(${list.uid_count })</b></c:if></span>
					</c:otherwise>
				</c:choose>
				<div style="width: 100px;">${list.names }</div>
				<div style="width: 200px; text-align: center;">${list.signdate }</div>
				<div style="width: 50px; text-align: center;">${list.ref }</div>
			</div>
		</c:if>
	<c:set var="number" value="${number - 1 }"/> 
	</c:forEach>
</div>


<c:choose>
	<c:when test="${sessionScope.id eq null}"></c:when>
	<c:otherwise>
		<a href="/board/create?code=<%=code%>"><button class="list_btn">글쓰기</button></a>
	</c:otherwise>
</c:choose>


<div class="list2_ctn">
	<!-- 페이징 추가 -->
	
	<table border=1 class="paging">
		<tr>
			<c:if test="${pageMaker.prev}">
				<td class="arrow2">&nbsp;<a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a>&nbsp;</td>
			</c:if>
			<c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
				<td>
					<c:if test="${pageMaker.cri.page == idx}"><b></c:if>
					&nbsp;<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>&nbsp;
					<c:if test="${pageMaker.cri.page == idx}"></b></c:if>
				</td>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<td class="arrow2">&nbsp;<a href="list${pageMaker.makeSearch(pageMaker.endPage +1)}">&raquo;</a>&nbsp;</td>
			</c:if>
		</tr>
	</table>
</div>

</main>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>