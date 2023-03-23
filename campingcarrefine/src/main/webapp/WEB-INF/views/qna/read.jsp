<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<c:set var="mn" value="6" />
<c:set var="sn" value="1" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<title>이용 문의 상세페이지 - 자바 캠핑카</title>
<%@ include file="../include/plugin.jsp"%>
<link href="${contextPath}/resources/css/sub_all.css" rel="stylesheet" />
</head>
<body>
	<div id="container">
		<!-- #header start -->
		<%@ include file="../include/header.jsp"%>
		<!--// #header end -->

		<div id="body_head">
			<h2>${menuMap[mn]['sub'][sn]['title'] }</h2>
			<div class="location">
				HOME <i class="fa-solid fa-circle-chevron-right"></i>
				${menuMap[mn]['title'] } <i class="fa-solid fa-circle-chevron-right"></i><span>${menuMap[mn]['sub'][sn]['title'] }</span>
			</div>
		</div>

		<div id="wrap">
			 
			 <!-- #submenu start -->
      		 <%@ include file="../include/submenu.jsp" %>
      		 <!-- // #submenu end -->
			<div id="body_contents">
		
<!-- ================================================== -->
				
		<div class="board_view">
			<table class="table board_table">		
			<colgroup>
				<col width="15%" /> 
				<col width="35%" /> 
				<col width="15%" /> 
				<col width="35%" /> 
			</colgroup>
		
			<thead>
				<th colspan="4">${qnaVO.qna_title }</th>
			</thead>
			
				<form role="form" action="modifyForm" method="GET">
					<input type='hidden' name='qna_no' value="${qnaVO.qna_no}">
				</form>
			<tbody>
			<tr>
				<th class="table-light">작성자</th><td>${qnaVO.qna_writer }</td>
				<th class="table-light">작성일</th>
				<td><fmt:formatDate value="${qnaVO.qna_regdate }" pattern="yyyy-MM-dd" type="date"/></td>
			</tr>
			</tbody>
			</table>	

			<div class="content">
			
				${qnaVO.qna_content }
			</div>						
						
				<div class="box-footer">
					<a href="modifyForm?qna_no=${qnaVO.qna_no}" role="button" class="btn btn-warning">수정</a>
					<a href="remove?qna_no=${qnaVO.qna_no}" role="button" class="btn btn-danger">삭제</a> 
					<a href="qnalist?keyword=" role="button" class="btn btn-primary">목록</a>
				</div>

	</div><!-- board_view end -->
		
	<script>
	$(document).ready(function() {
	var formObj = $("form[role='form']");
	console.log(formObj);

	// 수정
	$(".btn-warning").on("click", function() {
	formObj.attr("action", "qna/modify");
	formObj.attr("method", "get");
	formObj.submit();
	});

	// 삭제
	$(".btn-danger").on("click", function() {
	formObj.attr("action", "qna/remove");
	formObj.submit();
	});

	// 목록
	$(".btn-primary").on("click", function() {
	self.location = "qna/qnalist?keyword=";
	});
	});
	</script>				

<!-- ================================================== -->	
					
			</div><!-- // #body_contents end -->
		</div><!-- // #wrap end -->

		<!-- #footer start -->
		<%@ include file="../include/footer.jsp"%>
		<!-- //#footer end -->

	</div><!-- /.container end -->
</body>
</html>