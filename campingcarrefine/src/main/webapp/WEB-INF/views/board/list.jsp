<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="mn">${boardConfig.bo_mn }</c:set>
<c:set var="sn">${boardConfig.bo_sn }</c:set>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<%@ include file="../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/sub_all.css" rel="stylesheet" />
</head>
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

${sessionScope.user}

<c:if test="${not empty responseDTO and not empty boardConfig }">
<table class="table board_table center">
<tbody>
<colgroup>
	<col width="10%" />
	<col width="*" />
	<col width="10%" />
	<col width="20%" />
	<col width="10%" />
</colgroup>
<thead>
<tr>
	<th>#</th>
	<th>제목</th>
	<th>작성자</th>
	<th>작성 시간</th>
	<th>조회수</th>
</tr>
</thead>
<tbody>
<c:forEach items="${responseDTO.dtoList }" var="dto">
<tr>
	<th>${dto.wr_id }</th>
	<td class="left"><a href="${contextPath }/board/read?bo_table=${param.bo_table }&wr_id=${dto.wr_id}&${pageRequestDTO.link}">${dto.wr_subject }</a></td>
	<td>${dto.wr_name }</td>
	<td><fmt:formatDate value="${dto.wr_datetime }" pattern="yyyy-MM-dd" type="date"/></td>
	<td>${dto.wr_hit }</td>
</tr>
</c:forEach>
</tbody>
</table>

<div class="board_bot">
	<nav aria-label="Page navigation example">
		 <ul class="pagination justify-content-center">
		 	<c:if test="${responseDTO.prev }">
		 		<li class="page-item"><a class="page-link" data-num="${responseDTO.start-1 }"><i class="fa-solid fa-angle-left"></i></a></li>
		 	</c:if>
			<c:forEach begin="${responseDTO.start }" end="${responseDTO.end }" var="num">
				<li class="page-item ${responseDTO.page == num?"active":"" }"><a class="page-link" data-num="${num }">${num }</a></li>
			</c:forEach>
		 	<c:if test="${responseDTO.next }">
		 		<li class="page-item"><a class="page-link" data-num="${responseDTO.end+1 }"><i class="fa-solid fa-angle-right"></i></a></li>
		 	</c:if>
		</ul>
	</nav>
	<div>
	<button onclick="location.href='${contextPath}/board/register?bo_table=${param.bo_table }';" class="btn btn-primary">글쓰기</button>
	</div>
</div>

<form action="list" method="get">
<input type="hidden" name="bo_table" value="${param.bo_table }" />
<input type="hidden" name="size" value="${pageRequestDTO.size }" />
<div class="search">
	<div style="padding:0px 0px 10px 0px;">
		<input type="checkbox" name="types" value="wr_name" class="form-check-input" /> 작성자
		<input type="checkbox" name="types" value="wr_subject" class="form-check-input" /> 제목
	</div>
	<div class="input-group mb-3">
		<input type="text" name="keyword" class="form-control" value="" />
		<button type="submit" class="btn btn-outline-primary" style="width:100px;">검색</button>
	</div>	
</div>
</form>

<script>
document.querySelector(".pagination").addEventListener("click", function(e){
	e.preventDefault();
	e.stopPropagation();
	const target = e.target;
	if(target.tagName!=='A'){
		return
	}
	const num = target.getAttribute("data-num");
	self.location = `list?bo_table=${param.bo_table}&page=\${num}`
},false);
</script>


</c:if>

<c:if test="${empty responseDTO or empty boardConfig}">
<div class="board_error">
	<h3><i class="fa-solid fa-triangle-exclamation"></i> ERROR</h3>
	테이블 혹은 테이블 설정이 존재하지 않습니다. 데이터베이스를 확인하세요.
</div>
</c:if>
<!-- ================================================== -->		
		</div> <!-- // #body_contents end -->
	</div><!-- // #wrap end -->
	
	<!-- #footer start -->
	<%@ include file="../include/footer.jsp" %>
	<!-- //#footer end -->
	
</div><!-- // #container end -->

</body>
</html>