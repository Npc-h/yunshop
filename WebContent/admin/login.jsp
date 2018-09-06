<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>管理员登陆</title>
<style type="text/css">
.submitstyle {
	width: 83px;
	height: 30px;
	border: #FFFFFF;
	font-size: 20px;
	color: #0092DC;
	background: #FFFFFF;
}
</style>
<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.easyui.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/easyui-lang-zh_CN.js" type="text/javascript"
	charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="css/easyui.css" />
<link rel="stylesheet" type="text/css" href="css/icon.css" />

</head>
<body background="img/bac (2).jpg">
	<div style="height: 100px;">
		<img src="img/loign1.png" />
	</div>


	<div id="dialog" style="padding-top: 150px;">

		<form action="/lanqiaoshop/admin.do?method=checkManage" method="post">
			<table align="center" style="height: 80px;">

				<div>
					<p align="center">
						<font face="华文彩云" size="7" color="#FFFFFF">商城后台管理系统</font>
					</p>

				</div>
				<div>
					<tr>
						<td align="right">账号：</td>
						<td><input type="text" name="managename" placeholder="请输入账号"
							style="height: 22px;" /></td>
					</tr>
					<tr>
						<td align="right">密码：</td>
						<td><input type="password" name="managepassword" placeholder="请输入密码"
							style="height: 22px;"></td>
					</tr>
					<tr>

					</tr>

					<tr>
						<td></td>
						<td><input type="submit" name="denglu" id="button" value="登录"
							class="submitstyle" /> <input type="submit" name="lyp"
							id="button3" value="注册" class="submitstyle" /></td>
					</tr>



				</div>

			</table>

		</form>


	</div>





</body>
</html>
