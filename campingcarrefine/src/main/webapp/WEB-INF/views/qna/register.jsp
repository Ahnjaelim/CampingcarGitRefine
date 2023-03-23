<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
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
<title>이용 문의 게시글 작성 - 자바 캠핑카</title>
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
				${menuMap[mn]['title'] } <i class="fa-solid fa-circle-chevron-right"></i>
				<span>${menuMap[mn]['sub'][sn]['title'] }</span>
			</div>
		</div>

		<div id="wrap">

			<!-- #submenu start -->
			<%@ include file="../include/submenu.jsp"%>
			<!-- // #submenu end -->

			<div id="body_contents">
				<!-- ================================================== -->

					<table class="table board_table center">
						<form role="form" method="post">
							<div class="box-body">
								<div class="form-group">
									<label for="exampleInputPassword1">문의글 제목</label> <input
										type="text" name='qna_title' class="form-control"
										placeholder="Enter Title">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">문의글 내용</label>
									<textarea class="form-control" name="qna_content" rows="3"
										placeholder="Enter....."></textarea>
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">작성자</label> <input type="text"
										name="qna_writer" class="form-control"
										placeholder="Enter Writer">
								</div>
							</div>

							<div class="box-footer">
								<button type="submit" class="btn btn-primary">문의글 작성</button>
								<a href="qnalist?keyword=" role="button" class="btn btn-warning">작성
									취소</a>
							</div>
						</form>

					</table>
				
			</div><!-- // #body_contents end -->
		</div><!-- // #wrap end -->

		<!-- #footer start -->
		<%@ include file="../include/footer.jsp"%>
		<!-- //#footer end -->

	</div><!-- /.container end -->
</body>
</html>