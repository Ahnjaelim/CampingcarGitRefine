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
<style>
	.ja{
		padding: 10px 0px;
			}
 }
	button{
	 font-size: 50px;
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
			
	<form id="modifyForm" action="/notice/modify" method="post">
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
	</tr>		
	<div class="btn_wrap ja">
		<a class="btn btn btn-outline-dark" id="list_btn">돌아가기</a> 
        <a class="btn btn btn-outline-dark" id="modify_btn">수정 완료</a>
        <a class="btn btn btn-outline-dark" id="delete_btn">삭제</a>
        <a class="btn btn btn-outline-dark" id="cancel_btn">수정 취소</a>
	</div>
	
	<div class="box-footer">
	</div>
	
	</form>
	<form id="infoForm" action="/notice/modify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
		<input type="hidden" name="type" value="${cri.type}">
		<input type="hidden" name="keyword" value="${cri.keyword }">
	</form>
			
		
			</div>
		</div>
		</table>
</section>
	
<script>

	let form = $("#infoForm");        // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
	let mForm = $("#modifyForm");    // 페이지 데이터 수정 from

	// 목록 페이지 이동 버튼 
	$("#list_btn").on("click", function(e){
    	form.find("#bno").remove();
   	    form.attr("action", "/notice/list");
    	form.submit();
	});

	// 수정 하기 버튼 
	$("#modify_btn").on("click", function(e){
        mForm.submit();
    });

	// 취소 버튼 
	$("#cancel_btn").on("click", function(e){
    	form.attr("action", "/notice/get");
    	form.submit();
	});
	//삭제버튼
	$("#delete_btn").on("click" , function(e){
		form.attr("action" , "/notice/delete");
		form.attr("method", "post");
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