<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="title" value="글 수정 및 삭제" />
<!DOCTYPE html>

<html>
	<meta name="viewport" content="width=device-width, initial-scale=1">	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<title>글수정</title>
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
	<div class="board_write" style="width: 40%; margin: 0 auto;">
			<h4 style="text-align: center">글 수정</h4>
			<br>

			<form method = "post" action="modify">
			
			<div class="input-group">
				<span class="input-group-text">번호를 입력하세요.</span>
				<input type="text" class="form-control" id="bno" name="bno"  placeholder="번호"
				value="${board.bno }"/>
			</div>
			<div class="input-group">
				<span class="input-group-text">제목을 입력하세요.</span>
				<input type="text" class="form-control" id="title" name="title"  placeholder="제목"
				value="${board.title }" />
			</div>
			<div class="input-group">
				<span class="input-group-text">내용을 입력하세요.</span>
				<input type="text" class="form-control" id="content" name="content" placeholder="내용" 
				value="${board.content }"/>
			</div>
			<div class="input-group">
				<span class="input-group-text">작성자를 입력하세요.</span>
				<input type="text" class="form-control" id="writer" name="writer" placeholder="작성자" 
				value="${board.writer }"/>
			</div>
			</div>
			
			<div style="float: right">	
				<button class="ajs ajsbutton4" type="submit" id="update">수정</button>
				<button class="ajs ajsbutton1" type ="button"
				onclick='location.href="${contextPath}/admin/faqboard/remove?bno=${board.bno}"'>삭제</button>
				<button class="ajs ajsbutton2" type="button" onclick='location.href="${contextPath }/admin/faqboard/listAll?keyword="'>돌아가기</button>
			</div>
	</form>
</div>
	
	
	
	
	<!-- ================================================== end-->
	</div><!-- // #wrap end -->
</div><!-- // #container end -->
</body>
</html>