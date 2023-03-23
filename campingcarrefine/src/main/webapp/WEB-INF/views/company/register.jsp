<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<title>파트너 제휴 신청</title>
<%@ include file="../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/sub_all.css" rel="stylesheet" />
</head>

<body>

<div id="container">
	<!-- #header start -->
	<%@ include file="../include/header.jsp" %>
	<!--// #header end -->
	
	<div id="body_head">
		<h2>파트너 제휴 신청</h2>
		<div class="location">
			HOME　<i class="fa-solid fa-circle-chevron-right"></i> 　<span>파트너 제휴 신청</span>
		</div>
	</div>
		<div id="wrap">
		<div id="submenu">
			<ul>
				<li class="on"><a href="#">파트너 제휴 신청</a></li>
			</ul>
		</div>
	<div id="body_contents">
	  <!-- Main content -->
 		<!-- Main content -->
    <section class="content container-fluid">
		<div>
		  <div class="table-responsive">
		  <table  width="100%" border="1">
				  <colgroup>
				</colgroup>
				<thead>
				</thead>
				<tbody>
			<div class="container text-center">
			<br>
		  <h4><b>자바 캠핑카 파트너 제휴 문의</b></h4>
		  </div>
		  <br>
		  <tr><br>
		  	<td style="text-align: center"><h6><br>'자바 캠핑카'는 우수한 캠핑카 렌트 / 대여 플랫폼 입니다<br> 파트너로 등록하시면 , 더 많은 고객을 약속드릴 수 있고<br>
			 자잘한 고객응대나 문의에 고생하지 않으셔도 됩니다.<br>
			<br>
			<br>
			아래 내용을 입력해 주시면,<br>
			<br>
			영업일 1~2일 이내에 담당자가 연락드리겠습니다.<br>
			<br>
			<br>
			<br>
			감사합니다.<br><br>
			</h6>
			</td>
		  </tr>
			</table>
			</tbody>
			</div>
			</div>
			<br>
			<br>
			<br>
			<br>
			<br>
			<div>
			<br>
		<form role="form" method="POST" action="register">
		<table width="100%" border="1">
			<div class="container text-center">
			<h4><b>제휴 신청 양식</b></h4>
			</div>
			<br>
			
				<tr>
					<td>	
					<br>			
					<div class="container text-left">
						<label><h5><b>회사명</b></h5></label>
						<input type="text" name="comp_name" value="${company.comp_name}" class="form-control" placeholder="회사명을 입력해 주세요." required size="1" style="border-radius: 5px; border:1px solid #ccc; width: 50%">
						</div>
					
					
					<br>
						
					<div class="container text-left">
						<label><h5><b>주소</b></h5></label>
						<input type="text" value="${company.comp_addr}" class="form-control" name="comp_addr" placeholder="주소를 입력해 주세요." required size="1" style="border-radius: 5px; border:1px solid #ccc; width: 50%">
					</div>
					
					<br>
					
					<div class="container text-left">
						<label><h5><b>전화번호</b></h5></label>
						<input type="text" value="${company.comp_phone}" class="form-control" name="comp_phone" placeholder="예 ) 010-0000-0000" required size="1" style="border-radius: 5px; border:1px solid #ccc; width: 50%">
					</div>
					
					<br>
					
					<div class="container text-left">
						<label><h5><b>담당자 이름</b></h5></label>
						<input type="text" value="${company.comp_pic}" class="form-control" name="comp_pic" placeholder="이름을 입력해 주세요." required size="1" style="border-radius: 5px; border:1px solid #ccc; width: 50%">
					</div>
					
					<br>
					
					<div class="container text-left">
						<label><h5><b>담당자 이메일</b></h5></label>
						<input type="email" value="${company.comp_pic_email}" class="form-control" name="comp_pic_email" placeholder="이메일을 입력해 주세요." required size="1" style="border-radius: 5px; border:1px solid #ccc; width: 50%">
					</div>
					<br>
					</td>
					<br>
					
				</tr>
			</div>
			
		</table>
		
		
		
		
		
		
		
		
		
			<br>
			<br>
			  <table width="100%">
				 <tr>
					<td><button type="button" class="btn btn-outline-dark btn-block" onclick="location.href='list?keyword='"><b>이전 으로</b></button></td>
					<td><button type="submit" class="btn btn-outline-dark btn-block"><b>신청 하기</b></button></td>
				</tr>
			</table>
		</form>
			</section>
			</div>
			</div>
		
		  
		    <!-- /.content -->
			</div>
			<!-- #footer start -->
	<%@ include file="../include/footer.jsp" %>
	<!-- //#footer end -->
		    </div>
</body>
</html>