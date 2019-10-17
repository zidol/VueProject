<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div id="article">
	<a href="/article/articleList">리스트..</a>
	<button type="button" v-on:click="moveList">리스트</button>
</div>
<script type="text/javascript">
	var vm = new Vue({
		el : "#article",
		data : {
			articleList : [],
			pageData: {
	              currentPage: 1,
	              records: 0,
	              perPage: 10,
	          },
		},
		methods : {
			moveList : function(){
				var vm = this;

		        $.ajax({
		            url: "/article/articleList",
		            data: {
			            	"currentPage" : vm.pageData.currentPage,
			    			"perPage" : vm.pageData.perPage
		            },
		            type: "GET",
		            success: function(data){
		            		console.log(data);
		            }
		        })
		    },
		    
		    doExcelDownloadProcess : function() {
		    		var f = document.form1;
		        // f.action = "downloadExcelFile";
				// f.submit();
		        console.log(f);
		    },
		    
		    insertDB : function() {
		    		
		    		var listData = vm.articleList;
		    		
		    		$.ajax({
		    			url: "insertData",
		            data: JSON.stringify(listData),
		            contentType: "application/json",
		            type: "POST",
		            success: function(){
		            	location.href="/articleList";
			        }
		    		})
		    }
		}
	
	});

	
	//Number , String , Boolean , Function , Object , Null , undefined , Array 
	function dataConvertToJson (data) {
		// console.log(typeof data);
		var type = typeof data;
		if (type == "string") {
			return JSON.parse(data);
		} else if (type == "object" || type == "Array" ) {
			return data;
		} else {
			console.log("데이터 변환 오류");
			console.log("DATA", data);
			return data;
		}
	}
	
</script>
<!-- <script type="text/javascript">
var vm = new Vue({
	el : "#article",
	data : {
		articleList : [],
		dataSetList: {
            currentPage: 1,
            perPage: 10,
        },
	},
	methods : {
		articleList : function(){
	        var vm = this;
	        console.log("button");

	        $.ajax({
	            url: "/article/articleList",
	            data: {
		            	"currentPage" : vm.dataSetList.currentPage,
		    			"perPage" : vm.dataSetList.perPage
	            },
	            type: "GET",
	            success: function(data){
	            		console.log(data);
	            }
	        })
	    },
	        
	}

});
</script> -->