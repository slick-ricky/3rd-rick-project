<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<style>
.tt {
	margin: auto;
	padding-top: 30px;
	padding-bottom: 30px;
	width: 900px;
	font-size: 27px;
}

.create_ctn {
	margin: auto;
	width: 900px;
	height: 550px;
	border: 0px solid lightgray;
}

input {
	margin-left: 20px;
	width: 800px;
	height: 40px;
	font-size: 15px;
	border: 1px solid #dddddd;
	padding: 10px;
}

input:focus {
	border: 1px solid #3168db;
	box-shadow: 0px 0px 8px #003ea8;
	outline:none;
}

textarea {
	width: 900px;
	height: 200px;
	font-size: 16px;
	color: gray;
	border: 1px solid #dddddd;
	padding: 10px;
}

textarea:focus {
	border: 1px solid #3168db;
	box-shadow: 0px 0px 8px #003ea8;
	outline:none;
}

.slt {
	height: 40px;
	font-size: 15px;
	border: 1px solid #dddddd;
	color: #757575;
}

.slt:focus {
	border: 1px solid #3168db;
	box-shadow: 0px 0px 8px #003ea8;
	outline:none;
}

.subj {
	border-top: 0px solid #333333;
	border-bottom: 0px solid #333333;
	height: 70px;
	padding-top: 10px;
	display: flex;
	
}

.ctt {
	border-bottom: 0px solid lightgray;
	padding-top: 20px;
	padding-bottom: 20px;
	
}

.list_btn {
	float: right;
	margin-top: 20px;
	margin-bottom: 50px;
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

.create_btn {
	margin-left: 45%;
	margin-top: 40px;
	margin-bottom: 40px;
	background-color: #666666;
	color: white;
	width: 90px;
	height: 35px;
	font-size: 16px;
	font-weight: bold;
	border-radius: 5px;
	cursor: pointer;
}

.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: #efefff;
	margin-top: 10px;
}

small {
	margin-left: 3px;
	font-weight: bold;
	color: gray;
}

main {
	height: 700px;
}
</style>


<main>
<h1 class="tt">글쓰기</h1>


<div class="create_ctn">
	<form id='registerForm' role="form" method="post" onsubmit="return ok()">
	
	<div class="subj">
		<select name="gongji" id="gongji" class="slt" >
				<option value="">===선택===</option>
				<c:if test="${sessionScope.level >= 10 }">
				<option value="1">공지</option>
				</c:if>
				<option value="2">일반</option>
				<option value="3">비밀</option>
		</select>
		<input name="subject" placeholder="제목을 입력하세요." value="">
	</div>
	<div class="ctt">
		<textarea name="content" placeholder="내용을 입력하세요." value=""></textarea>
	</div>
	<div>
		<label for="exampleInputEmail1"><font color="gray">File DROP Here</font></label>
		<table class="fileDrop"><tr></tr></table>
			<ul class="uploadedList"></ul>
	</div>
	<div><button class="create_btn">작성하기</button></div>
	</form>
</div>
</main>
<br><br><br>

<!-- 아래 <스크립트> 모두 추가 -->
<script>
	$(".fileDrop").on("dragenter dragover", function(event) {
		// 이벤트 처리를 제한한다.
		// 파일을 영역에 끌어다 놓아도 아무런 변화가 없게 처리
		event.preventDefault();
	});

	$(".fileDrop").on("drop", function(event){
		event.preventDefault();

		// event.originalEvent : 전달된 파일 데이터를 가져오는 부분
		// event.dataTransfer : 이벤트와 같이 전돨된 데이터를 의미하고, 
		// 그 안에 포함된 파일 데이터를 찾아내기 위해서 dataTransfer.files를 이용한다.
		var files = event.originalEvent.dataTransfer.files;
		var file = files[0];

		//console.log(file);

		// formData : <form> 태그로 만든 데이터 전송 방식과 동일하게 데이터를 전송할 수 있다.
		var formData = new FormData();
		formData.append("file", file); // 파일 객체를 추가

		// 파일 데이터를 전송하기 위해서 processData, contentType ﻿두 옵션을 반드시 false ﻿지정
		// 두개의 옵션은 데이터 전송을 <form> 태그를 이용하는 파일 업로드와 동일하게 해주는 역활
		//url: 절대경로 슬러시 삭제
		$.ajax({
			url: 'uploadAjax',
			data: formData,
			dataType:'text',
			processData: false,
			contentType: false,
			type: 'POST',
			success: function(data){
				//alert(data);
				
				//추가 페이지
				var str ="";

				if(checkImageType(data)){
					str = "<td><a href=displayFile?fileName="+getImageLink(data)+">"
						  +"<img src='displayFile?fileName="+data+"'/>"
						  +"</a><small data-src="+data+" style='cursor:pointer' title='삭제'>X</small></td>";
				}else{
					str = "<td><a href='displayFile?fileName="+data+"'>" 
						  + getOriginalName(data)+"</a>"
						  +"<small data-src="+data+" style='cursor:pointer' title='삭제'>X</small></div></td>";
				}

				$(".uploadedList").append(str);
			}
		});
	});
	
	$(".uploadedList").on("click", "small", function(event){
	   var that = $(this);			

		//url: 절대경로 슬러시 삭제 
		$.ajax({
			url:"deleteFile",
			type:"post",
			data: {fileName:$(this).attr("data-src")},
			dataType:"text",
			success:function(result){
				if(result == 'deleted'){
					that.parent("div").remove();//화면에서 삭제처리
				}
			}
		});
	});
	//삭제 설명
	//사용자가 <small>태그로 처리된 'x'를 클릭하면 
	//'data-src'속성값으로 사용된 파일의 이름을 얻어와서 POST 방식으로 호출처리
	
	//글쓰기 버튼 클릭시 첨부내용 <input>태크 포함 처리
	$("#registerForm").submit(function(event){
		event.preventDefault();
	
		var that = $(this);	
		var str ="";	
	
		$(".uploadedList small").each(function(index){	
			str += "<input type='text' name='files["+index+"]' value='"+$(this).attr("data-src") +"'> ";	
		});	
	
		if($("#gongji").val() == ""){
			alert("분류를 선택하세요.");
			gongji.focous();
			return false;
		}else{
			that.append(str);	
			that.get(0).submit();
		}
			
	});
</script>

<script>
// 파일 첨부시 이름만 뽑아오는 코드
function getOriginalName(fileName){
	if(checkImageType(fileName)){
		return;
	}			

	var idx = fileName.indexOf("_") + 1 ;

	return fileName.substr(idx);
}

function getImageLink(fileName){
	if(!checkImageType(fileName)){
		return;
	}

	var front = fileName.substr(0,12); //년,월,일 경로 추출하는 용도
	var end = fileName.substr(14); //파일 이름 앞의 's_'까지의 값

	return front + end; //'s_'값을 제외한 결과 값
}

//전송 문자열이 이미지 파일인지 확인 여부
function checkImageType(fileName){
	var pattern = /jpg|gif|png|jpeg/i;

	return fileName.match(pattern);
}
</script>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>