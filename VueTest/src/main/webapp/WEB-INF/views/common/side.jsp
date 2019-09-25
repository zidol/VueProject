<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<nav>
		<H3>사이드</H3>
		<ul>
			<li><a href="${contextPath}/admin/goods/adminGoodsMain.do">사이드1</a></li>
			<li><a href="${contextPath}/admin/order/adminOrderMain.do">사이드2</a></li>
			<li><a href="${contextPath}/admin/member/adminMemberMain.do">사이드3</a></li>
		</ul>
</nav>


