<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!-- 이미지를 보여주기 위해 화면상 히든 처리 -->
<style type="text/css">
.popup { position: absolute;}
.back { background-color: gray; opacity:0.5; width: 10%; height: 20%; overflow:hidden;  z-index:1101;}
.front {
	z-index:1110; opacity:1; boarder:1px; margin: auto;
}
.show{
	position:relative;
	max-width: 100%;
	max-height: 100%;
	overflow: auto;
}
</style>


<style>
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

.create_ctn2 {
	margin: auto;
	width: 1100px;
	border: 0px solid lightgray;
	margin-block-start: -50px;
	margin-block-end: 105px;
}

textarea {
	width: 1140px;
	height: 200px;
	font-size: 16px;
	font-weight: bold;
	color: gray;
	border: 0px solid black;
	padding: 10px;
}

.slt {
	margin-top: 2px;
	height: 40px;
	font-size: 15px;
}

.subj {
	border-top: 1px solid #333333;
	border-bottom: 1px solid #333333;
	height: 60px;
	align-items: center;
	display: flex;
	font-weight: bold;
	color: #313131;
}

.ctt {
	border-bottom: 1px solid lightgray;
	padding-top: 20px;
	padding-left: 10px;
	padding-bottom: 20px;
	color: #666666;
	font-weight: bold;
	font-size: 14px;
}

.list_btn2 {
	float: right;
	margin-top: 60px;
	margin-bottom: 50px;
	margin-right: 10px;
	background-color: #666666;
	color: white;
	width: 70px;
	height: 35px;
	font-size: 16px;
	font-weight: bold;
	border-radius: 5px;
	cursor: pointer;
}

.updown1 {
	display: flex;
	height: 45px;
	border-top: 1px solid black;
	border-bottom: 1px solid #dddddd;
	text-align: center;
	font-weight: bold;
	color: #313131;
	
}

.updown2 {
	display: flex;
	height: 45px;
	border-bottom: 1px solid black;
	text-align: center;
	font-weight: bold;
	color: #313131;
}

.updown_box1 {
	width: 200px;
	background-color: #f4f4f2;
}

.updown_box2 a {;
	text-decoration: none;
	color: #666666;
}

.updown_box2 a:hover {;
	text-decoration: none;
	color: #666666;
	font-weight: bold;
}

.test {	
	margin-top: 150px;
}

.list_btn {
	margin-top: 20px;
	margin-bottom: 50px;
	background-color: #666666;
	color: white;
	width: 43px;
	height: 24px;
	font-size: 13px;
	font-weight: bold;
	border-radius: 5px;
	cursor: pointer;
}
</style>

<div class='popup back' style="display:none;"></div>
<div id="popup_front" class='popup front' style="display:none;">
	<img id="popup_img">
</div>

