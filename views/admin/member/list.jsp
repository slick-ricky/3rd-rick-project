<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>   

<style>
	main {
		min-height: 600px;
	}
	
	table, td {
		border-spacing: 0;
		border-collapse: collapse;
	}
	
	td {
		padding: 5px;
	}
	
	.sub_title {
		margin-left: 20.5%;
		margin-block-start: 30px;
		height: 100px;
		font-size: 27px;
		font-weight: bold;
	}
	
	.a {
		background-color: #717984;
		color: white;
		height: 30px;
		font-weight: bold;
	}
	
	.b {
		background-color: #fce4ec;
		color: black;
	}
	
	.active a{
		display:inline-block;
		margin: 0 3px;
		
		border:1px solid #e6e6e6;
		width:26px;
		height:26px;
		line-height:28px;
		text-align:center;
		background-color:#fff;
		color:#999999;
		text-decoration:none;
		
	}	
	
	.active a.a1{
		background:#4169e1;
		color:white;
	}
	
	.bt3{
		border:1px solid #98a3b3;
		padding:10px;
		cursor: pointer;
	    background-color:#f8f8ff;
	    text-align:center;
	}
	
	.bt3:hover{
		background-color:#708090;
		color:white;
	}
	
	.list {
		margin: auto;
		font-size: 14px;
		border: 1px solid lightgray;
	}
	
	a {
		color: black;
	}
</style>

<main>



<div class="sub_title">회원관리</div>

<table width=1110 border=1 class="list">
	<tr>
		<td width=130 class="a" align=center>아이디</td>
		<td width=120 class="a" align=center>이름</td>
		<td width=120 class="a" align=center>연락처</td>
		<td width=170 class="a" align=center>가입날짜</td>
		<td width=230 class="a" align=center>이메일</td>
		<td width=90 class="a" align=center>포인트</td>
		<td width=50 class="a" align=center>레벨</td>
		<td width=60 class="a" align=center>상태</td>
		<td width=120 class="a" align=center>탈퇴</td>
	</tr>
	<c:forEach var="member" items="${member }">
	<c:set var="delmember" value="${member.delmember }"/>
	<c:choose>
		<c:when test="${delmember eq 'N'}">
			<tr>
				<td align=center><a href="/admin/member/mem_up?id=${member.id}" style="color:#4b9ec2; font-weight:bold">${member.id }</a></td>
				<td align=center>${member.names }</td>
				<td align=center>${member.tel }</td>
				<td align=center>${member.signdate }</td>
				<td>${member.email }</td>
				<td>${member.point }</td>
				<td align=center>${member.level }</td>
				<td align=center>
					<c:set var="delmember" value="${member.delmember }"/>		
					<c:choose>
						<c:when test="${delmember eq 'N' }">
							가입
						</c:when>
						<c:otherwise>
							탈퇴
						</c:otherwise>
					</c:choose>
				</td>
				<td align=center><a href="delete?id=${member.id }">탈퇴</a> &nbsp;/&nbsp; <a href="restore?id=${member.id }">복구</a></td>
			</tr>
		</c:when>
		<c:otherwise>
			<tr>
				<td class="b" align=center><a href="/admin/member/mem_up?id=${member.id}" style="color:#4b9ec2; font-weight:bold">${member.id }</a></td>
				<td class="b" align=center>${member.names }</td>
				<td class="b" align=center>${member.tel }</td>
				<td class="b" align=center>${member.signdate }</td>
				<td class="b">${member.email }</td>
				<td class="b">${member.point }</td>
				<td class="b" align=center>${member.level }</td>
				<td class="b" align=center>
					<c:set var="delmember" value="${member.delmember }"/>		
					<c:choose>
						<c:when test="${delmember eq 'N' }">
							가입
						</c:when>
						<c:otherwise>
							탈퇴
						</c:otherwise>
					</c:choose>
				</td>
				<td class="b" align=center><a href="delete?id=${member.id }">탈퇴</a> &nbsp;/&nbsp; <a href="restore?id=${member.id }">복구</a></td>
			</tr>
		</c:otherwise>
	</c:choose>
	</c:forEach>
</table>
<br>

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
			<td class="p1"><a href="/admin/member/list${pageMaker.makeQuery(pageMaker.startPage - 1)}">&laquo;</a></td>
		</c:if>

		<c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
			<td class="p1">
				<c:if test="${pageMaker.cri.page == idx}"><b></c:if>
				<a href="/admin/member/list${pageMaker.makeQuery(idx)}&od_status=${param.od_status }">${idx}</a>
				<c:if test="${pageMaker.cri.page == idx}"></b></c:if>
			</td>
		</c:forEach>

		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<td class="p1"><a href="/admin/member/list${pageMaker.makeQuery(pageMaker.endPage +1)}">&raquo;</a></td>
		</c:if>
	</tr>
</table>

</main>


</main>

<%@ include file="/WEB-INF/views/admin/include/footer.jsp" %> 
