<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%

String code_title="";

if(code.equals("board")){
	code_title="공지사항";
}else if(code.equals("free")){
	code_title="자유게시판";
}else if(code.equals("qna")){
	code_title="문의사항";
}

%>

<style>

.title {
	margin-left: 22%;
	margin-block-start: 30px;
	height: 100px;
	font-size: 27px;
	font-weight: bold;
}
</style>

<div class="title"><%=code_title%></div>