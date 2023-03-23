<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Timestamp" %>
<c:set var="mn">${boardConfig.bo_mn }</c:set>
<c:set var="sn">${boardConfig.bo_sn }</c:set>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="datetime" value="${dto.wr_datetime }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 조회</title>
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

<c:if test="${empty dto or empty boardConfig}">
<div class="board_error">
	<h3><i class="fa-solid fa-triangle-exclamation"></i> ERROR</h3>
	테이블 혹은 테이블 설정이 존재하지 않습니다. 데이터베이스를 확인하세요.
</div>
</c:if>

<c:if test="${not empty dto and not empty boardConfig }">
<div class="board_view">
	<table class="table board_table">
	<colgroup>
		<col width="15%" /> 
		<col width="35%" /> 
		<col width="15%" /> 
		<col width="35%" /> 
	</colgroup>
	<thead>
		<th colspan="4">${dto.wr_subject }</th>
	</thead>
	<tbody>
	<tr>
		<th class="table-light">작성자</th><td>${dto.wr_name }</td>
		<th class="table-light">작성일</th>
		<td><fmt:formatDate value="${dto.wr_datetime }" pattern="yyyy-MM-dd HH:mm" type="date"/></td>
	</tr>
	</tbody>
	</table>
	<div class="content">
		<c:if test="${not empty filelist }">
		<ul class="filelist">
		<c:forEach items="${filelist }" var="file">
			<li><img src="${contextPath }/resources/data/${param.bo_table }/${file.bf_source }" /></li>
		</c:forEach>
		</ul>
		</c:if>
		${dto.wr_content }
	</div>
</div>
</c:if>

<button class="btn btn-primary" id="btn-list">목록</button>

<script>
document.querySelector("#btn-list").addEventListener("click",function(e){
	location.href="list?bo_table=${param.bo_table}&${pageRequestDTO.link }";
},false);
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