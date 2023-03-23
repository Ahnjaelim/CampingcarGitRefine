<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="mn" value="1" />
<c:set var="sn" value="2" />

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>오시는 길 - 자바 캠핑카</title>
<%@ include file="../include/plugin.jsp" %>
    <!-- AOS 라이브러리 불러오기-->
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
<script>
window.addEventListener('load',function(){
	window.scrollTo(0,550);
}); //자동으로 스크롤내려주기
</script>

<link href="${contextPath}/resources/css/sub_all.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/kakaomap.css" rel="stylesheet" />

<style>

.directionimg{
width: 150px;
height: 80px;

}


</style>

	
</head>
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

<style>
.direction table {background:#f0f0f0; width:100%; border:1px solid #dcdcdc;}
.direction td {padding:30px 30px 30px 0px;}
.direction td:nth-child(1) {padding-left:30px;}
.direction h3 {font-size:20px; padding:0px 0px 10px 0px; font-weight:bold;}
.direction td p {padding:7px 0px 0px 0px;}

</style>

<div class="direction">

	<!-- kakao map api start -->
	<table>
	<colgroup>
		<col width="15%" />
		<col width="35%" />
		<col width="15%" />
		<col width="35%" />
	</colgroup>
	<tr>
		<td data-aos="zoom-out-right" data-aos-duration="1000" >
			<img class="directionimg" src="${contextPath }/resources/img/direction/direction2.png" alt="위치마커" />
		</td>
		<td data-aos="zoom-out-right" data-aos-duration="1000">
			<h3>오시는길</h3>
			<p>수원역 지하상가 13번출구 1분거리 (CU편의점건물3층)</p>
			<p>경기도 수원시 매산로1가 11-9,세진브론즈빌 3층</p>
		</td>
		<td data-aos="zoom-out-left" data-aos-duration="1000">
			<img class="directionimg" src="${contextPath }/resources/img/direction/direction1.png" alt="핸드폰" />
		</td>
		<td data-aos="zoom-out-left" data-aos-duration="1000">
			<h3>고객센터</h3>
			<p>언제라도 문의 주세요.</p>
			<p>031)253-5225</p>
		</td>
	</tr>
	</table>

	<div data-aos="zoom-out-up" data-aos-duration="1000">
		<div class="container" id="map" style="width:1200px;height:400px;"></div>
	</div>
	
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=08c7f5459534f8433e8a8e73d7707bc1&libraries=services"></script>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
  mapOption = { 
        center: new kakao.maps.LatLng(37.268049, 127.000299), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption);

var imageSrc = '${contextPath}/resources/img/direction/campingcarlogo.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(40, 45), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(22, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
    markerPosition = new kakao.maps.LatLng(37.268049, 127.000299); // 마커가 표시될 위치입니다

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
  position: markerPosition,
  image: markerImage // 마커이미지 설정 
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);  

// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
var content = '<div class="customoverlay">' +    
    '    <span class="title">자바 캠핑카</span>' +    
    '</div>';

// 커스텀 오버레이가 표시될 위치입니다 
var position = new kakao.maps.LatLng(37.268049, 127.000290);  

// 커스텀 오버레이를 생성합니다
var customOverlay = new kakao.maps.CustomOverlay({
    map: map,
    position: position,
    content: content,
    yAnchor: 1 
});
</script>
<!-- kakao map api end -->


 

<!-- ================================================== -->		
		</div> <!-- // #body_contents end -->
	</div><!-- // #wrap end -->
	
	<!-- #footer start -->
	<%@ include file="../include/footer.jsp" %>
	<!-- //#footer end -->
	
</div>
 
<!-- // #container end -->
<script> 
AOS.init(); // 자바스크립트로 init()을 해야 동작한다.
</script>

</body>
</html>