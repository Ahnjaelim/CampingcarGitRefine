<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="title" value="글 확인" />
<!DOCTYPE html>
<html>
	<meta name="viewport" content="width=device-width, initial-scale=1">	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">

<%@ include file="../../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/admin/admin_all.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/ajsbutton.css" rel="stylesheet" />

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
<!-- ================================================== start-->
<style>
.ja{
	padding: 5px 0px;
}
</style>
<!-- Main content -->
<section class="content">
<div class="panel-body">
	<div class="row3">
		<!-- left column -->
		  <div class="col-md-12" style="margin: auto;">
        	<!-- general form elements -->
        		<div class="box box-primary">
        			<div class="box-header with-border">
       					</div><!-- /.box-header -->
	
					<table class="table table-bordered">
						

<div class="input_wrap ja">

	
		<label>번호</label>
		<input class="form-control" type="text" placeholder="Disabled input" aria-label="Disabled input example" disabled name="bno" readonly="readonly" value='<c:out value="${pageInfo.bno}"/>' >

	</div>
	<div class="input_wrap ja">

		<label>제목</label>
		<input class="form-control" type="text" value='<c:out value="${pageInfo.title}"/>' >
	
	</div>
	<div class="input_wrap ja">

		<label>내용</label>
		<textarea rows="15" input class="form-control" type="text"  name="content"><c:out value="${pageInfo.content}"/></textarea>
	</div>
	<div class="input_wrap ja">
		<label>작성자</label>
		<input class="form-control" type="text" name="writer" value='<c:out value="${pageInfo.writer}"/>' >
	</div>
	<div class="input_wrap ja">
		<label>등록일</label>
		<input class="form-control" type="text" placeholder="Disabled input" aria-label="Disabled input example" disabled name="regdater" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regdate}"/>' >
	</div>
	<div class="input_wrap ja">
		<label>수정일</label>
		<input class="form-control" type="text" placeholder="Disabled input" aria-label="Disabled input example" disabled name="updateDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.updateDate}"/>' >
	</div>
	
	<div class="btn_wrap ja">
		<div style="text-align:left">
		<a class="btn btn-outline-dark" id="list_btn">목록 가기</a> 
		<a class="btn btn-outline-dark" id="modify_btn">수정 하기</a>
				</div>
				</div>
		<div class="box-footer">
		<div style="text-align:center">
	<form id="infoForm" action="/notice/modify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
		<input type="hidden" name="type" value="${cri.type }">
		<span class="badge bg-red"><input type="hidden" name="keyword" value="${cri.keyword }"></span>
	
	</form>
		</div>
			</div>
			
				
							</table>
								</section>
	
<script>
	let form = $("#infoForm");
	
	$("#list_btn").on("click", function(e){
		form.find("#bno").remove();
		form.attr("action", "/admin/notice/list");
		form.submit();
	});
	
	$("#modify_btn").on("click", function(e){
		form.attr("action", "/admin/notice/modify");
		form.submit();
	});	
</script>		


 
</form>
<!-- ================================================== end-->
	</div><!-- // #wrap end -->
</div><!-- // #container end -->  


</body>
</html>