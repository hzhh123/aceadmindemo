<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>Hello MUI</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<!--标准mui.css-->
		<link rel="stylesheet" href="/static/mui/css/mui.min.css">
		<!--App自定义的css-->
		<link rel="stylesheet" type="text/css" href="/static/mui/css/app.css"/>
		<style>
			
			.title{
				margin: 20px 15px 10px;
				color: #6d6d72;
				font-size: 15px;
			}
			
			.oa-contact-cell.mui-table .mui-table-cell {
				padding: 11px 0;
				vertical-align: middle;
			}
			
			.oa-contact-cell {
				position: relative;
				margin: -11px 0;
			}
	
			.oa-contact-avatar {
				width: 75px;
			}
			.oa-contact-avatar img {
				border-radius: 50%;
			}
			.oa-contact-content {
				width: 100%;
			}
			.oa-contact-name {
				margin-right: 20px;
			}
			.oa-contact-name, oa-contact-position {
				float: left;
			}
			.mui-bar-nav{
			 background:#007aff;
			}
			.mui-bar-nav .mui-title{
			 color:#fff;
			}
		</style>
	</head>

	<body>
		<header class="mui-bar mui-bar-nav">
			<h1 class="mui-title">智慧工地</h1>
		</header>
		<nav class="mui-bar mui-bar-tab">
			<a class="mui-tab-item mui-active" href="#tabbar">
				<span class="mui-icon mui-icon-home"></span>
				<span class="mui-tab-label">首页</span>
			</a>
			<a class="mui-tab-item" href="#tabbar-with-chat">
				<span class="mui-icon mui-icon-videocam"></span>
				<span class="mui-tab-label">监控</span>
			</a>
			<a class="mui-tab-item" href="#tabbar-with-contact">
				<span class="mui-icon mui-icon-contact"></span>
				<span class="mui-tab-label">我的</span>
			</a>
		</nav>
		<div class="mui-content">
			<div id="tabbar" class="mui-control-content mui-active">
				 <ul class="mui-table-view">
					 <li class="mui-table-view-cell">
					 <a href="#" class="mui-navigate-right">
		                    <span class="mui-icon mui-icon-home"></span>
		                    <span>人员</span>
		                    <span style="float:right;margin-right:30px;color:#bbb">27</span>
		                 </a>
		              </li>
					 <li class="mui-table-view-cell">
					 <a href="#" class="mui-navigate-right">
		                    <span class="mui-icon mui-icon-home"></span>
		                    <span>人员</span>
		                    <span style="float:right;margin-right:30px;color:#bbb">27</span>
		                 </a>
		              </li>
					 <li class="mui-table-view-cell">
					 <a href="#" class="mui-navigate-right">
		                    <span class="mui-icon mui-icon-home"></span>
		                    <span>人员</span>
		                    <span style="float:right;margin-right:30px;color:#bbb">27</span>
		                 </a>
		              </li>
				</ul>
			</div>
			<div id="tabbar-with-chat" class="mui-control-content">
				<div class="title">
					右侧有导航箭头
				</div>
				<ul class="mui-table-view">
					<li class="mui-table-view-cell">
						<a class="mui-navigate-right">
							Item 1
						</a>
					</li>
					<li class="mui-table-view-cell">
						<a class="mui-navigate-right">
							Item 2
						</a>
					</li>
					<li class="mui-table-view-cell">
						<a class="mui-navigate-right">
							Item 3
						</a>
					</li>
				</ul>
				<div class="title">
					右侧有导航箭头
				</div>
				<ul class="mui-table-view">
					<li class="mui-table-view-cell">
						<a class="mui-navigate-right">
							Item 1
						</a>
					</li>
					<li class="mui-table-view-cell">
						<a class="mui-navigate-right">
							Item 2
						</a>
					</li>
					<li class="mui-table-view-cell">
						<a class="mui-navigate-right" href="/mui-example/jsp/login.jsp">
							Item 31
						</a>
					</li>
				</ul>
				<div class="title">
					右侧有导航箭头
				</div>
				<ul class="mui-table-view">
					<li class="mui-table-view-cell">
						<a class="mui-navigate-right">
							Item 1
						</a>
					</li>
					<li class="mui-table-view-cell">
						<a class="mui-navigate-right">
							Item 2
						</a>
					</li>
					<li class="mui-table-view-cell">
						<a class="mui-navigate-right">
							Item 3
						</a>
					</li>
				</ul>
			</div>
			<div id="tabbar-with-contact" class="mui-control-content">
				<ul class="mui-table-view">
					<li class="mui-table-view-cell">
						<a class="mui-navigate-right" href="/mui-example/jsp/login.jsp">
							退出
						</a>
					</li>
				</ul>
			</div>
		</div>
	</body>
	<script src="/static/mui/js/mui.min.js"></script>
	<script>
	</script>
</html>