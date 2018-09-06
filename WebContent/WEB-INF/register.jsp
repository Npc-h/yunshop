<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon"
	href="img/icon/favicon.ico">
<link rel="stylesheet" type="text/css" href="css/base.css">
<link rel="stylesheet" type="text/css" href="css/home.css">
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/jquery.validate.min.js" type="text/javascript"></script>
<title>登陆商城</title>
<style type="text/css">
.error{
	color:red
}
.label {
    color:red
}
</style>
<script type="text/javascript">
	window.onload = function(){
		
	}
	
	function changeImg(obj){
		obj.src="/lanqiaoshop/outimg.do?time="+new Date().getTime();
	}

	
</script>
<script type="text/javascript">
	
//自定义校验规则
$.validator.addMethod(
	//规则的名称
	"checkUsername",
	//校验的函数
	function(value,element,params){
		
		//定义一个标志
		var flag = false;
		
		//value:输入的内容
		//element:被校验的元素对象
		//params：规则对应的参数值
		//目的：对输入的username进行ajax校验
		$.ajax({
			"async":false,
			"url":"${pageContext.request.contextPath}/checkusername.do",
			"data":{"username":value},
			"type":"POST",
			"dataType":"json",
			"success":function(data){
				flag = data.isExist;
			}
		});

		//返回false代表该校验器不通过
		return !flag;
	}
	
);
	
	$(function(){
		$("#myform").validate({
			rules:{
				"username":{
					"required":true,
					"checkUsername":true
				},
				"password":{
					"required":true,
					"rangelength":[6,12]
				},
				"repassword":{
					"required":true,
					"rangelength":[6,12],
					"equalTo":"#password"
				},
				"email":{
					"required":true,
					"email":true
				},
				"checkCode":{
					"required":true,
				}
			},
			messages:{
				"username":{
					"required":"用户名不能为空",
					"checkUsername":"用户名已存在"
				},
				"password":{
					"required":"密码不能为空",
					"rangelength":"密码长度6-12位"
				},
				"repassword":{
					"required":"密码不能为空",
					"rangelength":"密码长度6-12位",
					"equalTo":"两次密码不一致"
				},
				"email":{
					"required":"邮箱不能为空",
					"email":"邮箱格式不正确"
				},
				"checkCode":{
					"required":"验证码不能为空"
				}
			}
		});
	});

</script>

</head>
<body>
	<header id="pc-header">
		<div class="center">
			<div class="pc-fl-logo">
				<h1>
					<a href="index.html"></a>
				</h1>
			</div>
		</div>
	</header>
	<section>
		<div class="pc-login-bj">
			<div class="center clearfix">
				<div class="fl"></div>
				<div class="fr pc-login-box">
					<div class="pc-login-title">
						<h2>用户注册 USER REGISTER</h2>
					</div>
					<form id="myform" action="/lanqiaoshop/reg.do" method="post">
						<div class="xx" style="height: 60px;">
						<div class="pc-sign">
							<input type="text"  id="username" name="username" placeholder="用户名"/>
						</div>
						</div>
						<div class="xx" style="height: 60px;">
						<div class="pc-sign">
							<input type="email"  id="inputEmail3" name="email" placeholder="邮箱">
						</div>
						</div>
						<div class="xx" style="height: 60px;">
						<div class="pc-sign">
							<input type="password"  id="password" name="password" placeholder="请输入您的密码">
						</div>
						</div>
						<div class="xx" style="height: 60px;">
						<div class="pc-sign">
							<input type="password"  id="confirmpwd" name="repassword" placeholder="请确认您的密码">
						</div>
						</div>
						<div class="xx" style="height: 100px;">
						<div class="pc-signs">
							<input type="text"  name ="checkCode" placeholder="请输入您的验证码" style="height:40px;width:120px;padding-top:0px;margin:0px;float:left"> <img onclick="changeImg(this)" src="/lanqiaoshop/outimg.do" style="height:44px;padding-left:15px;width:210px"/>
							<label for="checkCode" name="checkCode" class="error" style="display: none;"></label><br>
						</div>
						</div>
						<div class="pc-submit-ss">
							<input type="submit" value="立即注册" >
						</div>
						<div class="pc-item-san clearfix">
							<a href="#"><img src="img/icon/weixin.png" alt="">微信登录</a>
							<a href="#"><img src="img/icon/weibo.png" alt="">微博登录</a> <a
								href="#" style="margin-right: 0"><img
								src="img/icon/tengxun.png" alt="">QQ登录</a>
						</div>
						<div class="pc-reg">

							<a href="login.html" class="red">已有账号 请登录</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<footer>
		<div class="center">
			<div class="pc-footer-login">
				<p>关于我们 招聘信息 联系我们 商家入驻 商家后台 商家社区 ©2017 Yungouwu.com 北京云购物网络有限公司</p>
				<p style="color: #999">营业执照注册号：990106000129004 |
					网络文化经营许可证：北网文（2016）0349-219号 | 增值电信业务经营许可证：京2-20110349 | 安全责任书 |
					京公网安备 99010602002329号</p>
			</div>
		</div>
	</footer>
</body>
</html>