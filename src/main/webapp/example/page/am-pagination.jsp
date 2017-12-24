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
	<link rel="stylesheet" href="${staticPath}/static/plugin/am-pagination/css/am-pagination.css" />
	<link rel="stylesheet" href="${staticPath}/static/plugin/am-pagination/css/amazeui.flat.css" />
<title>am-pagination分页</title>
</head>
<body>
<div class="container">
	<div class="row" style="min-height:500px;padding:2em 0;">
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
		<div id="ampaginationsm"></div>
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
<script src="${staticPath}/static/aceadmin/assets/js/bootstrap.js"></script>
<script type="text/javascript" src="${staticPath}/static/plugin/am-pagination/js/am-pagination.min.js"></script>
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

$(document).ready(function(){
	function amPagination(result){
		render(result.data);
		 var pagersm = window.amPagination('#ampaginationsm',{
	         page:result.page,
	         totals:result.count,
	         pageSize:10,
	         //theme:'bootstrap',//bootstrap样式
	         theme:'amazeui',
	         btnSize:'sm'
	      });
	      jQuery('#ampaginationsm').on('am.pagination.change',function(e){
	    	  $.ajax({
		    		url:'${path}/user/page',
		    		data:{"page":e.page,"pageSize":10},
		    		type:'POST',
		    		dataType:'json',
		    		success:function(result){
		    			render(result.data);
		    		}
		    	})
	      });
	}
	$.ajax({
		url:'${path}/user/page',
		data:{"page":1,"pageSize":10},
		type:'POST',
		dataType:'json',
		success:function(result){
			amPagination(result);
		}
	});
	 
})
</script>
</body>
</html>