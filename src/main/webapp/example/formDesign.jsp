<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>表单设计</title>
<%@include file="/common/base.jsp"%>
<meta name="description"
	content="Restyling jQuery UI Widgets and Elements" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<!-- bootstrap & fontawesome -->
<link rel="stylesheet"
	href="${staticPath}/static/aceadmin/assets/css/bootstrap.css" />
<link rel="stylesheet"
	href="${staticPath}/static/plugin/font-awesome-4.7.0/css/font-awesome.css" />

<!-- page specific plugin styles -->
<link rel="stylesheet"
	href="${staticPath}/static/aceadmin/assets/css/jquery-ui.css" />

<!-- text fonts -->
<link rel="stylesheet"
	href="${staticPath}/static/aceadmin/assets/css/ace-fonts.css" />

<!-- ace styles -->
<link rel="stylesheet"
	href="${staticPath}/static/aceadmin/assets/css/ace.css"
	class="ace-main-stylesheet" id="main-ace-style" />

<!--[if lte IE 9]>
			<link rel="stylesheet" href="${staticPath}/static/aceadmin/assets/css/ace-part2.css" class="ace-main-stylesheet" />
		<![endif]-->

<!--[if lte IE 9]>
		  <link rel="stylesheet" href="${staticPath}/static/aceadmin/assets/css/ace-ie.css" />
		<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->
<script src="${staticPath}/static/aceadmin/assets/js/ace-extra.js"></script>

<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

<!--[if lte IE 8]>
		<script src="${staticPath}/static/aceadmin/assets/js/html5shiv.js"></script>
		<script src="${staticPath}/static/aceadmin/assets/js/respond.js"></script>
		<![endif]-->
</head>


