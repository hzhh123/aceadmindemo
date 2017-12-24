<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Uploader</title>
<%@include file="/common/base.jsp" %>
<link rel="stylesheet" href="${staticPath}/static/aceadmin/assets/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${path}/static/plugin/uploadTool/webuploader/webuploader.css" />
 <link rel="stylesheet" type="text/css" href="${path}/static/plugin/uploadTool/resetcss/style.css" /> 
<link rel="stylesheet" type="text/css" href="${path}/static/plugin/uploadTool/layer/skin/default/layer.css" />
<script type="text/javascript" src="${path}/static/plugin/uploadTool/jQuery/jquery-3.1.1.min.js"></script>
<script src="${staticPath}/static/aceadmin/assets/js/bootstrap.js"></script>
<script type="text/javascript" src="${path}/static/plugin/uploadTool/webuploader/webuploader.js"></script>
<script type="text/javascript" src="${path}/static/plugin/uploadTool/webuploader/upload2.js"></script>
<script type="text/javascript" src="${path}/static/plugin/uploadTool/layer/layer.js"></script>
</head>
<body>
	<div id="container" class="col-md-6">
		<!--头部，相册选择和格式选择 -->
		<div id="uploader">
			<div class="queueList">
				<div id="dndArea" class="placeholder">
					<div id="filePicker"></div>
				</div>
			</div>
			<div class="statusBar" style="display: none;">
				<div class="progress">
					<span class="text">0%</span> <span class="percentage"></span>
				</div>
				<div class="info"></div>
				<div class="btns">
					<div id="filePicker2"></div>
					<div class="uploadBtn">开始上传</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>