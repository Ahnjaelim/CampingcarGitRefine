<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="category.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
Calendar cal = Calendar.getInstance();
int curYear = cal.get(Calendar.YEAR);
int curMon = cal.get(Calendar.MONTH); // 0:1월 ~ 11:12월
int today = cal.get(Calendar.DATE);
String curMonStr=String.format("%02d", cal.get(Calendar.MONTH)+1);
String indextoday = String.valueOf(curYear)+"-"+curMonStr+"-"+String.format("%02d", today);
pageContext.setAttribute("indextoday", indextoday);

// 달력 한계 설정
int lastYear = curYear;
int lastMon = curMon+1;
if(lastMon>11){
	lastYear = lastYear+1;
	lastMon=0;
}
Calendar tempcal = Calendar.getInstance();
tempcal.set(lastYear, lastMon, 1);
int lastday = tempcal.getActualMaximum(Calendar.DAY_OF_MONTH);
Calendar lastcal = Calendar.getInstance();
lastcal.set(lastYear, lastMon, lastday);
SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
String limitdate = sdf.format(lastcal.getTime());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바 캠핑카 - 관리자 페이지</title>
<%@ include file="../../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/admin/admin_all.css" rel="stylesheet" />
<!-- 데이트 피커 -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<style>

</style>
</head>
<body>

<div id="container">
	<!-- #sidebar start -->
	<%@ include file="../include/sidebar.jsp" %>
	<!-- // #sidebar end -->

	<!-- #topmenu start -->
	<%@ include file="../include/topmenu.jsp" %>
	<!-- // #topmenu end -->	
	
	<div id="wrap">
<!-- ================================================== -->

<div class="board_write">
	<form action="register" method="post">
	
	<input type="hidden" name="user_id" value="admin" />
	<input type="hidden" name="rent_name" value="관리자" />
	<input type="hidden" name="rent_phone1" value="00000000000" />
	<input type="hidden" name="rent_phone2" value="00000000000" />
	<input type="hidden" name="rent_option1" value="0" />
	<input type="hidden" name="rent_option2" value="0" />
	<input type="hidden" name="rent_price" value="${car.car_rentprice }" readonly />
	<input type="hidden" name="rent_paytype" value="0" />
	<div class="input-group">
		<span class="input-group-text">예약 불가 처리</span>
		<input type="text" class="form-control" name="rent_paystate" value="99" readonly />
	</div>
	<div class="input-group">
		<span class="input-group-text">차량 선택</span>
		<select name="car_regid" class="form-control" onchange="if(this.value) location.href='register?car_regid='+(this.value)+'&rent_startdate=${param.rent_startdate}';">
			<c:forEach items="${carlist }" var="car">
				<option value="${car.car_regid }" <c:if test="${param.car_regid==car.car_regid }">selected</c:if>>[${car.car_name }] ${car.car_modelname } </option>
			</c:forEach>
		</select>
	</div>
	<div class="input-group">
		<span class="input-group-text">예약 불가 기간 설정</span>
		<input type="text" name="datefilter" value="" class="form-control" autocomplete="off" required />
		<input type="text" name="diffdays" class="form-control" value="0박 0일" />
		<input type="hidden" name="rent_startdate" value="" required />
		<input type="hidden" name="rent_enddate" value="" required />
	</div>
	<div class="input-group">
		<span class="input-group-text">추가 내용</span>
		<input type="text" class="form-control" name="rent_memo" value="" />
	</div>
	<button type="submit">예약하기</button>
	</form>
</div>		
		
<script type="text/javascript">
$(function() {

  $('input[name="datefilter"]').daterangepicker({
	    "locale": {
	        "format": "YYYY/MM/DD", // 처음 포멧 설정한대로 다른 날짜도 설정
	        "separator": " - ",
	        "applyLabel": "Apply",
	        "cancelLabel": "Cancel",
	        "fromLabel": "From",
	        "toLabel": "To",
	        "customRangeLabel": "Custom",
	        "weekLabel": "W",
	        "daysOfWeek": [
	            "일",
	            "월",
	            "화",
	            "수",
	            "목",
	            "금",
	            "토"
	        ],
	        "monthNames": [
	            "1월",
	            "2월",
	            "3월",
	            "4월",
	            "5월",
	            "6월",
	            "7월",
	            "8월",
	            "9월",
	            "10월",
	            "11월",
	            "12월"
	        ],
	        "firstDay": 0
	    },
	    "minDate": moment().format("YYYY-MM-DD"),
	    "maxDate": "<%=limitdate%>",
	    // "startDate": "${param.re_startday}",
	    // "endDate" :  "${param.re_startday}",
	    autoUpdateInput: false,
	    isInvalidDate: function(date) { //return date.day() != 1;
	    	// return date.format("YYYY-MM-DD")=="2023-01-30" || date.format("YYYY-MM-DD")=="2023-01-29";
	    	return <c:forEach items="${rentlist}" var="rent">date.format("YYYY-MM-DD")=="${rent.key}" || </c:forEach>null
	    }
  });

  $('input[name="datefilter"]').on('apply.daterangepicker', function(ev, picker) {
      $(this).val(picker.startDate.format('YYYY-MM-DD') + ' - ' + picker.endDate.format('YYYY-MM-DD'));
      $('input[name="rent_startdate"]').val(picker.startDate.format('YYYY-MM-DD'));
      $('input[name="rent_enddate"]').val(picker.endDate.format('YYYY-MM-DD'));
      // 숙박일 계산
      var diffdays = picker.endDate.diff(picker.startDate, 'days');
      $('input[name="diffdays"]').val(diffdays+"박 "+(diffdays+1)+"일");
      // 가격 계산
      $('input[name="rent_price"]').val('${car.car_rentprice}');
      var price = parseInt($('input[name="rent_price"]').val())*diffdays;
      $('input[name="rent_price"]').val(price);

  });

  $('input[name="datefilter"]').on('cancel.daterangepicker', function(ev, picker) {
      $(this).val('');
      $('input[name="rent_startdate"]').val('');
      $('input[name="rent_enddate"]').val('');
      $('input[name="diffdays"]').val("0박 0일");
      $('input[name="rent_price"]').val('${car.car_rentprice}');
      
  });

});
</script>	
 
<!-- ================================================== -->
	</div><!-- // #wrap end -->
</div><!-- // #container end -->

</body>
</html>