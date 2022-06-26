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
	min-height: 130px;
	border: 0px solid lightgray;
	border-radius: 8px;
	margin-left: 80px;
	margin-top: 10px;
	text-align: left;
	font-size: 13px;
	padding: 10px;
	margin-bottom: 100px;
}

.od_info {
	border: 0px solid black;
	width: 630px;
	height: 70px;
	font-size: 15px;
	padding: 5px;
	line-height: 20px;
	margin-left:10px;
	margin-top: 10px;
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

.stf {
	margin-top: 7px;
	font-size: 13px;
}

.star_rating {
	font-size:0; 
	letter-spacing:-4px;
	padding-top: 15px;
	font-size: 13px;
	font-weight: normal;
	color: gray;
	}
	
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

button {
	background: white;
	border: 1px solid #717984;
	border-radius: 3px;
	color: #717984;
	width: 35px;
	cursor: pointer;
}

.list_clm {
	border-top: 1px solid #333333;
	border-bottom: 1px solid #333333;
	height: 50px;
	padding-top: 15px;
	display: flex;
	font-size: 13px;
	background: #f9f9f9;
}

.list_clm2 {
	border-top: 0px solid #333333;
	border-bottom: 1px solid #333333;
	height: 50px;
	padding-top: 15px;
	display: flex;
	font-size: 13px;
	font-weight: normal;
	text_overflow: ellipsis;
	
}

#subject{
	text-overflow: ellipsis; white-space:nowrap; overflow:hidden;

}
</style>


<h2 class="tt_2">게시글 확인</h2>


<div class="od_ctn">

	
	<div class="create_ctn" style="margin-top:-30px;">
	<b>Total</b> : ${pageMaker.totalCount } <br><br>
	<div class="list_clm">
		<dl style="width: 50px; font-weight: bold; text-align: center;">NO</dl>
		<dl style="width: 80px; font-weight: bold; text-align: center;">게시판</dl>
		<dl style="width: 80px; font-weight: bold; text-align: center;">분류</dl>
		<dl style="width: 300px; font-weight: bold; text-align: center;">제목</dl>
		<dl style="width: 150px; font-weight: bold; text-align: center;">날짜</dl>
		<dl style="width: 60px; font-weight: bold; text-align: center;">조회수</dl>
		<dl style="width: 40px; font-weight: bold; text-align: center;">삭제</dl>
	</div>
	<c:set var="number" value="${pageMaker.totalCount - (pageMaker.cri.page - 1) * pageMaker.cri.perPageNum }" />
	<c:forEach var="board" items="${board}">
	<div class="list_clm2">	
		<div style="width: 50px; text-align: center;">${number }</div>
		<div style="width: 80px; text-align: center;">
			<c:if test="${board.code eq 'board'}">공지사항</c:if>
			<c:if test="${board.code eq 'free'}">자유게시판</c:if>
			<c:if test="${board.code eq 'qna'}">문의사항</c:if>
		</div>
		<div style="width: 80px; text-align: center;">
			<c:if test="${board.gongji eq '1'}">공지</c:if>
			<c:if test="${board.gongji eq '2'}">일반</c:if>
			<c:if test="${board.gongji eq '3'}">비밀</c:if>
		</div>
		<div style="width: 300px;" id="subject">${board.subject }</div>
		<div style="width: 150px; text-align: center;">${board.signdate }</div>
		<div style="width: 60px; text-align: center;">${board.ref }</div>
		<div style="width: 40px; text-align: center;"><button onclick="aaa(${board.uid})">삭제</button></div>
	</div>
	<c:set var="number" value="${number - 1 }"/> 
	</c:forEach>		
	
</div>

<script>


function aaa(uid){
	alert("해당 게시글을 삭제합니다.");
	
	$.ajax({
		url: "/mypage/boardDlt",
		type: "post",
		data: {"uid" : uid},
		dataType: "text",
		success: function(result){
			location.reload();
		}	
	});

};

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

.paging table,td {
	border: 0px;
}
</style>

<!-- 페이징 추가 -->
<table border=1 class="paging">
	<tr>
		<c:if test="${pageMaker.prev}">
			<td><a href="/mypage/my_board${pageMaker.makeQuery(pageMaker.startPage - 1)}">&laquo;</a></td>
		</c:if>

		<c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
			<td>
				<c:if test="${pageMaker.cri.page == idx}"><b></c:if>
				<a href="/mypage/my_board${pageMaker.makeQuery(idx)}">${idx}</a>
				<c:if test="${pageMaker.cri.page == idx}"></b></c:if>
			</td>
		</c:forEach>

		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<td><a href="/mypage/my_board${pageMaker.makeQuery(pageMaker.endPage +1)}">&raquo;</a></td>
		</c:if>
	</tr>
</table>


<%@ include file="/WEB-INF/views/include/nav_footer.jsp" %>
