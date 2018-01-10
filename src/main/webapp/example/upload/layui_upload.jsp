<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>上传</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="${path}/static/plugin/layui/css/layui.css"  media="all"> 
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<div class="layui-container">  
<div class="layui-row">
<form class="layui-form layui-form-pane" action="" id="form">
 <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend>项目施工设计图</legend>
  </fieldset>
  <div class="layui-upload">
  <button type="button" class="layui-btn" id="test2">上传施工图纸</button> 
  <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
   	 预览图：
    <div class="layui-upload-list" id="demo2"></div>
 </blockquote>
</div>
</form>
</div>
</div>
<script type="text/javascript" src="${path}/static/plugin/uploadTool/jQuery/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="${path}/static/plugin/layui/layui.js" ></script> 
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
var type;
$(function(){
});
layui.use(['upload','form'], function(){
	  var form=layui.form
	  ,upload = layui.upload;
	//施工图上传
	  upload.render({
	    elem: '#test2'
	    ,url: '/upload3'
	    ,multiple: true
	    ,before: function(obj){
	      //预读本地文件示例，不支持ie8
	      obj.preview(function(index, file, result){
	        $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img" style="width:280px;height:280px;">')
	      });
	    }
	    ,done: function(res){
	      console.log(result);
	    }
	  }); 

});
</script>

</body>
</html>