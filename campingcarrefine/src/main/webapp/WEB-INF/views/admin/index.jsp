<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="rent/category.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바 캠핑카 - 관리자 페이지</title>
<%@ include file="../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/admin/admin_all.css" rel="stylesheet" />
<style>

</style>
</head>
<body>

<div id="container">
	<!-- #sidebar start -->
	<%@ include file="include/sidebar.jsp" %>
	<!-- // #sidebar end -->
	
	<div id="topmenu">
		<h2><i class="fa-solid fa-house"></i> 관리자　<i class="fa-solid fa-angle-right"></i>　대시보드
		<div id="gnb"></div>
	</div>	
	
	<div id="wrap">
<!-- ================================================== -->

<style>
.borderless th, .borderless td {border:none;}
.card-header, .card-header p {font-weight:bold; font-size:18px;}
.card-header i {color:#b4b4b4;}
</style>

<div class="alert alert-primary mb-4" role="alert">
	자바캠핑카 관리자 페이지에 오신 것을 환영합니다.
</div>

<div class="row row-cols-1 row-cols-md-2 g-4">
  <div class="col">
    <div class="card h-100">
      <div class="card-header"><i class="fa-solid fa-crown"></i> 가장 많이 예약된 차량</div>
      <div class="card-body">
		<table class="table center mb-0">
		<colgroup>
			<col width="15%" />
			<col width="*" />
			<col width="15%" />
		</colgroup>
		<thead>
		<tr>
			<th>순위</th>
			<th>차량</th>
			<th>대여 횟수</th>
		</thead>
		<tbody>
		<c:forEach items="${bestcarlist }" var="dto" varStatus="status">
		<tr<c:if test="${status.count==5 }"> class="borderless"</c:if>>
			<th>${status.count }위</th>
			<td class="text-start"><a href="${contextPath }/admin/car/read?car_regid=${dto.car.car_regid }&comp_id=0">[${dto.car.car_modelname }] ${dto.car.car_name }</a></td>
			<td>${dto.cnt }</td>
		</tr>
		</c:forEach>
		</tbody>
		</table>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card h-100">
      <div class="card-header"><i class="fa-solid fa-chart-simple"></i> 일간 예약 통계</div>
      <div class="card-body" style="padding:40px 10px 10px 10px;">
      	<canvas id="myAreaChart" width="100%" height="40"></canvas>      
      </div>
    </div>
  </div>
</div>

<div class="col mt-4">
<div class="card">
	<div class="card-header" style="position:relative;">
		<p><i class="fa-solid fa-bars"></i> 최신 예약 목록</p>
		<p style="position:absolute; right:17px; top:8px;"><a href="${contextPath }/admin/rent/list" style="color:#b4b4b4;">MORE <i class="fa-solid fa-caret-right"></i></a></p>
	</div>
	<div class="card-body">
		<table class="table table-bordered mb-0 table-hover center">
		<colgroup>
			<col width="15%" />
			<col width="15%" />
			<col width="*" />
			<col width="15%" />
			<col width="15%" />
		</colgroup>
		<thead>
			<th>#</th>
			<th>예약자</th>
			<th>차량</th>
			<th>예약 등록일</th>
			<th>예약 상태</th>
		</thead>
		<tbody>
		<c:forEach items="${latestrentlist }" var="dto" varStatus="status">
		<tr style="cursor:pointer;" onclick="location.href='${contextPath }/admin/rent/read?rent_id=${dto.rent_id}&listtype=list';">
			<th>${dto.rent_id }</th>
			<td>${dto.rent_name }</td>
			<td>${dto.car.car_modelname } ${dto.car.car_name }</td>
			<td><fmt:formatDate value="${dto.rent_datetime }" pattern="yyyy-MM-dd"/></td>
			<td><p class="state type0${dto.rent_paystate }">${cateArr[dto.rent_paystate] }</p></td>
		</tr>
		</c:forEach>
		</tbody>
		</table>
	</div>
</div>
</div>



<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>

<script>
//Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Area Chart Example
var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: [<c:forEach items="${dailychart}" var="map">"${map.date}",</c:forEach>],
    datasets: [{
      label: "Sessions",
      lineTension: 0.3,
      backgroundColor: "rgba(2,117,216,0.2)",
      borderColor: "rgba(2,117,216,1)",
      pointRadius: 5,
      pointBackgroundColor: "rgba(2,117,216,1)",
      pointBorderColor: "rgba(255,255,255,0.8)",
      pointHoverRadius: 5,
      pointHoverBackgroundColor: "rgba(2,117,216,1)",
      pointHitRadius: 50,
      pointBorderWidth: 2,
      data: [<c:forEach items="${dailychart}" var="map">"${map.cnt}",</c:forEach>],
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 30,
          maxTicksLimit: 5
        },
        gridLines: {
          color: "rgba(0, 0, 0, .125)",
        }
      }],
    },
    legend: {
      display: false
    }
  }
});

</script>



<!-- ================================================== -->
	</div><!-- // #wrap end -->
</div><!-- // #container end -->

</body>
</html>