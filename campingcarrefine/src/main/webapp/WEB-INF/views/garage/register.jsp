<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="mn" value="8" />
<c:set var="sn" value="2" />

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script>

$(document).ready(function(){  
     
       //유효성검사
    $("#register").on("click", function(){
    	
       if($("#garage_name").val()==""){
          alert("정비소명을 입력해주세요.");
          $("#garage_name").focus();
          return false;
       }
       //유효성검사
       if($("#garage_addr").val()==""){
          alert("주소를 입력해주세요.");
          $("#garage_addr").focus();
          return false;
       }
       //유효성검사
       if($("#garage_code").val()==""){
          alert("지역을 선택해주세요.");
          $("#garage_code").focus();
          return false;
       }
      
       alert('정비소 등록신청이 완료되었습니다')
    });
 })
</script>



<meta charset="UTF-8">
<title>자바 캠핑카 - 정비소 등록신청</title>
<%@ include file="../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/sub_all.css" rel="stylesheet" />
<style>
.fs-2{
	position: relative;
}
.helpimg{
width: 35px;
position: absolute;
top: 16px;
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
		<%@ include file="../include/submenu.jsp" %>
			
		<div id="body_contents" style="padding: 30px 0px 120px 0px">

<p class="fs-2"style="text-align: center">정비소 등록 신청  


 <img class="helpimg" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal"
 src="${contextPath }/resources/img/garage/help.png" alt="등록 유의사항"/>
</p>

<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" >
      <div class="modal-header" style="text-align: center;" >
        <h2 "class="modal-title fs-5" id="exampleModalLabel">정비소 등록신청 참고사항</h2>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       1. 정비소 명과 주소를 정확하게 기입해주세요
			<br>- 정비소 명과 정비소 주소를 확인하여 정확하지 않을경우 신청이 거부될 수 있습니다.
       
      </div>
      <div class="modal-footer">
        
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
<br>
<!-- ================================================== -->

<div class="board_write" style="width: 60%; margin: 0 auto;">
	<form action="register" method="post">
		
	<div class="input-group">
		<span class="input-group-text">정비소 명</span>
		<input autocomplete="off" type="text" class="form-control" id="garage_name" name="garage_name"  placeholder="정비소명 입력"/>
	</div>
		
	<div class="input-group">
		<span class="input-group-text">정비소 주소</span>
		<input autocomplete="off" type="text" class="form-control" id="garage_addr" name="garage_addr"  placeholder="정비소 주소 입력" />
	</div>
	<div class="input-group">
		<span class="input-group-text">정비소 연락처</span>
		<input autocomplete="off" type="text" class="form-control" name="garage_phone" placeholder="정비소 연락처 입력" />
	</div>
	<div class="input-group">
		<span class="input-group-text" >정비소 영업상태</span>
			<div class="group" style="text-align: center; padding-top: 5px; border:1px solid #d9d9d9; 
			border-radius : 0px 5px 5px 0px; width: 72%">
				<input type="radio" name="garage_state" value="1" checked="checked"/>
				<label for="rb1" style="padding-right: 50px">영업중</label>
			    
				<input type="radio" name="garage_state" value="2"  />
				<label for="rb2">휴업중</label>			    
			</div>			
	</div>
	<div class="input-group" style="width:100%">
		<span class="input-group-text">정비소 지역</span>	
					<select id="garage_code" name="garage_code" size="1" 
					style="color:#6e6e6e; border-radius: 5px; border:1px solid #ccc; width: 72%">			
							<option value="" >지역을 선택하세요.</option>
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
						
	<div class="input-group" style="display: none;">
		<span class="input-group-text">정비소등록상태</span>
		<input type="text" class="form-control" name="state_modify" value="0"/>
	</div>
	<div style="float: right">
		<button type="submit" id="register" class="btn btn-outline-secondary">정비소 등록하기</button>
		<button type="button" class="btn btn-outline-danger"
		onclick='location.href="${contextPath }/garage/list?keyword="'
		>돌아가기</button>
	</div>
	</form>
</div>	


<!-- ================================================== -->
		</div> <!-- // #body_contents end -->
	</div><!-- // #wrap end -->
	
	<!-- #footer start -->
	<%@ include file="../include/footer.jsp" %>
	<!-- //#footer end -->
	
</div><!-- // #container end -->

</body>
</html>