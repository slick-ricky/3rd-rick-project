<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<head>
      <meta charset="utf-8">
      <title>Responsive Owl-Carousel Slider | CodingNepal</title>
      <link rel="stylesheet" href="style.css">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">

<style>

@import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');

main{
  min-height: 320px;
  display: flex;
  align-items: center;
  background: #f1e5cb;
}
.wrapper{
  width: 100%;
  margin-top: 0px;
}
.carousel{
  max-width: 100%;
  margin: auto;
  padding: 0 30px;
}
.carousel .slide{
  color: black;
  margin: 20px 0;
  text-align: center;
  font-size: 90px;
  font-weight: 600;
  border-radius: 10px;
  box-shadow: 0px 4px 15px rgba(0,0,0,0.2);
  width: 200px;
}

.owl-dots{
  text-align: center;
  margin-top: 0px;
}
.owl-dot{
  height: 15px;
  width: 35px;
  margin: 0 5px;
  outline: none;
  border-radius: 14px;
  border: 2px solid #007a48!important;
  box-shadow: 0px 4px 15px rgba(0,0,0,0.2);
  transition: all 0.3s ease;
}
.owl-dot.active,
.owl-dot:hover{
  background: #007a48!important;
}


</style>

<main>	


<div class="wrapper">
   <div class="carousel owl-carousel">
        <div class="slide">
			<a href="/item/view?it_category=1&it_uid=9"><img src="/img/apo.png"/></a>
		</div>
		<div class="slide">
			<a href="/item/view?it_category=1&it_uid=19"><img src="/img/cb_float.png"/></a>
		</div>
		<div class="slide">
			<a href="/item/view?it_category=1&it_uid=8"><img src="/img/classic_apo.png"/></a>
		</div>
		<div class="slide">
			<a href="/item/view?it_category=1&it_uid=13"><img src="/img/esp_con.png"/></a>
		</div>
		<div class="slide">
			<a href="/item/view?it_category=1&it_uid=6"><img src="/img/ice_amr.png"/></a>
		</div>
		<div class="slide">
			<a href="/item/view?it_category=1&it_uid=20"><img src="/img/ice_capp.png"/></a>
		</div>
		<div class="slide">
			<a href="/item/view?it_category=1&it_uid=7"><img src="/img/ice_dol.png"/></a>
		</div>
		<div class="slide">
			<a href="/item/view?it_category=1&it_uid=12"><img src="/img/java_fra.png"/></a>
		</div>
		<div class="slide">
			<a href="/item/view?it_category=1&it_uid=11"><img src="/img/machi.png"/></a>
		</div>
		<div class="slide">
			<a href="/item/view?it_category=1&it_uid=18"><img src="/img/rvd_cafe_breve.png"/></a>
		</div>
		<div class="slide">
			<a href="/item/view?it_category=1&it_uid=12"><img src="/img/w_moca_fra.png"/></a>
		</div>
		<div class="slide">
			<a href="/item/view?it_category=2&it_uid=22"><img src="/img/omija.png"/></a>
		</div>
		<div class="slide">
			<a href="/item/view?it_category=2&it_uid=25"><img src="/img/jeju_malcha.png"/></a>
		</div>
		<div class="slide">
			<a href="/item/view?it_category=2&it_uid=26"><img src="/img/youthberry.png"/></a>
		</div>
		<div class="slide">
			<a href="/item/view?it_category=2&it_uid=24"><img src="/img/chamomile.png"/></a>
		</div>
		<div class="slide">
			<a href="/item/view?it_category=4&it_uid=32"><img src="/img/caramel_dennypin.png"/></a>
		</div>
		<div class="slide">
			<a href="/item/view?it_category=5&it_uid=35"><img src="/img/shucream baumcuhen.png"/></a>
		</div>
		<div class="slide">
			<a href="/item/view?it_category=5&it_uid=36"><img src="/img/shinemuscat sweetbox.png"/></a>
		</div>
   </div>
