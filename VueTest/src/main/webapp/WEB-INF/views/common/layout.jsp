<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
<title><tiles:insertAttribute name="title" /></title>

<!-- <script src="https://unpkg.com/vue"></script> -->
<!-- Add this to <head> -->

<!-- Load required Bootstrap and BootstrapVue CSS -->
<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap/dist/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.min.css" />

<!-- Load polyfills to support older browsers -->
<script src="//polyfill.io/v3/polyfill.min.js?features=es2015%2CIntersectionObserver" crossorigin="anonymous"></script>

<!-- Load Vue followed by BootstrapVue -->
<script src="https://unpkg.com/vue@latest/dist/vue.min.js"></script>
<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<div id="outer_wrap">
		<div id="wrap">
			<header>
				<tiles:insertAttribute name="header" />
			</header>
			<div class="clear"></div>
			<%-- <aside>
				<tiles:insertAttribute name="side" />
			</aside> --%>
			<article>
				<tiles:insertAttribute name="body" />
			</article>
			<div class="clear"></div>
			<footer>
				<tiles:insertAttribute name="footer" />
			</footer>
		</div>
	</div>
</body>
</html>