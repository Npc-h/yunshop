<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*"%>
<!DOCTYPE html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html lang="en">
<head>
	<base href="<%=basePath%>">

	<meta charset="UTF-8">
	<meta name="Generator" content="EditPlus®">
	<meta name="Author" content="">
	<meta name="Keywords" content="">
	<meta name="Description" content="">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
	<meta name="renderer" content="webkit">
	
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<title>登录.蓝桥购物商城</title>
	<link rel="shortcut icon" type="image/x-icon" href="img/icon/favicon.ico">
	<link rel="stylesheet" type="text/css" href="css/base.css">
	<link rel="stylesheet" type="text/css" href="css/home.css">
	
	
	<style>
        body {
            margin: 50px 0;
            text-align: center;
        }
        .inp {
            border: 1px solid gray;
            padding: 0 10px;
            width: 200px;
            height: 30px;
            font-size: 18px;
        }
        .btn {
            border: 1px solid gray;
            width: 100px;
            height: 30px;
            font-size: 18px;
            cursor: pointer;
        }
        #embed-captcha {
            width: 380px;
            margin: 0 auto;
        }
        .show {
            display: block;
        }
        .hide {
            display: none;
        }
        #notice {
            color: red;
        }
        /* 以下遮罩层为demo.用户可自行设计实现 */
        #mask {
            display: none;
            position: fixed;
            text-align: center;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            overflow: auto;
        }
        /* 可自行设计实现captcha的位置大小 */
        .popup-mobile {
            position: relative;
        }
        #popup-captcha-mobile {
            position: fixed;
            display: none;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            -webkit-transform: translate(-50%, -50%);
            z-index: 9999;
        }
    </style>
   
    
    
</head>
<body>
	<script src="http://code.jquery.com/jquery-1.12.3.min.js"></script>
	 <script src="js/gt.js" type="text/javascript" charset="utf-8"></script>  
		
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
				<div class="pc-login-title"><h2>用户登录</h2></div>
				
				<form action="${pageContext.request.contextPath }/login.do" method="post">
 					<div class="" style="height:60px">
 					<div class="pc-sign">
						<input type="text" placeholder="用户名/邮箱/手机号" name="username" id="username">
						<span id="username_span"></span>
					</div>
					</div>
					<div class="" style="height:60px">
					<div class="pc-sign">
						<input type="password" placeholder="请输入您的密码" name="upassword" id="upassword">
						<span id="upassword_span"></span>
					</div>
					</div>
					<!-- 验证码 -->
					<div class="pc-sign">
						<!--源 <input type="password" placeholder="验证"> -->
						<div id="embed-captcha"></div>
    					<p id="wait" class="show">正在加载验证码......</p>
    					<p id="notice" class="hide">请先拖动验证码到相应位置</p>
					</div>
					<!-- 验证码 -->
					<div id="" style="float: left;">
							<input type="checkbox" id="ck" name="ck" value="true"/>
						</div>
					
					<div  style="float: left;">
						
						<label for="ck"style="padding-left: 5px;list-style: none; margin-top:;">记住我的登录状态</label>
					</div>
					<div class="pc-submit-ss">
						<input type="submit" value="登录"  id="submit">
					</div>
					<div class="pc-item-san clearfix">
						<a href="#"><img src="img/icon/weixin.png" alt="">微信登录</a>
						<a href="#"><img src="img/icon/weibo.png" alt="">微博登录</a>
						<a href="#" style="margin-right:0"><img src="img/icon/tengxun.png" alt="">QQ登录</a>
					</div>
					<div class="pc-reg">
						<a href="#">忘记密码</a>
						<a href="/lanqiaoshop//forward.do?type=reg" class="red">免费注册</a>
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
			<p style="color:#999">营业执照注册号：990106000129004 | 网络文化经营许可证：北网文（2016）0349-219号 | 增值电信业务经营许可证：京2-20110349 | 安全责任书 | 京公网安备 99010602002329号 </p>
		</div>
	</div>
</footer>
<script>
    var handlerEmbed = function (captchaObj) {
    	$("#embed-submit").click(function (e) {
            var validate = captchaObj.getValidate();
            if (!validate) {
                $("#notice")[0].className = "show";
                setTimeout(function () {
                    $("#notice")[0].className = "hide";
                }, 2000);
                e.preventDefault();
            }
        });
        // 将验证码加到id为captcha的元素里，同时会有三个input的值：geetest_challenge, geetest_validate, geetest_seccode
        captchaObj.appendTo("#embed-captcha");
        captchaObj.onReady(function () {
            $("#wait")[0].className = "hide";
        });
    };
    $.ajax({
        // 获取id，challenge，success（是否启用failback）
        url: "pc-geetest/register?t=" + (new Date()).getTime(), // 加随机数防止缓存
        type: "get",
        dataType: "json",
        success: function (data) {
            // 使用initGeetest接口
            // 参数1：配置参数
            // 参数2：回调，回调的第一个参数验证码对象，之后可以使用它做appendTo之类的事件
            initGeetest({
                gt: data.gt,
                challenge: data.challenge,
                product: "embed", // 产品形式，包括：float，embed，popup。注意只对PC版验证码有效
                offline: !data.success // 表示用户后台检测极验服务器是否宕机，一般不需要关注
                // 更多配置参数请参见：http://www.geetest.com/install/sections/idx-client-sdk.html#config
            }, handlerEmbed);
        }
    });
</script>
<script src="js/jquery.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			 $(function(){
			 	$("#username").mouseleave(function(){
				$("#username_span").text("");
				});
	 			$("#username").mouseover(function(){
				$("#username_span").text("输入您的账号");
				$("#username_span").css("color","red");
		});
		
		
		$("#upassword").mouseleave(function(){
				$("#upassword_span").text("");
				});
	 		$("#upassword").mouseover(function(){
			$("#upassword_span").text("输入您的密码");
			$("#username_span").text("");
			$("#upassword_span").css("color","red");
		});
		//---提交 <input type="submit" value="登录"  id="submit">
		 $("#submit").click(function(){
			 
			 
		}); 
	});
			 </script>	 
</body>
</html>