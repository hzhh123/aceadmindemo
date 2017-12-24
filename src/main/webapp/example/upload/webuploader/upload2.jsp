<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>分片上传</title>
<%@include file="/common/base.jsp" %>
<link rel="stylesheet" href="${staticPath}/static/aceadmin/assets/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${path}/static/plugin/uploadTool/webuploader/webuploader.css" />
<link rel="stylesheet" type="text/css" href="${path}/static/plugin/uploadTool/resetcss/style.css" />
<link rel="stylesheet" type="text/css" href="${path}/static/plugin/uploadTool/layer/skin/default/layer.css" />
<script type="text/javascript" src="${path}/static/plugin/uploadTool/jQuery/jquery-3.1.1.min.js"></script>
<script src="${staticPath}/static/aceadmin/assets/js/bootstrap.js"></script>
<script type="text/javascript" src="${path}/static/plugin/uploadTool/webuploader/webuploader.js"></script>
<script type="text/javascript" src="${path}/static/plugin/uploadTool/layer/layer.js"></script>
</head>
<body>
<div id="thelist" class="uploader-list"></div>
              <div style="margin:20px 20px 20px 0;">
              <div id="picker" class="form-control-focus">选择文件</div>
</div>
         <button id="btnSync" type="button" class="btn btn-warning">开始同步</button>
<script type="text/javascript">
var uploader = WebUploader.create({

            // swf文件路径
             swf: BASE_URL+'/static/plugin/uploadTool/webuploader/Uploader.swf',

            // 文件接收服务端。
            server : BASE_URL + '/test-sync/sync',

            chunked : true,//分片上传

            threads : 1,

            fromData : {
                guid : 'guid'
            },

            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick : '#picker',

            // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
            resize : false
        });

        // 当有文件被添加进队列的时候
        uploader.on('fileQueued', function(file) {
            //alert(123);
            $("#thelist").append(
                    '<div id="' + file.id + '" class="item">'
                            + '<h4 class="info">' + file.name + '</h4>'
                            + '<p class="state">等待上传...</p>' + '</div>');
        });

        uploader.on('uploadSuccess', function(file) {
            $('#' + file.id).find('p.state').text('已上传');
        });

        uploader.on('uploadError', function(file) {
            $('#' + file.id).find('p.state').text('上传出错');
        });

        uploader.on('uploadComplete', function(file) {
            $('#' + file.id).find('.progress').fadeOut();
        });

        $("#btnSync").on('click', function() {
            if ($(this).hasClass('disabled')) {
                return false;
            }
            uploader.options.formData.guid = Math.random();
            uploader.upload();

        });
    </script> 
    </body>
    </html>