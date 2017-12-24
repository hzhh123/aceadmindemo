<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	 <%@include file="/common/base.jsp" %>
	<link rel="stylesheet" href="${staticPath}/static/aceadmin/assets/css/bootstrap.css" />
	<link rel="stylesheet" href="${staticPath}/static/plugin/jqPaginator/style.css" />
<title>JqPaginator分页</title>
</head>
<body>
<div class="container">
	<div class="row" style="min-height:500px;padding:2em 0;">
	   <div class="demo customBootstrap">
		<table id="p2" class="table table-hover">
			<thead>
				<tr>	
					<td>ID</td>
					<td>用户名</td>
					<td>密码</td>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		<ul class="pagination" id="pagination2"></ul>
		<ul class="pagination" id="pagination1"></ul> 
	</div>
	</div>
	<div class="row">
		<br><br>
		<h4>极简样式</h4>
		<div class="demo">
                <p id="demo4-text"></p>
                <ul id="demo4" class="pagination pagination4"></ul>
            </div>
	</div>
</div>

<!-- basic scripts -->
<!--[if !IE]> -->
<script type="text/javascript">
			window.jQuery || document.write("<script src='${staticPath}/static/aceadmin/assets/js/jquery.js'>"+"<"+"/script>");
</script>
<!-- <![endif]-->
<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='${staticPath}/static/aceadmin/assets/js/jquery1x.js'>"+"<"+"/script>");
</script>
<![endif]-->
<script type="text/javascript" src="${staticPath}/static/plugin/jqPaginator/jqPaginator.js"></script>
<script type="text/javascript">
function render(data){
	var html="";
	$('#p2 tbody').empty();
	if(data.length>0){
		$.each(data,function(index,item){
			html+="<tr>";
			html+="<td>";
			html+=item.id;
			html+="</td>";
			html+="<td>";
			html+=item.username;
			html+="</td>";
			html+="<td>";
			html+=item.password;
			html+="</td>";
			html+="</tr>";
		})
	}
	$('#p2 tbody').append(html);
}
//GET请求方式
/* function jqPaginator(result){
			var totalPages;
			if(result.count%10==0){
				totalPages=result.count/10;
			}else{
				totalPages=Math.floor(result.count/10)+1;
			}
			$('#pagination1').append('<li class="page"><span>共'+result.count+'条/'+totalPages+'页</span></li>');
			$.jqPaginator('#pagination2', {
				totalCounts : result.count,
			    visiblePages: 5,
			    currentPage: result.page,
			    pageSize:10,
			    first: '<li class="first"><a href="javascript:void(0);"><<</a></li>',
			    prev: '<li class="prev"><a href="javascript:;"><</a></li>',
			    next: '<li class="next"><a href="javascript:void(0);">></a></li>',
				last: '<li class="last"><a href="javascript:void(0);">>></a></li>',
			    page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
			    onPageChange: function (num, type) {
			    	//render(result.data);
			    	$.ajax({
			    		url:'${path}/user/page?pageSize=10&page='+num,
			    		dataType:'json',
			    		success:function(result){
			    			render(result.data);
			    		}
			    	})
			    }
			});
} */
//POST请求方式
function jqPaginator2(result){
			var totalPages;
			if(result.count%10==0){
				totalPages=result.count/10;
			}else{
				totalPages=Math.floor(result.count/10)+1;
			}
			$('#pagination1').append('<li class="page"><span>共'+result.count+'条/'+totalPages+'页</span></li>');
			$.jqPaginator('#pagination2', {
				totalCounts : result.count,
			    visiblePages: 5,
			    currentPage: result.page,
			    pageSize:10,
			   /*  first: '<li class="first"><a href="javascript:void(0);"><<</a></li>',
			    prev: '<li class="prev"><a href="javascript:;"><</a></li>',
			    next: '<li class="next"><a href="javascript:void(0);">></a></li>',
				last: '<li class="last"><a href="javascript:void(0);">>></a></li>', */
				
				//customBootstrap样式
				first: '<li class="first"><a href="javascript:void(0);">首页<\/a><\/li>',
		        prev: '<li class="prev"><a href="javascript:void(0);"><i class="arrow arrow2"><\/i>上一页<\/a><\/li>',
		        next: '<li class="next"><a href="javascript:void(0);">下一页<i class="arrow arrow3"><\/i><\/a><\/li>',
		        last: '<li class="last"><a href="javascript:void(0);">末页<\/a><\/li>',
			    page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
			    onPageChange: function (num, type) {
			    	//render(result.data);
			    	$.ajax({
			    		url:'${path}/user/page',
			    		data:{"page":num,"pageSize":10},
			    		type:'POST',
			    		dataType:'json',
			    		success:function(result){
			    			render(result.data);
			    		}
			    	})
			    }
			});
}
$(document).ready(function(){
	//GET请求方式
	/* $.ajax({
		url:'${path}/user/page?pageSize=10&page=1',
		dataType:'json',
		success:function(result){
			jqPaginator(result);
		}
	}); */
	
	//POST请求方式
	$.ajax({
		url:'${path}/user/page',
		data:{"page":1,"pageSize":10},
		type:'POST',
		dataType:'json',
		success:function(result){
			jqPaginator2(result);
		}
	});
	
	  $("#demo4").jqPaginator({
          totalPages: 100,
          visiblePages: 1,
          currentPage: 1,
          prev: '<li class="prev"><a href="javascript:void(0);">Previous<\/a><\/li>',
          next: '<li class="next"><a href="javascript:void(0);">Next<\/a><\/li>',
          page: '<li class="page"><a href="javascript:void(0);"> {{page}} / {{totalPages}} <\/a><\/li>',
          onPageChange: function (n) {
              $("#demo4-text").html("当前第" + n + "页");
          }
      });

})
</script>
</body>
</html>