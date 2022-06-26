<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%

String code_title="";
if(it_category.equals("1")){
	code_title="커피";
}else if(it_category.equals("2")){
	code_title="티";
}else if(it_category.equals("3")){
	code_title="기타 음료";
}else if(it_category.equals("4")){
	code_title="브래드";
}else if(it_category.equals("5")){
	code_title="케이크";
}else if(it_category.equals("6")){
	code_title="커피용품";
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

<div class="tt"><%=code_title%></div>