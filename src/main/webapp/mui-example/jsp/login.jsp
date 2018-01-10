<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="ui-page-login">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title></title>
<link href="/static/mui/login/css/mui.min.css" rel="stylesheet" />
<link href="/static/mui/login/css/style.css" rel="stylesheet" />
<style>
.area {
	margin: 20px auto 0px auto;
}

.mui-input-group {
	margin-top: 10px;
}

.mui-input-group:first-child {
	margin-top: 20px;
}

.mui-input-group label {
	width: 22%;
}

.mui-input-row label ~input, .mui-input-row label ~select,
	.mui-input-row label ~textarea {
	width: 78%;
}

.mui-checkbox input[type=checkbox], .mui-radio input[type=radio] {
	top: 6px;
}

.mui-content-padded {
	margin-top: 25px;
}

.mui-btn {
	padding: 10px;
}

.link-area {
	display: block;
	margin-top: 25px;
	text-align: center;
}

.spliter {
	color: #bbb;
	padding: 0px 8px;
}

.oauth-area {
	position: absolute;
	bottom: 20px;
	left: 0px;
	text-align: center;
	width: 100%;
	padding: 0px;
	margin: 0px;
}

.oauth-area .oauth-btn {
	display: inline-block;
	width: 50px;
	height: 50px;
	background-size: 30px 30px;
	background-position: center center;
	background-repeat: no-repeat;
	margin: 0px 20px;
	/*-webkit-filter: grayscale(100%); */
	border: solid 1px #ddd;
	border-radius: 25px;
}

.oauth-area .oauth-btn:active {
	border: solid 1px #aaa;
}

.oauth-area .oauth-btn.disabled {
	background-color: #ddd;
}
</style>

</head>

<body>
	<header class="mui-bar mui-bar-nav">
		<h1 class="mui-title">登录</h1>
	</header>
	<div class="mui-content">
		<form id='login-form' class="mui-input-group">
			<div class="mui-input-row">
				<label style="width: 30%">手机号码</label> <input id='username' type="text" name="username"
					class="mui-input-clear mui-input" placeholder="请输入账号" style="width: 70%">
			</div>
			<div class="mui-input-row">
				<label style="width: 30%">验证码</label> <input type="text"
					style="width: 70%" placeholder="请输入短信验证码"  name="code" id="u_code">
			</div>
			<div class="mui-input-row">
				<div style="float: right; padding-top: 10px;">
					<a href="javascript:senmobile(60);" id="get_code" disabled="true">获取验证码</a>
				</div>
			</div>
		</form>
		<div class="mui-content-padded">
			<button id='login' class="mui-btn mui-btn-block mui-btn-primary">登录</button>
		</div>
	</div>
	<script type="text/javascript"
		src="/static/aceadmin/assets/js/jquery.js"></script>
	<script src="/static/mui/login/js/mui.min.js"></script>
	<script src="/static/mui/login/js/mui.enterfocus.js"></script>
	<script src="/static/mui/login/js/app.js"></script>
	<script>
		var issend=true;
		function senmobile(t){  
		if(issend){ 
		//验证电话号码手机号码 
		var phoneObj = document.getElementById('username'); 
		var get_code=document.getElementById('get_code'); 
		if (phoneObj.value != ""){  
		var phoneVal=phoneObj.value;  
		var p1 = /^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/;  
		var me = false;  
		if (p1.test(phoneVal)) me=true;  
		if (!me){  
		   phoneObj.value='';  
		   mui.toast('请输入正确的手机号码'); 
		   phoneObj.focus();  
		   return false;  
		}else{ 
		issend=false;   
		mui.ajax({ 
		     url:"api_user.php?act=sendmobileregister", 
		     dataType:"text", 
		     type:"POST", 
		     data:{'mobile':phoneObj.value}, 
		     error:function(data){ 
		         mui.toast('验证码发送成功！', {verticalAlign: 'center'}); 
				for(i=1;i<=t;i++) {  
		                window.setTimeout("update_a(" + i + ","+t+")", i * 1000);  
		           }  
		      } 
		  }); 
		} 
	  }else{ 
		    mui.toast('手机号码不能为空！', {verticalAlign: 'center'}); 
		return false; 
		    } 
		} 
		} 
		function update_a(num,t) {  
		var get_code=document.getElementById('get_code'); 
		if(num == t) {  
		        get_code.innerHTML =" 重新发送 ";  
		        issend=true;  
		    }  
		else {  
		var printnr = t-num;  
		        get_code.innerHTML =printnr +" 秒后重发";  
		    }  
		}  
			(function($, doc) {
				$.init({
					statusBarBackground: '#f7f7f7'
				});
					        
				   var btn = document.getElementById("login");
					//监听点击事件
					
					btn.addEventListener("tap",function () {
						var data=jQuery('#login-form').serialize();
						console.log(data)
						 mui.ajax('/login',{  
						        data:data,  
						        dataType:'json',  
						        type:'post',  
						        timeout:60000,  
						        success:function(data){
						        	
						        },  
						        error:function(xhr,type,errorThrown){  
						            mui.alert("<网络连接失败，请重新尝试一下>", "错误", "OK", null);  
						        }  
						    });  
					});  
				
			}(mui, document));
		</script>
</body>

</html>