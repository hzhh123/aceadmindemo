<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>File Upload Example</title>

<link rel="stylesheet"
	href="${path}/static/aceadmin/assets/css/bootstrap.css" />
<link rel="stylesheet"
	href="${path}/static/aceadmin/assets/css/font-awesome.css" />

<!-- fonts -->
<link rel="stylesheet"
	href="${path}/static/aceadmin/assets/css/ace-fonts.css" />


<link rel="stylesheet" href="${path}/static/aceadmin/assets/css/ace.css" />
<!--[if lte IE 9]>
		  <link rel="stylesheet" href="${path}/static/aceadmin/assets/css/ace-ie.css" />
		<![endif]-->
<link rel="stylesheet" type="text/css"
	href="${path}/static/plugin/uploadTool/layer/skin/default/layer.css" />
</head>

<body>
	<div class="main-container">
		<div class="page-content">
			<div class="row">
				<div class="col-sm-6">
					<!-- our form -->
					<form id="myform" method="post" action="/upload3">
						<input type="file" name="avatar[]" multiple id="id-input-file-3" />

						<div class="hr hr-12 dotted"></div>

						<button type="submit" class="btn btn-sm btn-primary">Submit</button>
						<button type="reset" class="btn btn-sm">Reset</button>
					</form>
				</div>
				<label> <input type="checkbox" name="file-format"
					id="id-file-format" class="ace" /> <span class="lbl">仅允许上传图片
						</span>
				</label>
			</div>
		</div>
	</div>

	<!-- basic scripts -->
	<!--[if !IE]> -->
	<script type="text/javascript">
		 window.jQuery || document.write("<script src='${path}/static/aceadmin/assets/js/jquery.js'>"+"<"+"/script>");
		</script>
	<!-- <![endif]-->
	<!--[if IE]>
		<script type="text/javascript">
		 window.jQuery || document.write("<script src='${path}/static/aceadmin/assets/js/jquery1x.js'>"+"<"+"/script>");
		</script>
		<![endif]-->

	<!-- ace scripts -->
	<script src="${path}/static/aceadmin/assets/js/bootstrap.js"></script>
	<script src="${path}/static/aceadmin/assets/js/ace-elements.js"></script>
	<script src="${path}/static/aceadmin/assets/js/ace.js"></script>
	<script
		src="${path}/static/aceadmin/assets/js/ace/elements.fileinput.js"></script>
	<script type="text/javascript"
		src="${path}/static/plugin/uploadTool/layer/layer.js"></script>
	<script type="text/javascript">
		jQuery(function($) {
			var $form = $('#myform');
			//you can have multiple files, or a file input with "multiple" attribute
			var file_input = $form.find('input[type=file]');
			var upload_in_progress = false;

			file_input.ace_file_input({
				style: 'well',
				btn_choose: 'Drop files here or click to choose',
				btn_change: null,
				no_icon: 'ace-icon fa fa-cloud-upload',
				droppable: true,
				thumbnail: 'small',//large | fit //| true | large
				
				//maxSize: 11000000000,//bytes
				//allowExt: ["jpeg", "jpg", "png", "gif"],
				//allowMime: ["image/jpg", "image/jpeg", "image/png", "image/gif"],

				before_remove: function() {
					if(upload_in_progress)
						return false;//if we are in the middle of uploading a file, don't allow resetting file input
					return true;
				},

				preview_error: function(filename , code) {
					//code = 1 means file load error
					//code = 2 image load error (possibly file is not an image)
					//code = 3 preview failed
				}
			})
			file_input.on('file.error.ace', function(ev, info) {
				if(info.error_count['ext'] || info.error_count['mime']) alert('Invalid file type! Please select an image!');
				if(info.error_count['size']) alert('Invalid file size! Maximum 100KB');
				
				//you can reset previous selection on error
				//ev.preventDefault();
				//file_input.ace_file_input('reset_input');
			});
			
			
			var ie_timeout = null;//a time for old browsers uploading via iframe
			
			$form.on('submit', function(e) {
				e.preventDefault();
			
				var files = file_input.data('ace_input_files');
				if( !files || files.length == 0 ) return false;//no files selected
									
				var deferred ;
				if( "FormData" in window ) {
					//for modern browsers that support FormData and uploading files via ajax
					//we can do >>> var formData_object = new FormData($form[0]);
					//but IE10 has a problem with that and throws an exception
					//and also browser adds and uploads all selected files, not the filtered ones.
					//and drag&dropped files won't be uploaded as well
					
					//so we change it to the following to upload only our filtered files
					//and to bypass IE10's error
					//and to include drag&dropped files as well
					formData_object = new FormData();//create empty FormData object
					
					//serialize our form (which excludes file inputs)
					$.each($form.serializeArray(), function(i, item) {
						//add them one by one to our FormData 
						formData_object.append(item.name, item.value);							
					});
					//and then add files
					$form.find('input[type=file]').each(function(){
						var field_name = $(this).attr('name');
						//for fields with "multiple" file support, field name should be something like `myfile[]`

						var files = $(this).data('ace_input_files');
						if(files && files.length > 0) {
							for(var f = 0; f < files.length; f++) {
								formData_object.append(field_name, files[f]);
							}
						}
					});


					upload_in_progress = true;
					file_input.ace_file_input('loading', true);
					
					deferred = $.ajax({
						        url: $form.attr('action'),
						       type: $form.attr('method'),
						processData: false,//important
						contentType: false,//important
						   dataType: 'json',
						       data: formData_object
						/**
						,
						xhr: function() {
							var req = $.ajaxSettings.xhr();
							if (req && req.upload) {
								req.upload.addEventListener('progress', function(e) {
									if(e.lengthComputable) {	
										var done = e.loaded || e.position, total = e.total || e.totalSize;
										var percent = parseInt((done/total)*100) + '%';
										//percentage of uploaded file
									}
								}, false);
							}
							return req;
						},
						beforeSend : function() {
						},
						success : function() {
						}*/
					})

				}
				else {
					//for older browsers that don't support FormData and uploading files via ajax
					//we use an iframe to upload the form(file) without leaving the page

					deferred = new $.Deferred //create a custom deferred object
					
					var temporary_iframe_id = 'temporary-iframe-'+(new Date()).getTime()+'-'+(parseInt(Math.random()*1000));
					var temp_iframe = 
							$('<iframe id="'+temporary_iframe_id+'" name="'+temporary_iframe_id+'" \
							frameborder="0" width="0" height="0" src="about:blank"\
							style="position:absolute; z-index:-1; visibility: hidden;"></iframe>')
							.insertAfter($form)

					$form.append('<input type="hidden" name="temporary-iframe-id" value="'+temporary_iframe_id+'" />');
					
					temp_iframe.data('deferrer' , deferred);
					//we save the deferred object to the iframe and in our server side response
					//we use "temporary-iframe-id" to access iframe and its deferred object
					
					$form.attr({
								  method: 'POST',
								 enctype: 'multipart/form-data',
								  target: temporary_iframe_id //important
								});

					upload_in_progress = true;
					file_input.ace_file_input('loading', true);//display an overlay with loading icon
					$form.get(0).submit();
					
					
					//if we don't receive a response after 30 seconds, let's declare it as failed!
					ie_timeout = setTimeout(function(){
						ie_timeout = null;
						temp_iframe.attr('src', 'about:blank').remove();
						deferred.reject({'status':'fail', 'message':'Timeout!'});
					} , 30000);
				}


				////////////////////////////
				//deferred callbacks, triggered by both ajax and iframe solution
				deferred
				.done(function(result) {//success
					layer.msg(result.msg);
				})
				.fail(function(result) {//failure
					alert("There was an error");
				})
				.always(function() {//called on both success and failure
					if(ie_timeout) clearTimeout(ie_timeout)
					ie_timeout = null;
					upload_in_progress = false;
					file_input.ace_file_input('loading', false);
				});

				deferred.promise();
			});


			//when "reset" button of form is hit, file field will be reset, but the custom UI won't
			//so you should reset the ui on your own
			$form.on('reset', function() {
				$(this).find('input[type=file]').ace_file_input('reset_input_ui');
			});


			if(location.protocol == 'file:') alert("For uploading to server, you should access this page using 'http' protocal, i.e. via a webserver.");
			$('#id-file-format').removeAttr('checked').on('change', function() {
				var whitelist_ext, whitelist_mime;
				var btn_choose
				var no_icon
				if(this.checked) {
					btn_choose = "Drop images here or click to choose";
					no_icon = "ace-icon fa fa-picture-o";
		
					whitelist_ext = ["jpeg", "jpg", "png", "gif" , "bmp"];
					whitelist_mime = ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/bmp"];
				}
				else {
					btn_choose = "Drop files here or click to choose";
					no_icon = "ace-icon fa fa-cloud-upload";
					
					whitelist_ext = null;//all extensions are acceptable
					whitelist_mime = null;//all mimes are acceptable
				}
				var file_input = $('#id-input-file-3');
				file_input
				.ace_file_input('update_settings',
				{
					'btn_choose': btn_choose,
					'no_icon': no_icon,
					'allowExt': whitelist_ext,
					'allowMime': whitelist_mime
				})
				file_input.ace_file_input('reset_input');
				
				file_input
				.off('file.error.ace')
				.on('file.error.ace', function(e, info) {
					//console.log(info.file_count);//number of selected files
					//console.log(info.invalid_count);//number of invalid files
					//console.log(info.error_list);//a list of errors in the following format
					
					//info.error_count['ext']
					//info.error_count['mime']
					//info.error_count['size']
					
					//info.error_list['ext']  = [list of file names with invalid extension]
					//info.error_list['mime'] = [list of file names with invalid mimetype]
					//info.error_list['size'] = [list of file names with invalid size]
					
					
					/**
					if( !info.dropped ) {
						//perhapse reset file field if files have been selected, and there are invalid files among them
						//when files are dropped, only valid files will be added to our file array
						e.preventDefault();//it will rest input
					}
					*/
					
					
					//if files have been selected (not dropped), you can choose to reset input
					//because browser keeps all selected files anyway and this cannot be changed
					//we can only reset file field to become empty again
					//on any case you still should check files with your server side script
					//because any arbitrary file can be uploaded by user and it's not safe to rely on browser-side measures
				});
				
				
				/**
				file_input
				.off('file.preview.ace')
				.on('file.preview.ace', function(e, info) {
					console.log(info.file.width);
					console.log(info.file.height);
					e.preventDefault();//to prevent preview
				});
				*/
			
			});

		});

		</script>

</body>
</html>
