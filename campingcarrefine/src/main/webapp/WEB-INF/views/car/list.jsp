<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="mn" value="2" />
<c:set var="sn" value="1" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${menuMap[mn]['sub'][sn]['title'] } - 자바 캠핑카</title>
<%@ include file="../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/sub_all.css" rel="stylesheet" />
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
.carlist {width:1300px; clear:both;}
.carlist .card {width:585px; float:left; margin:0px 30px 30px 0px; cursor:pointer; position:relative;}
.carlist .card img {width:260px; height:260px;}
.carlist .card .colalter {float:left;}
.carlist .card .colalter:nth-child(1) {width:260px;}
.carlist .card .colalter:nth-child(2) {width:300px; padding:10px;}
.carlist .card .card-title {font-weight:400;}
.carlist .price {color:#0d6efd; font-weight:400; position:absolute; left:290px; top:200px;}
.carlist .price span { font-weight:400; font-size:24px;}
</style>

<div class="carlist clearfix">
	<c:forEach items="${responseDTO.dtoList }" var="dto">
		<div class="card" onclick="location.href='read?car_regid=${dto.car_regid }';">
		  <div class="row g-0 clearfix">
		    <div class="colalter">
		      <img src="${contextPath }/resources/data/car/${dto.car_file }" alt="" />
		    </div>
		    <div class="colalter">
		      <div class="card-body">
		        <h5 class="card-title">${dto.car_name }</h5>
		        <p class="card-text">${dto.car_detail }</p>
		        <p class="card-text"><small class="text-muted">${fn:replace(dto.car_option, ',', ', ')}</small></p>
		        <p class="price">기본가 <span><fmt:formatNumber value="${dto.car_rentprice }" pattern="#,###" /></span>원</p>
		      </div>
		    </div>
		  </div>
		</div>
	</c:forEach>

</div>

<div class="board_bot">
	<nav aria-label="Page navigation">
		 <ul class="pagination justify-content-center">
		 	<c:if test="${responseDTO.prev }">
		 		<li class="page-item"><a class="page-link" data-num="${responseDTO.start-1 }"><i class="fa-solid fa-angle-left"></i></a></li>
		 	</c:if>
			<c:forEach begin="${responseDTO.start }" end="${responseDTO.end }" var="num">
				<li class="page-item ${responseDTO.page == num?"active":"" }"><a class="page-link" data-num="${num }">${num }</a></li>
			</c:forEach>
		 	<c:if test="${responseDTO.next }">
		 		<li class="page-item"><a class="page-link" data-num="${responseDTO.end+1 }"><i class="fa-solid fa-angle-right"></i></a></li>
		 	</c:if>
		</ul>
	</nav>
</div>
<form action="list" method="get">
<input type="hidden" name="size" value="${pageRequestDTO.size }" />
<div class="search">
	<input type="checkbox" name="types" value="car_modelname" /> 모델명
	<input type="checkbox" name="types" value="car_name" /> 차량명
	<input type="text" name="keyword" class="form-control" value="" />
	<button type="submit" class="btn btn-primary">검색</button>
</div>
</form>

<script>
document.querySelector(".pagination").addEventListener("click", function(e){
	e.preventDefault();
	e.stopPropagation();
	const target = e.target;
	if(target.tagName!=='A'){
		return
	}
	const num = target.getAttribute("data-num");
	self.location = `list?page=\${num}`
},false);
</script>

<!-- ================================================== -->		
		</div> <!-- // #body_contents end -->
	</div><!-- // #wrap end -->
	
	<!-- #footer start -->
	<%@ include file="../include/footer.jsp" %>
	<!-- //#footer end -->
	
</div><!-- // #container end -->

</body>
</html>