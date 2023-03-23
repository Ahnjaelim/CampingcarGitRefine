<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="title" value="정비소 정보 수정 및 삭제" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바 캠핑카 - 관리자 페이지</title>
<%@ include file="../../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/admin/admin_all.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/ajsbutton.css" rel="stylesheet" />
<script>

$(document).ready(function(){  
     
	//정비소명 유효성검사
	$("#update").on("click", function(){	 	
		if($("#garage_name").val()==""){
		alert("정비소명을 입력해주세요.");
		$("#garage_name").focus();
		return false;
	}
	//정비소주소 유효성검사
		if($("#garage_addr").val()==""){
	    alert("주소를 입력해주세요.");
	    $("#garage_addr").focus();
	    return false;
	}
	//지역 유효성검사
		if($("#garage_code").val()==""){
	    alert("지역을 선택해주세요.");
	    $("#garage_code").focus();
	    return false;
	}
    alert('정비소정보 수정이 완료되었습니다')
    });
 })
</script>

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


<div class="board_write" style="width: 40%; margin: 0 auto;">
			<h4 style="text-align: center">정비소 정보 수정</h4>
			<br>

			<form method = "post">
			
			<div class="input-group">
				<span class="input-group-text">정비소 명</span>
				<input autocomplete="off" type="text" class="form-control" id="garage_name" name="garage_name"  placeholder="정비소명 입력"
				value="${dto.garage_name }"/>
			</div>
			<div class="input-group">
				<span class="input-group-text">정비소 주소</span>
				<input autocomplete="off" type="text" class="form-control" id="garage_addr" name="garage_addr"  placeholder="정비소 주소 입력"
				value="${dto.garage_addr }" />
			</div>
			<div class="input-group">
				<span class="input-group-text">정비소 연락처</span>
				<input autocomplete="off" type="text" class="form-control" name="garage_phone" placeholder="정비소 연락처 입력" 
				value="${dto.garage_phone }"/>
			</div>
			<div class="input-group">
				<span class="input-group-text" >정비소 영업상태</span>
					 <div class="group" style="margin: 0 auto; padding-top: 5px">
					    <input type="radio" name="garage_state" value="1" checked="checked"/>
					    <label for="rb1" style="padding-right: 50px">영업중</label>
					    
					    <input type="radio" name="garage_state" value="2"  />
					    <label for="rb2">휴업중</label>
					    
			 		</div>
			</div>
			<div class="input-group">
				<span class="input-group-text">정비소 지역</span>
					<select id="garage_code" name="garage_code" size="1"
					style="color:#6e6e6e; border-radius: 5px; border:1px solid #ccc; width: 67%" >			
							<option value="">지역을 선택하세요.</option>
							<option value="41820">가평군</option>
							<option value="41610">경기광주시</option>
							<option value="41280">고양시</option>
							<option value="41290">과천시</option>
							<option value="41210">광명시</option>
							<option value="41310">구리시</option>
							<option value="41410">군포시</option>
							<option value="41570">김포시</option>
							<option value="41360">남양주시</option>						
							<option value="41250">동두천시</option>
							
							<option value="41190">부천시</option>
							<option value="41130">성남시</option>
							<option value="41110">수원시</option>
							<option value="41390">시흥시</option>
							<option value="41270">안산시</option>
							<option value="41170">안양시</option>
							<option value="41630">양주시</option>
							<option value="41830">양평군</option>
							
							<option value="41670">여주시</option>
							<option value="41800">연천군</option>
							<option value="41370">오산시</option>
							<option value="41460">용인시</option>
							<option value="41430">의왕시</option>
							<option value="41150">의정부시</option>
							<option value="41500">이천시</option>
							<option value="41480">파주시</option>
							<option value="41220">평택시</option>
							<option value="41650">포천시</option>
							<option value="41450">하남시</option>
							<option value="41590">화성시</option>						
						</select>
			</div>
			<div style="float: right">	
				<button class="btn btn-outline-success" type="submit" id="update">수정</button>
				<button class="btn btn-outline-danger" type ="reset" value="초기화">초기화</button>
				<button class="btn btn-outline-dark" type="button" onclick='location.href="${contextPath }/admin/garage/list?keyword="'>돌아가기</button>
			</div>
	</form>
</div>

			<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>

<!-- ================================================== -->
	</div><!-- // #wrap end -->
</div><!-- // #container end -->

</body>
</html>