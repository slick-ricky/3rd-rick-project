<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<input type="hidden" id="sessionNames" value="${sessionScope.names }">
<input type="hidden" id="sessionLevels" value="${sessionScope.level }">
<input type="hidden" id="sessionId" value="${sessionScope.id }">

<div class="reply_ctn">
<p style="font-size: 20px; font-weight: bold;">댓글</p>
<br>

<b>Total:</b> <span id="total_conunt"></span> 
</div>

<style>
p {
	margin-bottom: 15px;
}

#modDiv {
	width: 300px;
	height: 100px;
	background-color: lightgray;
	position: absolute;
	top: 75%;
	left: 47%;
	margin-top: -50px;
	margin-left: -150px;
	padding: 10px;
	z-index: 1000;
}

.active{
	font-weight:bold;
}

.reply_ctn {
	margin-left: 21%;
	width: 800px;
	border: 0px solid black;
	font-size: 14px;
}

.paging {
	margin: auto;
}

table,td {
	border: 0px solid black;

	line-height: 50px;
}

.reply_list{
	color: #666666;
	font-size: 14px;
}

.input_ctt {
	width: 663px; 
	height:50px; 
	border: 1px solid #dddddd;
	padding-left: 10px;
}

.input_ctt:focus {
	border: 1px solid #3168db;
	box-shadow: 0px 0px 8px #003ea8;
	outline:none;
}

.input_name {
	width: 120px; 
	height:25px; 
	border: 1px solid #dddddd;
	padding-left: 10px;
}

td > button {
	background-color: #666666;
	color: white;
	width: 50px;
	height: 25px;
	font-size: 14px;
	font-weight: bold;
	border-radius: 5px;
	cursor: pointer;
}
</style>

<!-- MOD 버튼 -->
<table id='modDiv' style="display:none;">
	<tr>
		<td class="modal-title"></td>
	</tr>
	<tr>
		<td><input type='text' id='replytext' style="width:400px;"></td>
	</tr>
	<tr>
		<td>
			<button type="button" id="replyModBtn">수정</button>
			<button type="button" id="replyDelBtn">삭제</button>
			<button type="button" id='closeBtn'>닫기</button>
		</td>
	</tr>
</table>

<!-- 글 작성 -->
<div class="reply_ctn">
<c:if test="${sessionScope.id ne null}">
<table border=1 ">
	<tr>
		<td><b>작성자:</b>&nbsp;</td>
		<td><input type='text' name='replyer' id='newReplyWriter' class="input_name" value='${sessionScope.names}' readonly></td>
	</tr>
	<tr>
		<td><b>댓글 내용:</b>&nbsp;</td>
		<td><input type='text' name='replytext' id='newReplyText' class="input_ctt">&nbsp; <button id="replyAddBtn">작성</button></td>
	</tr>
</table>
</c:if>
<br>

<!-- 댓글 목록 출력 영역 -->
<table id="replies" border=1 class="reply_list">

</table>


<center>
	<div class="paging">
		<!-- 페이징 -->
		<table>
			<tr class="pagination">
			</tr>
		</table>
	</div>
</center>
</div>

<script>
var sessionLevel = $("#sessionLevels").val();
var sessionName = $("#sessionNames").val();
var sessionId = $("#sessionId").val();

//var uid = 16; // tbl_board에서 존재하는 uid값 입력
var uid = "${param.uid}"; // tbl_board에서 존재하는 uid값 입력

var replyPage = 1;
getPageList(1);

getAllList();
//리스트 갯수
function getAllList(){
$.getJSON("/replies/all/"+uid,
	function(data){
		$("#total_conunt").text(data.length); //리스트 갯수
	}
);
}

//글 등록
$("#replyAddBtn").on("click",function(){
	var replyer = $("#newReplyWriter").val();
	var replytext = $("#newReplyText").val();
//alert("aa"+uid);
	$.ajax({
		type: 'post',
		url: '/replies/',
		headers: {
			"Content-Type" : "application/json"
		},
		dataType: 'text',
		data:JSON.stringify({
			uid : uid,
			replyer : replyer,
			replytext : replytext
		}),
		success: function(result){
			if(result == 'success'){
				alert("댓글이 등록되었습니다.");
				getAllList(); //목록 출력
				getPageList(1);
				
				//글 작성후 null처리
				$("#newReplyText").val("");
			}
		}
	});
});

