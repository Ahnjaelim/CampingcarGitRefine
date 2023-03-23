<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="mn" value="6" />
<c:set var="sn" value="3" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<title>자주하는 질문</title>
<%@ include file="../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/sub_all.css" rel="stylesheet" />
</head>
<c:set var="title" value="FAQ" />
<script>
   function search(){//검색기능
         var $keyword = $('#keyword');
         $('#searchBtn').on('click',function(){
            var keywordVal = $keyword.val();
            var url = "list?page=1"
               + "&perPageNum=" + "${pageMaker.cri.perPageNum}"         
               + "&keyword=" + encodeURIComponent(keywordVal);
            window.location.href = url;         
         })   
   }
</script>
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
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table board_table center">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							
						</tr>
					</thead>


					<c:forEach items="${list }" var="board">
						<tr>
						  <td >
						  ${board.bno}
						  </td>
						   <td class="left"> <a href = "read?bno=${board.bno }">
						  ${board.title}</a>
						  </td>
						   <td>
						  ${board.writer}
						  </td>
						   <td>
						  ${board.regdate}
						  </td>								
						</tr>
					</c:forEach>
				</table>

				<div class='row'>
				
				<div class="container text-center">
    
			      <ul>
			         <c:if test="${pageMaker.prev }">
			            <a class="btn btn-outline-secondary" href = "listAll${pageMaker.makeSearch(pageMaker.startPage -1)}">&laquo;</a>
			            
			         </c:if>      
			            
			         <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var = "idx">            
			            <c:choose>
			            
			            <c:when test="${cri.page != idx }">
			            <a class="<c:if test="${cri.page != idx }">btn btn-outline-secondary</c:if>" href = "listAll${pageMaker.makeSearch(idx)}"  >${idx }</a>
			            </c:when>
			            
			            <c:otherwise>
			            <a style="color: white;" class="<c:if test="${cri.page == idx }">btn btn-secondary</c:if>" href = "listAll${pageMaker.makeSearch(idx)}"  >${idx }</a>
			            </c:otherwise>
			            
			            </c:choose>   
			         </c:forEach>         
			         
			         <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			            <a class="btn btn-outline-secondary " href = "listAll${pageMaker.makeSearch(pageMaker.endPage +1 )}">&raquo;</a>
			         </c:if>
			      </ul>
			            
			</div>
		
		<br><br>	  
		<form name="search_faq" autocomplete="on">
		
   <div class="input-group mb-3" style="width:100%;">
   
    <input class="form-control" id="keyword" name="keyword" type="search" value="${pageMaker.cri.keyword}" 
    placeholder="  글을 검색하세요." />  
   <button type="submit" id="searchBtn" class="btn btn-outline-primary" style="width:100px;">　검색　</button>
      
   </div>
   
</form>
</div>
</div>
<!-- ================================================== -->		
		</div> <!-- // #body_contents end -->
	</div><!-- // #wrap end -->
	
	<!-- #footer start -->
	<%@ include file="../include/footer.jsp" %>
	<!-- //#footer end -->
	
</div><!-- // #container end -->

</body>
</html>