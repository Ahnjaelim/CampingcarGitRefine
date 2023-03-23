<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ include file="../admin/rent/category.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="mn" value="1" />
<c:set var="sn" value="1" />
<c:set var="member" value="${sessionScope.user }" />
<c:set var="ismember" value="1" />
<c:if test="${member.car_uid eq '' or member.car_uid eq null }">
   <c:set var="ismember" value="0" />
</c:if>

<!DOCTYPE html>
<html>
   <meta name="viewport" content="width=device-width, initial-scale=1">   
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<title>자바 캠핑카</title>
<%@ include file="../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/sub_all.css" rel="stylesheet" />
</head>

<style>
* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 0px;
  width: 0px;
  margin: 0 0px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 1.0s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 2.0s;
  animation-name: fade;
  animation-duration: 7.5s;
}

@-webkit-keyframes fade {
  from {opacity: .2} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .2} 
  to {opacity: 1}
}


</style>

<body>

<div id="container">
   <!-- #header start -->
   <%@ include file="../include/header.jsp" %>
   <!--// #header end -->
   
   <div id="body_head">
      <h2>${menuMap[mn]['sub'][sn]['title'] }</h2>
      <div class="location">
         HOME　<i class="fa-solid fa-circle-chevron-right"></i>　${menuMap[mn]['title'] }　<i class="fa-solid fa-circle-chevron-right"></i>　<span>${menuMap[mn]['sub'][sn]['title'] }</span>
      </div>
   </div>
   
   <div id="wrap">

      <!-- #submenu start -->
      <%@ include file="../include/submenu.jsp" %>
      <!-- // #submenu end -->
   
      
      <div id="body_contents">
<!-- ================================================== -->

<!-- 메인 페이지 이미지 삽입 영역 -->
<!-- 
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
         <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="1" class="active"></li>                        
         </ol>
         <div class="carousel-inner">

<<<<<<< HEAD
   <div class="slider">
            <div class="item active">
               <img src="${contextPath }/resources/img/html/eza03.jpg" width="1223" height="894">
            </div>
            
            </div>
            
         </div>
       
            <span class="glyphicon glyphicon-chevron-left"></span>
         </a>
         <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
         </a>
         <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      
      </div>
   </div>
=======
	<div class="slider">
				<div class="item active">
					<img src="../resources/img/html/eza03.jpg" width="1223" height="894">
				</div>
				
				</div>
				
			</div>
		 
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
		
		</div>
	</div>
>>>>>>> upstream/master
 -->
 
 

<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext"></div>
  <img src="${contextPath }/resources/img/html/004.jpg" style="width:100%">
  
</div>

<div class="mySlides fade">
  <div class="numbertext"></div>
  <img src="${contextPath }/resources/img/html/006.jpg" style="width:100%">
  
</div>

<div class="mySlides fade">
  <div class="numbertext"></div>
  <img src="${contextPath }/resources/img/html/005.jpg" style="width:100%">
  
</div>

</div>
<br>


<div style="text-align:center">
  
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span>    
</div>
 
<script>
var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 7500); // 9초마다 변경
}
</script>
 
 <br>
   

<!-- ================================================== -->      
      </div> <!-- // #body_contents end -->
   </div><!-- // #wrap end -->
   
   <!-- #footer start -->
   <%@ include file="../include/footer.jsp" %>
   <!-- //#footer end -->
   
</div><!-- // #container end -->

</body>
</html>