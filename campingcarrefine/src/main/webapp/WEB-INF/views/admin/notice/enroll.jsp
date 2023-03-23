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
<title>전체조회목록</title>
<%@ include file="../../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/admin/admin_all.css" rel="stylesheet" />
<c:set var="title" value="공지사항" />
<style>
.ja{
	padding: 10px 0px;
}
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
	
 </head>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		  <div class="col-md-12">
        	<!-- general form elements -->
       		 <div class="box box-primary">
        		<div class="box-header">
        			<div style="text-align:center">
         			
         		 </div><!-- /.box-header -->
				</div>
		<form action="/admin/notice/enroll" method="post">
		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputEmail">제목</label>
				<input type="text" name="title" class="form-control">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">내용</label>
				<textarea class="form-control" name="content" rows="10"></textarea>
			</div>
			</div>
				<div class="form-group">
					<label for="exampleInputEmail">작성자</label>
					<input type="text" name="writer" class="form-control">
				</div>
			<div class="input_wrap">
				<label>등록일</label>
				<input class="form-control" type="text" disabled name="regdater" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regdate}"/>' >
			</div>
			<div class="input_wrap">
				<label>수정일</label>
				<input class="form-control" type="text" aria-label="Disabled input example" disabled name="updateDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.updateDate}"/>' >
			</div>	
					</div>
						</div>
							</div>
								</section>
									
				<!-- /.box-body -->
				<div class="box-footer">
					<div class="form-group ja">
						<div style="text-align:left">
						<button type="submit" class="btn btn-outline-dark">등 록</button>
					</div>
					
				
 </form>

</form>
      </div>
      <!--  end panel-body -->
    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->


</body>
</html>	