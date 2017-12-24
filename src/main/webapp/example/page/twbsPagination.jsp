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
<title>twbsPagination分页</title>
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
		 <ul id="pagination-demo" class="pagination-sm"></ul>
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
<script type="text/javascript" src="${staticPath}/static/plugin/twbsPagination/jquery.twbsPagination.js"></script>
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
	 function twbsPagination(result){
			var totalPages;
			if(result.count%10==0){
				totalPages=result.count/10;
			}else{
				totalPages=Math.floor(result.count/10)+1;
			}
			$('#pagination-demo').twbsPagination({
		        totalPages: totalPages,
		        visiblePages: 5,
		        first:'<<',
		        next:'>',
		        prev:'<',
		        last:'>>',
		        onPageClick: function (event, page) {
		        	$.ajax({
			    		url:'${path}/user/page',
			    		data:{"page":page,"pageSize":10},
			    		type:'POST',
			    		dataType:'json',
			    		success:function(result){
			    			render(result.data);
			    		}
			    	})
		        }
		    });
		}
	 $.ajax({
			url:'${path}/user/page',
			data:{"page":1,"pageSize":10},
			type:'POST',
			dataType:'json',
			success:function(result){
				twbsPagination(result);
			}
		});
	 
})
</script>
</body>
</html>