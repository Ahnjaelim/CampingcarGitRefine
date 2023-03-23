<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div id="submenu">
	<ul>
		<c:forEach items="${menuMap[mn]['sub'] }" var="sub">
			<li <c:if test="${sub.key==sn }">class="on"</c:if>><a href="${sub.value['url'] }">${sub.value['title'] }</a></li>
		</c:forEach>
		
	</ul>
</div>