//글 수정
$("#replyModBtn").on("click",function(){
	var rno = $(".modal-title").html();
	var replytext = $("#replytext").val();

	$.ajax({
		type:'put',
		url:'/replies/'+rno,
		headers: {
			"Content-Type": "application/json",
			"X-HTTP-Method-Override": "PUT"
		},
		dataType:'text',
		data:JSON.stringify({
			replytext:replytext
		}),		 
		success:function(result){
			if(result == 'success'){
				alert("댓글이 수정되었습니다.");
				$("#modDiv").hide("slow");
				getAllList();
				getPageList(replyPage); 
			}
		}
	});
});

// 글 삭제
$("#replyDelBtn").on("click", function() {
	var rno = $(".modal-title").html();

	$.ajax({
		type : 'delete',
		url : '/replies/' + rno,		
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "DELETE"
		},
		dataType : 'text',
		success : function(result) {
			if (result == 'success') {
				alert("댓글이 삭제되었습니다.");
				$("#modDiv").hide("slow");
				getAllList();
				getPageList(1); 
			}
		}
	});
});

//mode 열기
$("#replies").on("click", ".replyLi button", function() {
	var reply = $(this).parent(); //자기 자신의 부모 요소를 선택한다. <tr>
	var rno = reply.attr("data-rno");
	var replyer = reply.attr("data-replyer");
	var replytext = reply.attr("data-str");

	//alert(rno + " : " + replytext);

	$(".modal-title").html(rno);
	$("#replytext").val(replytext);
	$("#modDiv").show("slow");
});

// mode닫기
$("#closeBtn").on("click", function() {
	$("#modDiv").hide("slow");
	getAllList();
	getPageList(replyPage);
});

//페이징
//페이지 번호를 입력받아 데이터를 처리
//서버에서 전송된 데이터 중 댓글 목록인 list 데이터를 이용해서 댓글 내용 표시
//페이징 처리를 위해 만들어진 pageMaker 데이터를 이용해서 printPaging() 호출
function getPageList(page){
	$.getJSON("/replies/"+uid+"/"+page , function(data){
		var str="";
		$(data.list).each( // Map 타입의 속성 list
				
			function(){
				str += "<tr>"
					+ "<td style='width:100px; font-weight:bold;'>"+ this.replyer + "</td>"
					+ "<td style='width:640px;'>"+ this.replytext +"</td>";
				if(sessionId == this.id || sessionLevel >= 10 ){
				str += "<td data-rno='"+this.rno+"' data-str='"+this.replytext+"' class='replyLi button; '><button>mode</button></td>";
				}
				str += "</tr><tr><td colspan=4 style='border-bottom:1px solid lightgray;'></td></tr>";
			}
		);

		$("#replies").html(str);	 
		printPaging(data.pageMaker); // Map 타입의 속성 pageMaker
	});
}


//pageMaker를 이용해서 화면에 페이지 번호를 출력
//상단에 getPageList(1); 추가
function printPaging(pageMaker){
	var str = "";

	if(pageMaker.prev){
		str += "<td><a href='"+(pageMaker.startPage-1)+"'> << </a></td>";
	}
	for(var i=pageMaker.startPage, len = pageMaker.endPage; i <= len; i++){
		var strClass= pageMaker.cri.page == i?'class=active':''; //현페 페이지 클래스 적용
			str += "<td "+strClass+"><a href='"+i+"'><font color='#666666;'>"+i+"</font></a>&nbsp;</td> ";
	}

	if(pageMaker.next){
		str += "<td><a href='"+(pageMaker.endPage + 1)+"'> >> </a></td>";
	}
	$('.pagination').html(str);
}

//상단에 replyPage=1; 추가
$(".pagination").on("click", "td a", function(event){
	event.preventDefault(); // <a href="">태그의 기본 동작인 페이지 전환을 막는 역활을 한다.
	replyPage = $(this).attr("href"); // 클릭된 페이지의 번호를 얻는 역활을 한다.
	getPageList(replyPage);

});
</script>	
