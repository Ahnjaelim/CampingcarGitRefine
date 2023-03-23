<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="title" value="수정 및 삭제" />
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
.ja2{
	padding: 15px 0px;
}
</style>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		  <div class="col-md-12">
        	<!-- general form elements -->
        		<div class="box box-primary">
        			<div class="box-header">
        			
       					</div><!-- /.box-header -->
       					
			
				</div>
					</div>
						</div>	
					<table class="table table-bordered">
			
	<form id="modifyForm" action="/admin/notice/modify" method="post">
	<div class="input_wrap ja">
		
			<label for="exampleInputEmail">번호</label>
			<input class="form-control" type="text" name="bno" value='<c:out value="${pageInfo.bno}"/>' >
		
	</div>
	<div class="input_wrap ja">
		<label for="exampleInputPassword1">제목</label>
		<input class="form-control" type="text" name="title" value='<c:out value="${pageInfo.title}"/>' >
	</div>
	<div class="input_wrap ja">
		<label for="exampleInputEmail">내용</label>
		<textarea rows="7" input class="form-control" type="text" name="content"><c:out value="${pageInfo.content}"/></textarea>
	</div>
	<div class="input_wrap ja">
		<label for="exampleInputEmail">작성자</label>
		<input class="form-control" type="text" name="writer" value='<c:out value="${pageInfo.writer}"/>' >
	</div>
	<div class="input_wrap ja">
		<label for="exampleInputEmail">등록일</label>
		<input class="form-control" type="text" placeholder="Disabled input" aria-label="Disabled input example" disabled name="regdater" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regdate}"/>' >
	</div>
	<div class="input_wrap ja">
		<label for="exampleInputEmail">수정일</label>
		<input class="form-control" type="text" placeholder="Disabled input" aria-label="Disabled input example" disabled name="updateDate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.updateDate}"/>' >
	</div>
		
	<div class="btn_wrap ja2">
		<a class="btn btn btn-outline-dark" id="list_btn">돌아가기</a> 
        <a class="btn btn btn-outline-dark" id="modify_btn">수정 완료</a>
        <a class="btn btn btn-outline-dark" id="delete_btn">삭제</a>
        <a class="btn btn btn-outline-dark" id="cancel_btn">수정 취소</a>
	</div>
	
	<div class="box-footer">
	</div>
	
	</form>
	<form id="infoForm" action="/admin/notice/modify" method="/admin/notice/get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
		<input type="hidden" name="type" value="${cri.type}">
		<input type="hidden" name="keyword" value="${cri.keyword }">
	</form>
			
		</form>
		
			</table>
</section>
	
<script>

	let form = $("#infoForm");        // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
	let mForm = $("#modifyForm");    // 페이지 데이터 수정 from

	// 목록 페이지 이동 버튼 
	$("#list_btn").on("click", function(e){
    	form.find("#bno").remove();
   	    form.attr("action", "/admin/notice/list");
    	form.submit();
	});

	// 수정 하기 버튼 
	$("#modify_btn").on("click", function(e){
        mForm.submit();
    });

	// 취소 버튼 
	$("#cancel_btn").on("click", function(e){
    	form.attr("action", "/admin/notice/get");
    	form.submit();
	});
	//삭제버튼
	$("#delete_btn").on("click" , function(e){
		form.attr("action" , "/admin/notice/delete");
		form.attr("method", "post");
		form.submit();
		
	});
	
	
</script>
<!-- ================================================== end-->
	</div><!-- // #wrap end -->
</div><!-- // #container end -->  


</body>
</html>	