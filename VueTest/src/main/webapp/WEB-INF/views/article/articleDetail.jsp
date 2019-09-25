<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<div align="center" id="article">
		<h1>글 상세</h1>
		<a href="logout.do">Log-out</a>
		<hr>
		<form action="/article/updateArticle" method="post">
			<input type="hidden" name="id" v-bind:value="article.id">
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="orange" width="70">제목</td>
					<td align="left"><input name="title" type="text" v-model="article.title"></td>
				</tr>
				<tr>
					<td bgcolor="orange" >작성자</td>
					<td align="left">{{article.writer}}</td>
				</tr>
				<tr>
					<td bgcolor="orange">내용</td>
					<td align="left"><textarea name="content" rows="10" cols="40">{{article.content}}</textarea></td>
				</tr>
				<tr>
					<td bgcolor="orange">등록일</td>
					<td align="left">{{new Date(article.regDate).toLocaleDateString()}}</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input  type="submit" value="글 수정">
					</td>
				</tr>
			</table>
		</form>
		<hr>
		<a v-bind:href="'/article/deleteArticle/' + article.id">글삭제</a>&nbsp;&nbsp;&nbsp;
		<a href="/article/articleList">글목록</a>&nbsp;&nbsp;&nbsp;
	</div>
	<script type="text/javascript">

		var vm = new Vue({
			el : "#article",
			data : {
				article : ${article}
			},
		});
	</script>