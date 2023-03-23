<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="mn" value="6" />
<c:set var="sn" value="1" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${menuMap[mn]['sub'][sn]['title'] } - 자바 캠핑카</title>
<%@ include file="../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/sub_all.css" rel="stylesheet" />

</head>
<style>
	.trr{
		 background-color: #b3e5fc;
	}
	.ja{
		padding: 10px 0px;
	}
</style>
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
				</div>
				
							</table>
								</section>
	
<script>
	let form = $("#infoForm");
	
	$("#list_btn").on("click", function(e){
		form.find("#bno").remove();
		form.attr("action", "/notice/list");
		form.submit();
	});
	
	$("#modify_btn").on("click", function(e){
		form.attr("action", "/notice/modify");
		form.submit();
	});	
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