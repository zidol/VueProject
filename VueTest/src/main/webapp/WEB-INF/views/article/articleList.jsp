<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<div align="center" id="article">
		
			<!-- <table class="table">
				<tr>
					<td align="right">
						<select name="searchCondition">
								<option value="SearchCnt1">제목
								<option value="SearchCnt2">글쓴이
								<option value="SearchCnt3">내용
								<option v-for="(key, value, index) in searchCondition" v-bind:value="value" v-model="value">{{key}}
						</select>
						<input name="searchKeyword" type="text" placeholder="검색어 입력" v-model="searchKeyWord">
						<button type="button" v-on:click="datasetList">검색</button>
					</td>
				</tr>
			</table> -->
			<div>
					<select id="searchCondition">
						<option v-for="(val, key) in searchCondition" v-bind:value="key">{{val}}</option>
					</select>
					<input type="name" id="searchKeyWord" placeholder="검색어 입력" v-model="searchKeyWord">
					<button type="button" v-on:click="datasetList">검색</button>
					
				</div>
		<!-- <table class="table table-gray table-hover"  border="1" cellpadding="0" cellspacing="0" width="700">
			<tr>
				<th width="100">글 번호</th>
				<th width="200">제목</th>
				<th width="150">작성자</th>
				<th width="150">등록 일자</th>
			<tr>
			<tr v-for="(c, index) in articleList">
				<td align="center">{{c.id}}</td>
				<td align="center"><a v-bind:href="'/article/'+ c.id+'?currentPage=' + pagingInfo.currentPage + '&perPage=' + pagingInfo.perPage" >{{c.title}}</a></td>
				<td align="left">{{c.writer}}</td>
				<td align="left">{{new Date(c.regDate).toLocaleDateString()}}</td>
			</tr>
		</table> -->
		<div>
		
			<b-table
				hover
				:items="articleList"
				:fields="fields"
				:sort-by.sync="sortBy"
				:sort-desc.sync="sortDesc"
				responsive="sm"
		    >
		    		<template v-slot:cell(title)="data">
			        <!-- `data.value` is the value after formatted by the Formatter -->
			       <a v-bind:href="'/article/'+ data.item.id+'?currentPage=' + pagingInfo.currentPage + '&perPage=' + pagingInfo.perPage">{{data.value}}</a>
			      </template>
			      <template v-slot:cell(regDate)="data">
			        <!-- `data.value` is the value after formatted by the Formatter -->
			      {{new Date(data.value).toLocaleDateString()}}
			      </template>
		    </b-table>

		</div>
		<br>
	   	<%-- <div align="center">
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
	   	</div> --%>
	   	
	   	<!-- <div align="center">
	   		<ul class="pagination">
               <li v-if="prev"><a v-bind:href="'/article/articleList'+prevParam">이전</a></li>&nbsp;
               <li v-for="i in endPage">
                   <a v-if="i >= startPage" v-bind:href="'/article/articleList'+getMainParam(i)">{{i}}</a>
               </li>
               <li v-if="next && endPage > 0"><a v-bind:href="'/article/articleList'+nextParam">다음</a></li>
	       </ul>
	   	</div> -->
	   	<div class="buttons mt_10">
		   	<nav aria-label="pagination example" class="dis_in">
			   	 <b-pagination align="center" ref="dataSetTable" for="table"
			   	 v-model="pagingInfo.currentPage" 
			   	 :total-rows="articleListRecords" 
			   	 :per-page="pagingInfo.perPage" 
			   	 v-show="articleListRecords > 0">
			   	 
			   	 </b-pagination>
		   	 </nav>
	   	 </div>
	   	
		<br>
		<a href="/article/insertArticle">게시들 등록</a>
		<br>
	</div>
	
	<script type="text/javascript">
		var searchConditions = {
				'TITLE' : '제목',
				'CONTENT' : '내용',
				'WRITER' : '작성자'
		}
		var vm = new Vue({
			el : "#article",
			data : {
				articleList : ${articleList},
				articleListRecords : ${articleListRecords},
    				searchCondition :searchConditions,
				searchKeyWord : '',    	
				pagingInfo: {
	                currentPage: ${currentPage},
	                records: 0,
	                perPage: 10,
	            },
	            fields: [
	                { key: 'id', sortable: true },
	                { key: 'title', sortable: true },
	                { key: 'writer', sortable: true },
	                { key: 'regDate', sortable: true }
	              ],
	              items: [
	                { isActive: true, age: 40, first_name: 'Dickerson', last_name: 'Macdonald' },
	                { isActive: false, age: 21, first_name: 'Larsen', last_name: 'Shaw' },
	                { isActive: false, age: 89, first_name: 'Geneva', last_name: 'Wilson' },
	                { isActive: true, age: 38, first_name: 'Jami', last_name: 'Carney' }
	              ],
	              sortBy: 'age',
	              sortDesc: false,
			},
			methods : {
				datasetList : function() {
		            var vm = this;
		            var searchKeyWord = $("#searchKeyWord").val();
		            var searchCondition = $("#searchCondition").val();
		            console.log(searchKeyWord);
		            console.log(searchCondition);
		            $.ajax({
			               url : "/article/articleListAjax",
			               data : {
			            	   	"currentPage" : vm.pagingInfo.currentPage,
				    			"perPage" : vm.pagingInfo.perPage,
				    			"searchCondition" : searchCondition,
				    			"searchKeyWord" : searchKeyWord,
			               },
			               type : 'GET',
			               success : function(list){
			            	   		var currentURL = location.href;
			            	   		var renewURL = currentURL.replace(/\?currentPage=([0-9]+)/ig,' ');
			            	   		var rrenewURL = renewURL.replace(/ /gi, "?currentPage="+vm.pagingInfo.currentPage); 
			            	   		console.log(rrenewURL);
			            	  		vm.articleList = list.articleList;
			    		  			vm.articleListRecords = list.articleListRecords;
			    		  			history.pushState(null, null, rrenewURL);
			                },
			                error : function(data){
			                   alert("오류"+data);
			                   console.log("오류"+data);
			                }
		              })
		         }
			},
			mounted : function () {
				var vm = this;
				vm.datasetList();
				this.$refs.dataSetTable.$on('change', function(page){
					console.log('page : ', page)
					if (vm.pagingInfo.currentPage != page) {
					   vm.pagingInfo.currentPage = page;
					   vm.datasetList(); //조회 메서드
					}
				}); 
		      }
		});
	</script>