</div>
      
<script>
   $(".carousel").owlCarousel({
     margin: 20,
     loop: true,
     autoplay: true,
     autoplayTimeout: 2000,
     autoplayHoverPause: true,
     responsive: {
       0:{
         items:1,
         nav: false
       },
       600:{
         items:2,
         nav: false
       },
       1000:{
         items:3,
         nav: false
       },
       1000:{
         items:4,
         nav: false
       },
       1000:{
         items:5,
         nav: false
       },
       1000:{
         items:6,
         nav: false
       },
       1000:{
         items:7,
         nav: false
       },
       1000:{
         items:8,
         nav: false
       }
     }
   });
</script>

</main>

<style>

	.all {
		min-height: 800px;
		padding-top:30px;
		width: 100%;
		background: #ebc5a0;
		display: flex;
		justify-content: space-evenly;
		margin-top: 0px;
		margin-block-end: -50px;
	}

	.score_ctn {
		
		margin-block-start: 15px;
		border: 0px solid black;
		border-radius: 10px;
		height: 680px;
		width: 800px;
		background: #eeeeee;
		
	}
	
	.new_ctn {
		
		margin-block-start: 15px;
		background: #f6f5ef;
		border: 0px solid black;
		border-radius: 10px;
		min-height: 300px;
		width: 1000px;
		margin-bottom: 35px;
		padding-top: 1px;
		padding-left: 40px;
		
	}
	
	.season_ctn {
		border: 0px solid black;
		border-radius: 10px;
		background: #fffef2;
		min-height: 300px;
		width: 1000px;
		padding-top: 5px;
		padding-left: 40px;
	}

	.t1 {
		margin: 20px 0px 0px 20px;
		border: 1px solid black;
		width: 700px;
		border-collapse: collapse;
	}
	
	.t2 {
		margin: 20px 0px 0px 20px;
		border: 1px solid black;
		width: 400px;
		border-collapse: collapse;
	}
	
	.star_rating {font-size:0; letter-spacing:-4px; margin-top:6px;}
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
	
	.goods_ctn {
	margin-top: 10px;
	margin: auto;
	border: 0px solid blue;
	display: flex;
	flex_direction: row;
	justify-content: space-evenly;
	flex-wrap: wrap;
	width: 780px;
	min-height: 580px;
	}
	
	.goods_box {
		width: 200px;
		height: 200px;
		border: 0px solid black;
		margin-bottom: 30px;
	}
	
	.goods_img {
		width: 100%;
		height: 89%;
	}
	
	.goods_desc {
		padding-top: 10px;
		height: 60px;
		font-size: 13px;
		overflow:hidden; 
		text-overflow:ellipsis; 
		white-space:nowrap;
		border: 0px solid black;
	}
	
	ul {
		list-style: none;
	}
	#sdsdsd{
		filter: inherit;
		font-weight: normal;
		font-size: 12px;
		color: gray;
		margin-bottom:-10px;
		display: inline-block;
		
	}
	
	table, td {
		border-collapse: collapse;
	}
	
	.ctn2 {
		
	}
	
	.it_desc {
		width: 200px;
		height: 30px;
		overflow:hidden; 
		text-overflow:ellipsis; 
		white-space:nowrap;
		margin-top: 5px;
		color: gray;
		font-size: 11px;
	}
</style>

