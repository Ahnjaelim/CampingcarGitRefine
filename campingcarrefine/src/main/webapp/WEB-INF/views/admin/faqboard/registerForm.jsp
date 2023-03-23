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
<title>글 작성</title>
<%@ include file="../../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/admin/admin_all.css" rel="stylesheet" />
<c:set var="title" value="FAQ" />
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
<div class="row">
  <div class="col-lg-12">
   <div class="panel panel-default">
    <h1 class="page-header">글 작성</h1><br><br><br>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

        <form role="form" action="register" method="post">
          <div class="form-group">
            <label>제목</label> <input class="form-control" name='title'>
          </div>

          <div class="form-group">
            <label>내용</label>
            <textarea class="form-control" rows="10" name='content'></textarea>
          </div>

          <div class="form-group">
            <label>작성자</label> <input class="form-control" name='writer'>
          </div>
         <button type="submit" class="btn btn-outline-success" 
			 onclick='location.href="${contextPath}/admin/faqboard/listAll?keyword="'>생성</button>
         
          <button type="reset" class="btn btn-outline-default"> 초기화 </button>
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