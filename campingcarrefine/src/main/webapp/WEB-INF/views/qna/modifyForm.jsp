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
<title>이용 문의 수정페이지 - 자바 캠핑카</title>
<%@ include file="../include/plugin.jsp"%>
<link href="${contextPath}/resources/css/sub_all.css" rel="stylesheet" />
<style>
#body_contents {
	position: relative;
}

.board_table {
	width: 100%; position : absolute; top : 40px; background : #cfe2ff;
	color: #0d6efd;
	text-align: center;
	background: #cfe2ff;
	position: absolute;
	top: 21px;
}
.aaaaa{
	margin-top: 99px;
}
</style>
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
			<%@ include file="../include/submenu.jsp"%>

			<div class="aaaaa"></div>
			<!-- // #submenu end -->
			<div id="body_contents">

				<!-- ================================================== -->

				<div class="board_view">

					<table class="table board_table">
						<thead>
							<th colspan="4">${qnaVO.qna_title }</th>
						</thead>
						<colgroup>
							<col width="15%" />
							<col width="35%" />
							<col width="15%" />
							<col width="35%" />
						</colgroup>

						<form role="form" action="modify" method="post">
							<input type='hidden' name='page' value="${cri.page}"> <input
								type='hidden' name='perPageNum' value="${cri.perPageNum}">

							<div class="box-body">

								<div class="form-group" style="display: none;">
									<label for="exampleInputEmail1">글번호</label> <input type="text"
										name='qna_no' class="form-control" value="${qnaVO.qna_no}"
										readonly="readonly" style="display: none;">
								</div>

								<div class="form-group" style="display: none;">
									<label for="exampleInputEmail1">제목</label> <input type="text"
										name='qna_title' class="form-control"
										value="${qnaVO.qna_title}">
								</div>
								<tbody>
									<tr>
										<th class="table-light">작성자</th>
										<td style="background: #fff; color: #000;">${qnaVO.qna_writer }</td>
										<th class="table-light">작성일</th>
										<td style="background: #fff; color: #000;"><fmt:formatDate value="${qnaVO.qna_regdate }"
												pattern="yyyy-MM-dd" type="date" /></td>
									</tr>
								</tbody>
								
								<div class="form-group">
									<label for="exampleInputPassword1"></label>
									<textarea style="height: 239px;border: 0;outline: none; border-bottom: 1px solid #c8c8c8;" 
									class="form-control" name="qna_content" rows="3">${qnaVO.qna_content}</textarea>
								</div>

								<div class="form-group" style="display: none;">
									<label for="exampleInputEmail1">작성자</label> <input type="text"
										name="qna_writer" class="form-control"
										value="${qnaVO.qna_writer}" readonly="readonly">
								</div>
							</div>
					</table>
					<!-- /.box-body -->

					<div class="box-footer"style="margin-top: 59px;">
						<button type="submit" class="btn btn-primary">저장</button>
						<button type="submit" class="btn btn-warning">취소</button>
					</div>
					</form>
					<!-- ================================================== -->
				</div>
				<!-- board_view end -->
			</div>
			<!-- // #body_contents end -->
		</div>
		<!-- // #wrap end -->

		<!-- #footer start -->
		<%@ include file="../include/footer.jsp"%>
		<!-- //#footer end -->

	</div>
	<!-- /.container end -->
</body>
</html>