<div class="all">
	<div class="score_ctn">
		<p style="margin:20px 0px 25px 60px; "><b><font color="#007a48">TOP 6</font> 리뷰상품 소개</b></p>
		<div class="main_box">
		<ul class="goods_ctn">
			<c:set var="number" value="1"/>
			<c:forEach var="list" items="${list }">
				<li class="goods_box">
					<p style="margin-bottom:10px; font-size:13px; color:#007a48;"><b>${number}위</b><span style="font-size:12px; color:gray; padding-left:3px;">(<fmt:formatNumber value="${list.avg_score }" pattern=".00"/>점)</span></p>
					<div class="goods_img"><a href="/item/view?it_category=${list.it_category }&it_uid=${list.it_uid}"><img src="/upload/${list.file1 }" width=100% height=100%></a></div>
					<div class="goods_desc">
						<div><b>${list.it_name }</b></div>
						<div class="star_rating" style="color:black;border:0px solid red">
							<div>
							    <a href="#" id='<c:if test="${list.avg_score >= 1}">on</c:if>'><img src="/img/star.png" width="18px" height="18px"></a>
							    <a href="#" id='<c:if test="${list.avg_score >= 2}">on</c:if>'><img src="/img/star.png" width="18px" height="18px"<c:if test="${list.avg_score < 2}">style="filter: brightness(0.5);"</c:if>></a>
							    <a href="#" id='<c:if test="${list.avg_score >= 3}">on</c:if>'><img src="/img/star.png" width="18px" height="18px"<c:if test="${list.avg_score < 3}">style="filter: brightness(0.5);"</c:if>></a>
							    <a href="#" id='<c:if test="${list.avg_score >= 4}">on</c:if>'><img src="/img/star.png" width="18px" height="18px"<c:if test="${list.avg_score < 4}">style="filter: brightness(0.5);"</c:if>></a>
							    <a href="#" id='<c:if test="${list.avg_score >= 5}">on</c:if>'><img src="/img/star.png" width="18px" height="18px"<c:if test="${list.avg_score < 5}">style="filter: brightness(0.5);"</c:if>></a>
							
								<a id="sdsdsd">(${list.it_count })</a>
								
							</div>
						</div>
					</div>
				</li>
			<c:set var="number" value="${number + 1}"/>
			</c:forEach>
		</ul>
	</div>
	</div>
	<div class="ctn2">
		<div class="new_ctn">
			<p style="margin:15px 0px 15px 5px;"><b><font color="#007a48">New Brand</font> 상품</b> <font size="1px" color="gray">(가장 최근 업데이트 4건)</font></p>
			<table border=0 style="margin:auto; font-size:13px;">
				<tr>
					<c:forEach var="list2" items="${list2}">
						<td width=200 height=250 align=center>	
							<table width=100% border=0 align=center>
								<tr>
									<td height=32><b>${list2.it_name }</b></td>
								</tr>
								<tr>
									<td height=180><a href="/item/view?it_category=${list2.it_category }&it_uid=${list2.it_uid}"><img src="/upload/${list2.file1 }" width=100% height=100%></a></td>
								</tr>
								<tr>
									<td height=50>
										<p style="margin-top:5px;">${list2.it_price }원</p>
										<p class="it_desc">${list2.it_desc }</p>
									</td>
								</tr>
							</table>
						</td>
						<td width=40></td>
					</c:forEach>
				</tr>
			</table>	
		</div>
		<div class="season_ctn">
			<p style="margin:10px 0px 15px 5px;"><b><font color="#007a48">Season</font> 상품</b> <font size="1px" color="gray">(가장 최근 업데이트 4건)</font></p>
			<table border=0 style="margin:auto; font-size:13px;">
				<tr>
					<c:forEach var="list3" items="${list3}">
						<td width=200 height=250 align=center>	
							<table width=100% border=0 align=center>
								<tr>
									<td height=32><b>${list3.it_name }</b></td>
								</tr>
								<tr>
									<td height=180><a href="/item/view?it_category=${list3.it_category }&it_uid=${list3.it_uid}"><img src="/upload/${list3.file1 }" width=100% height=100%></a></td>
								</tr>
								<tr>
									<td height=50>
										<p style="margin-top:5px;">${list3.it_price }원</p>
										<p class="it_desc">${list3.it_desc }</p>
									</td>
								</tr>
							</table>
						</td>
						<td width=40></td>
					</c:forEach>
				</tr>
			</table>	
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/include/footer.jsp" %> 