<%@include file="board_title.jsp" %>

	<c:if test="${view.gongji eq '3'}">
		<c:choose>
			<c:when test="${sessionScope.level eq '10' || sessionScope.id eq view.id }">

			</c:when>
			<c:otherwise>
				<script>
					alert("남의 글을 훔쳐보는 행위는 불법입니다.");
					location.href="/board/list";
				</script>
			</c:otherwise>
		</c:choose>
	</c:if>

	<div class="create_ctn">
		<div class="subj">
			<div style="width: 100px; height: 100%; text-align: center; background-color: #f4f4f2; padding-top: 19px;">
				<c:if test="${view.gongji eq '1'}">공지</c:if>
				<c:if test="${view.gongji eq '2'}">일반</c:if>
				<c:if test="${view.gongji eq '3'}">비밀</c:if>
			</div>
			<div style="width: 620px; padding-left: 15px;">${view.subject }</div>
			<div style="width: 90px;">${view.names }</div>
			<div style="width: 220px; text-align: center;">${view.signdate }</div>
			<div style="width: 130px; text-align: center;">조회수: ${view.ref }</div>
		</div>
		
	<table class="uploadedList"><tr></tr></table>
	
	<!-- 첨부파일 출력에 관한 스크립트 -->
	<script>
		//첨부파일 정보
		var uid = ${view.uid}; //객체명 매칭 처리
	
		$.getJSON("/board/getAttach/"+uid,function(list){
			
			$(list).each(function(){
				
				var fileInfo = getFileInfo(this);
				var str_content = "";
				
				if(checkImageType(this)){
					str_content = "<td class='info'><a href="+fileInfo.getLink+">"
					+"<img src=/upload/"+fileInfo.fullName+"></td>";
				}else{
					str_content = "<td><a href="+fileInfo.getLink+">"+fileInfo.fullName+"</td>";
				}
			
				$(".uploadedList").append(str_content);
			});
		});
	
		//파일첨부 히든 영역에 큰 이미지로 보여주기
		$(".uploadedList").on("click", ".info a", function(event){
			var fileLink = $(this).attr("href");
	
			if(checkImageType(fileLink)){
	
				event.preventDefault();
				var imgTag = $("#popup_img");
				imgTag.attr("src", fileLink);
	
				console.log(imgTag.attr("src"));
	
				$(".popup").show('slow');
				imgTag.addClass("show");
			}
		});
	
		$("#popup_img").on("click", function(){
			$(".popup").hide('slow');
		});
		
		//파일 정보 (이미지 판별)
		function checkImageType(fileName){
			var pattern = /jpg|gif|png|jpeg/i;
	
			return fileName.match(pattern);
		}
	
		function getFileInfo(fullName){
			var fileName,imgsrc, getLink;
			var fileLink
	
			if(checkImageType(fullName)){
				imgsrc = "/displayFile?fileName="+fullName;
				fileLink = fullName.substr(14);
	
				var front = fullName.substr(0,12); // /2021/08/11/
				var end = fullName.substr(14); // 's_'		
	
				getLink = "/displayFile?fileName="+front + end;
			}else{
				imgsrc ="/resources/dist/img/file.png";
				fileLink = fullName.substr(12);
				getLink = "/displayFile?fileName="+fullName;
			}
			fileName = fileLink.substr(fileLink.indexOf("_")+1);
	
			return  {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName};
		}
	</script>
	<!-- 추가 끝 2 --> 
	
	
		<div class="ctt">
		<!-- 첨부파일 출력 부분 추가 --> 
			${view.content }
		</div>
		
		<a href="/board/list?code=${view.code}"><button class="list_btn2">목록</button></a>
		<c:if test="${sessionScope.names eq view.names || sessionScope.level >= '10'}">
			<a href="/board/delete${pageMaker.makeSearch(pageMaker.cri.page)}&uid=${view.uid }"><button class="list_btn" style="margin-right:10px;">삭제</button></a>
			<a href="/board/modify${pageMaker.makeSearch(pageMaker.cri.page)}&uid=${view.uid }"><button class="list_btn">수정</button></a>
		</c:if>
	</div>
	
	
	<!-- test.jsp 내용 추가 -->
	<!-- <script> var uid = 값; 매칭 처리 수정 -->
	<div class="test">
	<%@ include file="test.jsp" %>
	</div>
	<br>
	
	<br><br><br><br><br><br>
	
	<!-- <div class="create_ctn2"> -->
	<!-- 	<dl class="updown1"> -->
	<!-- 		<dd class="updown_box1" style="padding-top: 10px;">윗글</dd> -->
	<!-- 		<dd class="updown_box2" style="padding: 12px 0px 12px 30px; font-weight:normal; font-size: 14px"> -->
	<%-- 			<c:choose> --%>
	<%-- 				<c:when test="${sessionScope.id eq view.id || sessionScope.level >= 10}"> --%>
	<%-- 					<a href="/board/view${pageMaker.makeSearch(pageMaker.cri.page)}&uid=${view.uid -1 }">${previous.subject }</a> --%>
	<%-- 				</c:when> --%>
	<%-- 				<c:otherwise><span style="cursor:pointer" onclick="aaa()">비밀글입니다.</span></c:otherwise> --%>
	<%-- 			</c:choose> --%>
	<!-- 		</dd> -->
	<!-- 	</dl> -->
	<!-- 	<dl class="updown2"> -->
	<!-- 		<dd class="updown_box1" style="padding-top: 10px;">아랫글</dd> -->
	<!-- 		<dd class="updown_box2" style="padding: 12px 0px 12px 30px; font-weight:normal; font-size: 14px"> -->
	<%-- 			<a href="/board/view${pageMaker.makeSearch(pageMaker.cri.page)}&uid=${view.uid +1 }">${next.subject }</a> --%>
	<!-- 		</dd> -->
	<!-- 	</dl> -->
	<!-- </div> -->
	
	<script>
	function aaa(){
		alert("해당 글 작성자와 관리자만 볼 수 있습니다.");
	}
	
	</script>
	

<%@ include file="/WEB-INF/views/include/footer.jsp" %>