<style type="text/css">
</style>
</head>
<body style="background: #fff;">
	<div class="container-fluid">
		<div class="blue" style="padding: 5px;">
			<h4 class="pull-left ">
				<i class="ace-icon fa fa-wpforms"></i> 表单设计
			</h4>
			<div class="pull-right btn-group" style="margin-top: 6px;">
				<button class="btn btn-primary btn-white btn-sm">查看源码</button>
				<button class="btn btn-primary btn-white btn-sm">保存</button>
			</div>
		</div>
		<hr style="clear: both; margin-top: 10px; margin-bottom: 0;" />
		<div class="row-fluid" id="container">
			<div class="col-md-3"
				style="padding: 2px; height: 100%; border: 1px solid #e2e2e2; border-top: 0; overflow-x: hidden; overflow-y: auto;">
				<div id="accordion" class="accordion-style2">
					<div class="group">
						<h3 class="accordion-header">布局</h3>
						<div>
							<div class="btn-group">
								<button class="btn btn-white btn-primary ui-widget-content"
									style="width: 96px; margin-top: 2px;" >两栏式</button>
								<button class="btn btn-white btn-primary"
									style="width: 96px; margin-top: 2px; " id="layout1">一栏式</button>
							</div>
						</div>
					</div>
					<div class="group">
						<h3 class="accordion-header">文本输入</h3>
						<div>
							<div class="btn-group">
								<button class="btn btn-white btn-primary"
									style="width: 96px; margin-top: 2px;">文本框</button>
								<button class="btn btn-white btn-primary"
									style="width: 96px; margin-top: 2px;">文本域</button>
								<button class="btn btn-white btn-primary"
									style="width: 96px; margin-top: 2px;">单选框</button>
								<button class="btn btn-white btn-primary"
									style="width: 96px; margin-top: 2px;">复选框</button>
								<button class="btn btn-white btn-primary"
									style="width: 96px; margin-top: 2px;">下拉选择框</button>
								<button class="btn btn-white btn-primary"
									style="width: 96px; margin-top: 2px;">开关</button>
								<button class="btn btn-white btn-primary"
									style="width: 96px; margin-top: 2px;">联动选择</button>
								<button class="btn btn-white btn-primary"
									style="width: 96px; margin-top: 2px;">联动输入</button>
							</div>
						</div>
					</div>

					<div class="group">
						<h3 class="accordion-header">基本组件</h3>

						<div>
							<p>Sed non urna. Donec et ante. Phasellus eu ligula.
								Vestibulum sit amet purus. Vivamus hendrerit, dolor at aliquet
								laoreet, mauris turpis porttitor velit, faucibus interdum tellus
								libero ac justo. Vivamus non quam. In suscipit faucibus urna.</p>
						</div>
					</div>

					<div class="group">
						<h3 class="accordion-header">高级组件</h3>

						<div>
							<p>Nam enim risus, molestie et, porta ac, aliquam ac, risus.
								Quisque lobortis. Phasellus pellentesque purus in massa. Aenean
								in pede. Phasellus ac libero ac tellus pellentesque semper. Sed
								ac felis. Sed commodo, magna quis lacinia ornare, quam ante
								aliquam nisi, eu iaculis leo purus venenatis dui.</p>

							<ul>
								<li>List item one</li>
								<li>List item two</li>
								<li>List item three</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- #accordion -->

			</div>
			<div class="col-md-9"
				style="height: 100%; padding: 0; border: 1px solid #e2e2e2; border-top: 0; border-left: 0; overflow-x: hidden; overflow-y: hidden;">
					<div id="right-menu" class="modal aside" data-body-scroll="false" data-offset="true" data-placement="right" data-fixed="true" data-backdrop="false" tabindex="-1">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header no-padding">
												<div class="table-header">
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
														<span class="white">&times;</span>
													</button>
													属性设置
												</div>
											</div>

											<div class="modal-body">
												<form class="form-horizontal" role="form">
					<div class="row">
						<div class="form-group col-md-12">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1"> 类型 </label>
								<div class="col-sm-9">
									<input type="text" id="form-field-1" placeholder="Username"
										class="col-xs-12" />
								</div>
						</div>

						<div class="form-group col-md-12">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1"> 数据库字段名</label>
								<div class="col-sm-9">
									<input type="text" id="form-field-1" placeholder="Username"
										class="col-xs-12" />
								</div>
						</div>
						<div class="form-group col-md-12">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1"> 名称</label>
								<div class="col-sm-9">
									<input type="text" id="form-field-1" placeholder="Username"
										class="col-xs-12" />
								</div>
						</div>
						</div>
						<div class="row">
						<div class="form-group col-md-12">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1">字段长度</label>
								<div class="col-sm-9" style="margin-left:-5px;">
									<input id="spinner" name="value" type="text" />
								</div>
						</div>
						<div class="form-group col-md-12">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1">占位符（placeholder）</label>
								<div class="col-sm-9">
									<input type="text" id="form-field-1" placeholder="请输入.."
										class="col-xs-12" />
								</div>
						</div>
						<div class="form-group col-md-12">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1">默认值</label>
								<div class="col-sm-9">
									<input type="text" id="form-field-1" placeholder="请输入.."
										class="col-xs-12" />
								</div>
						</div>
						</div>
						<div class="row">
						<div class="form-group col-md-12">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1" >其他 </label>
								<div class="col-sm-9">
									<div class="checkbox" style="margin-left: 5px;">
										<label> <input name="form-field-checkbox" 
											type="checkbox" class="ace"  id="computations"/> <span class="lbl">
												是否计算</span>
										</label> <label> <input name="form-field-checkbox"
											type="checkbox" class="ace" /> <span class="lbl">
												隐藏</span>
										</label>
										<label> <input name="form-field-checkbox"
											type="checkbox" class="ace" /> <span class="lbl">
												只读</span>
										</label>
										<label> <input name="form-field-checkbox"
											type="checkbox" class="ace" /> <span class="lbl">
												禁用</span>
										</label>
									</div>
								</div>
						</div>
						</div>
						
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1"> 表达式 </label>
								<div class="col-sm-9" >
									<textarea id="expression" rows="" cols="" class="col-sm-11 col-xs-12" disabled></textarea>
								</div>
							</div>
						</div>
						</form>
											</div>
										</div><!-- /.modal-content -->
										 <button class="aside-trigger btn btn-info btn-app btn-xs ace-settings-btn" data-target="#right-menu" data-toggle="modal" type="button">
											<i data-icon1="fa-plus" data-icon2="fa-minus" class="ace-icon fa fa-plus bigger-110 icon-only"></i>
										</button> 
									</div><!-- /.modal-dialog -->
								</div>
				<div id="form" class="container-fluid"
					style="margin-top: 5px; margin-bottom: 5px; overflow-y: auto;">
					<form class="form-horizontal" role="form">
			
					</form>
				</div>
				<!--<div class=""
					style="height: 200px; width: 100%; margin: 0;padding:10px; border: 1px solid #e2e2e2; border-left: 0; border-right: 0; overflow-x: hidden; overflow-y: auto;">
					 <form class="form-horizontal" role="form">
					<div class="row">
						<div class="form-group col-md-4">
								<label class="col-sm-4 control-label no-padding-right"
									for="form-field-1"> 类型 </label>
								<div class="col-sm-7">
									<input type="text" id="form-field-1" placeholder="Username"
										class="col-xs-12" />
								</div>
						</div>

						<div class="form-group col-md-4">
								<label class="col-sm-4 control-label no-padding-right"
									for="form-field-1"> 数据库字段名</label>
								<div class="col-sm-7">
									<input type="text" id="form-field-1" placeholder="Username"
										class="col-xs-12" />
								</div>
						</div>
						<div class="form-group col-md-4">
								<label class="col-sm-4 control-label no-padding-right"
									for="form-field-1"> 名称</label>
								<div class="col-sm-7">
									<input type="text" id="form-field-1" placeholder="Username"
										class="col-xs-12" />
								</div>
						</div>
						</div>
						<div class="row">
						<div class="form-group col-md-4">
								<label class="col-sm-4 control-label no-padding-right"
									for="form-field-1">字段长度</label>
								<div class="col-sm-7" style="margin-left:-5px;">
									<input id="spinner" name="value" type="text" />
								</div>
						</div>
						<div class="form-group col-md-4">
								<label class="col-sm-4 control-label no-padding-right"
									for="form-field-1">占位符（placeholder）</label>
								<div class="col-sm-7">
									<input type="text" id="form-field-1" placeholder="请输入.."
										class="col-xs-12" />
								</div>
						</div>
						<div class="form-group col-md-4">
								<label class="col-sm-4 control-label no-padding-right"
									for="form-field-1">默认值</label>
								<div class="col-sm-7">
									<input type="text" id="form-field-1" placeholder="请输入.."
										class="col-xs-12" />
								</div>
						</div>
						</div>
						<div class="row">
						<div class="form-group col-md-12">
								<label class="col-sm-1 control-label no-padding-right"
									for="form-field-1" >其他 </label>
								<div class="col-sm-11">
									<div class="checkbox" style="margin-left: 5px;">
										<label> <input name="form-field-checkbox" 
											type="checkbox" class="ace"  id="computations"/> <span class="lbl">
												是否计算</span>
										</label> <label> <input name="form-field-checkbox"
											type="checkbox" class="ace" /> <span class="lbl">
												隐藏</span>
										</label>
										<label> <input name="form-field-checkbox"
											type="checkbox" class="ace" /> <span class="lbl">
												只读</span>
										</label>
										<label> <input name="form-field-checkbox"
											type="checkbox" class="ace" /> <span class="lbl">
												禁用</span>
										</label>
									</div>
								</div>
						</div>
						</div>
						
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-sm-1 control-label no-padding-right"
									for="form-field-1"> 表达式 </label>
								<div class="col-sm-10" style="margin-left:10px;">
									<textarea id="expression" rows="" cols="" class="col-sm-11 col-xs-12" disabled></textarea>
								</div>
							</div>
						</div>
						</form> 
					</div>-->
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
	<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='${staticPath}/static/aceadmin/assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>
	<script src="${staticPath}/static/aceadmin/assets/js/bootstrap.js"></script>

	<!-- page specific plugin scripts -->

	<!--[if lte IE 8]>
		  <script src="${staticPath}/static/aceadmin/assets/js/excanvas.js"></script>
		<![endif]-->
	<script src="${staticPath}/static/aceadmin/assets/js/jquery-ui.custom.js"></script>
	<script src="${staticPath}/static/aceadmin/assets/js/jquery-ui.js"></script>
	<script
		src="${staticPath}/static/aceadmin/assets/js/jquery.ui.touch-punch.js"></script>

	<!-- ace scripts -->
	<script
		src="${staticPath}/static/aceadmin/assets/js/ace/elements.scroller.js"></script>
	<script
		src="${staticPath}/static/aceadmin/assets/js/ace/elements.colorpicker.js"></script>
	<script
		src="${staticPath}/static/aceadmin/assets/js/ace/elements.fileinput.js"></script>
	<script
		src="${staticPath}/static/aceadmin/assets/js/ace/elements.typeahead.js"></script>
	<script
		src="${staticPath}/static/aceadmin/assets/js/ace/elements.wysiwyg.js"></script>
	<script
		src="${staticPath}/static/aceadmin/assets/js/ace/elements.spinner.js"></script>
	<script
		src="${staticPath}/static/aceadmin/assets/js/ace/elements.treeview.js"></script>
	<script
		src="${staticPath}/static/aceadmin/assets/js/ace/elements.wizard.js"></script>
	<script
		src="${staticPath}/static/aceadmin/assets/js/ace/elements.aside.js"></script>
	<script src="${staticPath}/static/aceadmin/assets/js/ace/ace.js"></script>
	<script
		src="${staticPath}/static/aceadmin/assets/js/ace/ace.ajax-content.js"></script>
	<script
		src="${staticPath}/static/aceadmin/assets/js/ace/ace.touch-drag.js"></script>
	<script
		src="${staticPath}/static/aceadmin/assets/js/ace/ace.sidebar.js"></script>
	<script
		src="${staticPath}/static/aceadmin/assets/js/ace/ace.sidebar-scroll-1.js"></script>
	<script
		src="${staticPath}/static/aceadmin/assets/js/ace/ace.submenu-hover.js"></script>
	<script
		src="${staticPath}/static/aceadmin/assets/js/ace/ace.widget-box.js"></script>
	<script
		src="${staticPath}/static/aceadmin/assets/js/ace/ace.settings.js"></script>
	<script
		src="${staticPath}/static/aceadmin/assets/js/ace/ace.settings-rtl.js"></script>
	<script
		src="${staticPath}/static/aceadmin/assets/js/ace/ace.settings-skin.js"></script>
	<script
		src="${staticPath}/static/aceadmin/assets/js/ace/ace.widget-on-reload.js"></script>
	<script
		src="${staticPath}/static/aceadmin/assets/js/ace/ace.searchbox-autocomplete.js"></script>


	<!-- the following scripts are used in demo only for onpage help and you don't need them -->
	<link rel="stylesheet"
		href="${staticPath}/static/aceadmin/assets/css/ace.onpage-help.css" />
	<link rel="stylesheet"
		href="${staticPath}/static/aceadmin/docs/assets/js/themes/sunburst.css" />

	<script type="text/javascript"> ace.vars['base'] = '${staticPath}/static/aceadmin'; </script>
	<script
		src="${staticPath}/static/aceadmin/assets/js/ace/elements.onpage-help.js"></script>
	<script
		src="${staticPath}/static/aceadmin/assets/js/ace/ace.onpage-help.js"></script>
	<script src="${staticPath}/static/aceadmin/docs/assets/js/rainbow.js"></script>
	<script
		src="${staticPath}/static/aceadmin/docs/assets/js/language/generic.js"></script>
	<script
		src="${staticPath}/static/aceadmin/docs/assets/js/language/html.js"></script>
	<script
		src="${staticPath}/static/aceadmin/docs/assets/js/language/css.js"></script>
	<script
		src="${staticPath}/static/aceadmin/docs/assets/js/language/javascript.js"></script>
	<script type="text/javascript"
		src="${staticPath}/static/plugin/bootstrap-dialog/js/bootstrap-dialog.js"></script>
	<script type="text/javascript"
		src="${staticPath}/static/plugin/toastr/toastr.min.js"></script>

	<script type="text/javascript">
	//设置高度
	function init(){
		if($(window).width()>768){
			$('#container').height($(window).height()-50);
			//$('#form').height($(window).height()-250);
			
		}else{
			$('#container').height(500);
			//$('#form').height(290);
			$('#container div').css('border-left','1px solid #e2e2e2');
			$('#container div').css('border-right','1px solid #e2e2e2');
		}
	}
	$(function(){
		init();
		$(window).resize(function(){
			init();
		});
		
		//jquery accordion
		$( "#accordion" ).accordion({
			collapsible: true ,
			heightStyle: "content",
			animate: 250,
			header: ".accordion-header"
		}).sortable({
			axis: "y",
			handle: ".accordion-header",
			stop: function( event, ui ) {
				// IE doesn't register the blur when sorting
				// so trigger focusout handlers to remove .ui-state-focus
				ui.item.children( ".accordion-header" ).triggerHandler( "focusout" );
			}
		});
		var spinner = $( "#spinner" ).spinner({
			create: function( event, ui ) {
				//add custom classes and icons
				$(this)
				.next().addClass('btn btn-success').html('<i class="ace-icon fa fa-plus"></i>')
				.next().addClass('btn btn-danger').html('<i class="ace-icon fa fa-minus"></i>')
				
				//larger buttons on touch devices
				if('touchstart' in document.documentElement) 
					$(this).closest('.ui-spinner').addClass('ui-spinner-touch');
			}
		});
		$('.modal.aside').ace_aside();
		
		$('#computations').change(function(){
			if($(this).is(':checked')){
				document.getElementById("expression").removeAttribute("disabled");
			}else{
				document.getElementById("expression").setAttribute('disabled',true);
			}
		})
		
		
	})
</script>
</body>
</html>

