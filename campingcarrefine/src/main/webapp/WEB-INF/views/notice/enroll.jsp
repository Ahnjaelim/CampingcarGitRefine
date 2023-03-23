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
	.trr{
		 background-color: #b3e5fc;
	}
	.ja{
		padding: 10px 0px;
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
		<form action="/notice/enroll" method="post">
		<div class="box-body">
			<div class="form-group ja">
				<label for="exampleInputEmail">제목</label>
				<input type="text" name="title" class="form-control">
			</div>
			<div class="form-group ja">
				<label for="exampleInputPassword1">내용</label>
				<textarea class="form-control" name="content" rows="10"></textarea>
			</div>
			</div>
				<div class="form-group ja">
					<label for="exampleInputEmail">작성자</label>
					<input type="text" name="writer" class="form-control">
				</div>
			<div class="input_wrap ja">
				<label>등록일</label>
				<input class="form-control" type="text" disabled name="regdater" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regdate}"/>' >
			</div>
			<div class="input_wrap ja">
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
 
   
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
   
   
<!-- ================================================== -->		
		</div> <!-- // #body_contents end -->
	</div><!-- // #wrap end -->
	
	<!-- #footer start -->
	<%@ include file="../include/footer.jsp" %>
	<!-- //#footer end -->
	
</div><!-- // #container end -->

</body>
</html>				