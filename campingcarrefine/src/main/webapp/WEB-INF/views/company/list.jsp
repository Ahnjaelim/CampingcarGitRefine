<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="mn" value="2" />
<c:set var="sn" value="2" />



<!DOCTYPE html>

<html>
	<meta name="viewport" content="width=device-width, initial-scale=1">	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<title>자바 캠핑카</title>
<%@ include file="../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/sub_all.css" rel="stylesheet" />
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
<style>
.dropmenu{
	background-color: transparent;
	border-color: transparent;
	width: 250px;	
}
.one{
	display: inline-block;
}
</style>
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
				  
				  	<th>회사번호</th>
				  	<th>회사명</th>
				  	<th>주소</th>
				  	<th>전화번호</th>
				  	<th>담당자</th>
				  	<th>담당자 이메일</th>
				  </tr>
				  </thead>
					<tbody>
				 
				<c:forEach var="company" items="${list}">
				<c:if test="${company.comp_status == 1 }">
				 	<tr >
				 	
				 	<td>${company.comp_id}</td>
				 	<td class="left">${company.comp_name}</td>
				 	<td>${company.comp_addr}</td>
				 	<td>${company.comp_phone}</td>
				 	<td>${company.comp_pic}</td>
				 	<td>${company.comp_pic_email}</td>
				 	</tr>
				</c:if>
				</c:forEach>
					</tbody>
				</table>
				<br>
<!-- ============================================================================================= -->
<!--  페이징 처리 -->			  
 <c:if test="${pageMaker.cri.page!=null }">
   <div class="container text-center">
    
      <ul>
      <b>
         <c:if test="${pageMaker.prev }">         
            <a class="btn btn-outline-secondary "  href = "list${pageMaker.makeSearch(pageMaker.startPage -1)}">&laquo;</a>            
         </c:if>      
         
         <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var = "idx">            
            <c:choose>
            
            <c:when test="${cri.page != idx }">
            <a class="<c:if test="${cri.page != idx }">btn btn-outline-secondary</c:if>" href = "list${pageMaker.makeSearch(idx)}"  >${idx }</a>
            </c:when>
            
            <c:otherwise>
            <a style="color: white;" class="<c:if test="${cri.page == idx }">btn btn-secondary</c:if>" href = "list${pageMaker.makeSearch(idx)}"  >${idx }</a>
            </c:otherwise>
            
            </c:choose>   
         </c:forEach>
            
         <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
            <a class="btn btn-outline-secondary " href = "list${pageMaker.makeSearch(pageMaker.endPage +1 )}">&raquo;</a>
         </c:if>
      </b>
      </ul>

            
</div>
</c:if>
<!-- ========================================================================================================================== -->
<br>
<br>
			<!--  검색 기능 -->
		<form name="search_company" items="${list}" autocomplete="on">
			  	
		<div class="input-group mb-3">
    <input class="form-control" id="keyword" name="keyword" type="search" value="${pageMaker.cri.keyword}" 
    placeholder=" 회사명으로 검색" />
    
	<button type="submit" id="searchBtn" class="btn btn-outline-primary" style="width:100px;">　검색　</button>
		
	</div>
		</form>
	
		<br>
		<br>
				 
<!-- ============================================================================================= -->

				  <br>
				  	<div class="box">
				<div class="container text-right">
					<button type="button" class="btn btn-primary" onclick="location.href='registerForm'"><b>파트너 제휴 신청하러 가기 ←</b></button>
				</div>
			</div>
				</div>
				</div>
		    </section>
    </div>
    </div>
		   <!-- #footer start -->
	<%@ include file="../include/footer.jsp" %>
	<!-- //#footer end -->
		    <!-- /.content -->
    </div>
</body>
</html>