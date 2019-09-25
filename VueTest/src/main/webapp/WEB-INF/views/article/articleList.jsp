<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<div align="center" id="article">
		<table border="1" cellpadding="0" cellspacing="0" width="700">
			<tr>
				<th bgcolor="orange" width="100">글 번호</th>
				<th bgcolor="orange" width="200">제목</th>
				<th bgcolor="orange" width="150">작성자</th>
				<th bgcolor="orange" width="150">등록 일자</th>
			<tr>
			<tr v-for="(c, index) in articleList">
				<td align="center">{{index+1}}</td>
				<td align="center"><a v-bind:href="'/article/'+ c.id" >{{c.title}}</a></td>
				<td align="left">{{c.writer}}</td>
				<td align="left">{{new Date(c.regDate).toLocaleDateString()}}</td>
			</tr>
		</table>
		<br>
	   	<div align="center">
	   		<ul class="pagination">
	           <c:if test="${pageMaker.prev}">
	               <li><a href="/article/articleList${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>&nbsp;
	           </c:if>
	           <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
	               <li <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>
	                   <a href="/article/articleList${pageMaker.makeQuery(idx)}">${idx}</a>&nbsp;
	               </li>
	           </c:forEach>
	           <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	               <li><a href="/article/articleList${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
	           </c:if>
	       </ul>
	   	</div>
	   	
	   	<div align="center">
	   		<ul class="pagination">
               <li v-if="prev"><a v-bind:href="'/article/articleList'+prevParam">이전</a></li>&nbsp;
               <li v-for="i in endPage">
                   <a v-if="i >= startPage" v-bind:href="'/article/articleList'+getMainParam(i)">{{i}}</a>
               </li>
               <li v-if="next && endPage > 0"><a v-bind:href="'/article/articleList'+nextParam">다음</a></li>
	       </ul>
	   	</div>
	   	
	   	
		<br>
		<a href="/article/insertArticle">게시들 등록</a>
		<br>
	</div>
	
	<script type="text/javascript">

	//mainParam: ${pageMaker.makeQuery(idx)},
	
	Vue.component('paginate', VuejsPaginate)
		var vm = new Vue({
			el : "#article",
			data : {
				articleList : ${articleList},
		
				prev: ${pageMaker.prev},
				prevParam: '${pageMaker.makeQuery(pageMaker.startPage - 1)}',
				
				prev: ${pageMaker.prev},
				prevParam: '${pageMaker.makeQuery(pageMaker.startPage - 1)}',
				
				startPage: ${pageMaker.startPage},
				endPage: ${pageMaker.endPage},
				currentPage: ${pageMaker.criteria.page},
				mainParam: '',
				
				next: ${pageMaker.next},
				endPage: ${pageMaker.endPage},
				nextParam: '${pageMaker.makeQuery(pageMaker.endPage + 1)}',
			},
			methods : {
				clickCallbacok : function(pageNum) {
					console.log(pageNum);
				},
			
				getMainParam: function (idx) {
					return "?page=" + idx + "&perPageNum=" + ${pageMaker.criteria.perPageNum};
				}
			}
		});
	</script>
