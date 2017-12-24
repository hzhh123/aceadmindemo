<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>Profile Avatar Update</title>
		<%@include file="/common/base.jsp" %>
		<link rel="stylesheet" href="${staticPath}/static/aceadmin/assets/css/bootstrap.css" />
		<link rel="stylesheet" href="${staticPath}/static/aceadmin/assets/css/font-awesome.css" />
		
		<!-- fonts -->
		<link rel="stylesheet" href="${staticPath}/static/aceadmin/assets/css/ace-fonts.css" />
		
		
		<link rel="stylesheet" href="${staticPath}/static/aceadmin/assets/css/bootstrap-editable.css" />
		<link rel="stylesheet" href="${staticPath}/static/aceadmin/assets/css/jquery.gritter.css" />
		<link rel="stylesheet" href="${staticPath}/static/aceadmin/assets/css/ace.css" />
		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="${staticPath}/static/aceadmin/assets/css/ace-ie.css" />
		<![endif]-->
		<link rel="stylesheet" type="text/css" href="${path}/static/plugin/uploadTool/layer/skin/default/layer.css" />
	</head>

	<body>
	 <div class="main-container">
	   <div class="page-content">
	   <div class="row">

		<div class="center" style="width:400px; margin:12px;">
			<h3 class="header blue smaller lighter">
				Updating Profile Avatar
			</h3>
			
			<div>
				<span class="profile-picture">
					<img data-pk="13" src="${staticPath}/static/aceadmin/assets/avatars/profile-pic.jpg" alt="Alex's Avatar" class="img-responsive" id="avatar"  style="width:180px;height:200px"/>
				</span>
			</div>
		</div>

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
		
		
		<script src="${staticPath}/static/aceadmin/assets/js/bootstrap.js"></script>
		
		<script src="${staticPath}/static/aceadmin/assets/js/x-editable/bootstrap-editable.js"></script>
		<script src="${staticPath}/static/aceadmin/assets/js/x-editable/ace-editable.js"></script>
		<script src="${staticPath}/static/aceadmin/assets/js/jquery.gritter.js"></script>

		<!-- ace scripts -->
		<script src="${staticPath}/static/aceadmin/assets/js/ace-elements.js"></script>
		<script src="${staticPath}/static/aceadmin/assets/js/ace.js"></script>
		
				<script type="text/javascript" src="${path}/static/plugin/uploadTool/layer/layer.js"></script>	
		<script type="text/javascript">
		jQuery(function($) {
			$.fn.editable.defaults.mode = 'inline';
			$.fn.editableform.loading = "<div class='editableform-loading'><i class='ace-icon fa fa-spinner fa-spin fa-2x light-blue'></i></div>";
			$.fn.editableform.buttons = '<button type="submit" class="btn btn-info editable-submit"><i class="ace-icon fa fa-check"></i></button>'+
										'<button type="button" class="btn editable-cancel"><i class="ace-icon fa fa-times"></i></button>';    


			try {//ie8 throws some harmless exceptions, so let's catch'em

				//first let's add a fake appendChild method for Image element for browsers that have a problem with this
				//because editable plugin calls appendChild, and it causes errors on IE
				try {
					document.createElement('IMG').appendChild(document.createElement('B'));
				} catch(e) {
					Image.prototype.appendChild = function(el){}
				}

				var last_gritter
				$('#avatar').editable({
					type: 'image',
					name: 'avatar',
					value: null,
					onblur: 'ignore',
					image: {
						//specify ace file input plugin's options here
						btn_choose: 'Change Avatar',
						droppable: true,
						maxSize: 110000,//~100Kb

						//and a few extra ones here
						name: 'avatar',//put the field name here as well, will be used inside the custom plugin
						on_error : function(error_type) {//on_error function will be called when the selected file has a problem
							if(last_gritter) $.gritter.remove(last_gritter);
							if(error_type == 1) {//file format error
								last_gritter = $.gritter.add({
									title: '文件不是图片格式!',
									text: '请选择一个 jpg|gif|png 图片!',
									class_name: 'gritter-error gritter-center'
								});
							} else if(error_type == 2) {//file size rror
								last_gritter = $.gritter.add({
									title: '文件太大!',
									text: '图片大小不能超过 100Kb!',
									class_name: 'gritter-error gritter-center'
								});
							}
							else {//other error
							}
						},
						on_success : function() {
							$.gritter.removeAll();
						}
					},
					url: function(params) {
						// ***UPDATE AVATAR HERE*** //
						var submit_url = BASE_URL+'/upload4';//please modify submit_url accordingly
						var deferred = null;
						var avatar = '#avatar';

						//if value is empty (""), it means no valid files were selected
						//but it may still be submitted by x-editable plugin
						//because "" (empty string) is different from previous non-empty value whatever it was
						//so we return just here to prevent problems
						var value = $(avatar).next().find('input[type=hidden]:eq(0)').val();
						if(!value || value.length == 0) {
							deferred = new $.Deferred
							deferred.resolve();
							return deferred.promise();
						}

						var $form = $(avatar).next().find('.editableform:eq(0)')
						var file_input = $form.find('input[type=file]:eq(0)');
						var pk = $(avatar).attr('data-pk');//primary key to be sent to server

						var ie_timeout = null


						if( "FormData" in window ) {
							var formData_object = new FormData();//create empty FormData object
							
							//serialize our form (which excludes file inputs)
							$.each($form.serializeArray(), function(i, item) {
								//add them one by one to our FormData 
								formData_object.append(item.name, item.value);							
							});
							//and then add files
							$form.find('input[type=file]').each(function(){
								var field_name = $(this).attr('name');
								var files = $(this).data('ace_input_files');
								if(files && files.length > 0) {
									formData_object.append(field_name, files[0]);
								}
							});

							//append primary key to our formData
							formData_object.append('pk', pk);

							deferred = $.ajax({
										url: submit_url,
									   type: 'POST',
								processData: false,//important
								contentType: false,//important
								   dataType: 'json',//server response type
									   data: formData_object
							})
						}
						else {
							deferred = new $.Deferred

							var temporary_iframe_id = 'temporary-iframe-'+(new Date()).getTime()+'-'+(parseInt(Math.random()*1000));
							var temp_iframe = 
									$('<iframe id="'+temporary_iframe_id+'" name="'+temporary_iframe_id+'" \
									frameborder="0" width="0" height="0" src="about:blank"\
									style="position:absolute; z-index:-1; visibility: hidden;"></iframe>')
									.insertAfter($form);
									
							$form.append('<input type="hidden" name="temporary-iframe-id" value="'+temporary_iframe_id+'" />');
							
							//append primary key (pk) to our form
							$('<input type="hidden" name="pk" />').val(pk).appendTo($form);
							
							temp_iframe.data('deferrer' , deferred);
							//we save the deferred object to the iframe and in our server side response
							//we use "temporary-iframe-id" to access iframe and its deferred object

							$form.attr({
									  action: submit_url,
									  method: 'POST',
									 enctype: 'multipart/form-data',
									  target: temporary_iframe_id //important
							});

							$form.get(0).submit();

							//if we don't receive any response after 30 seconds, declare it as failed!
							ie_timeout = setTimeout(function(){
								ie_timeout = null;
								temp_iframe.attr('src', 'about:blank').remove();
								deferred.reject({'status':'fail', 'message':'Timeout!'});
							} , 30000);
						}


						//deferred callbacks, triggered by both ajax and iframe solution
						deferred
						.done(function(result) {//success
							/* var res = result[0];//the `result` is formatted by your server side response and is arbitrary
							if(res.status == 'OK') $(avatar).get(0).src = res.url;
							else alert(res.message); */
							
							$(avatar).get(0).src = result.map.url;
							console.log(result);
							layer.msg(result.msg);
						})
						.fail(function(result) {//failure
							alert("There was an error");
						})
						.always(function() {//called on both success and failure
							if(ie_timeout) clearTimeout(ie_timeout)
							ie_timeout = null;	
						});

						return deferred.promise();
						// ***END OF UPDATE AVATAR HERE*** //
					},
						
					success: function(response, newValue) {
					}
				})
				
				/**
				//let's display edit mode by default?
				$('#avatar').editable('show').on('hidden', function(e, reason) {
					if(reason == 'onblur') {
						$('#avatar').editable('show');
						return;
					}
					$('#avatar').off('hidden');
				})
				*/
				
			}catch(e) {}
			
		});

					
		if(location.protocol == 'file:') alert("For uploading to server, you should access this page using 'http' protocal, i.e. via a webserver.");
		</script>

	</body>
</html>
