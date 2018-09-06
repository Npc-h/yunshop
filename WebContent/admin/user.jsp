<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" />
<link rel="stylesheet" href="css/Site.css" />
<link rel="stylesheet" href="css/zy.all.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="css/amazeui.min.css" />
<link rel="stylesheet" href="css/admin.css" />
</head>
<body>
	<div class="dvcontent">

		<div>
			<!--tab start-->
			<div class="tabs">
				<div class="hd">
					<ul>
						<li class="on"
							style="box-sizing: initial; -webkit-box-sizing: initial;">查看用户</li>

					</ul>
				</div>
				<div class="bd">
					<ul style="display: block; padding: 20px;">
						<li>
							<!--分页显示角色信息 start-->
							<div id="dv1">
								<table class="table" id="tbRecord">
									<thead>
										<tr
											style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
											<td align="center" width="10%">序号</td>
											<td align="center" width="15%">用户名</td>
											<td align="center" width="15%">姓名</td>
											<td align="center" width="10%">性别</td>
											<td width="7%" align="center"></td>
										</tr>
									</thead>
										<c:forEach items="${selectuser }" var="users" varStatus="vs">
									<tbody>
										<tr>
											<td>${vs.count }</td>
											<td>${users.username }</td>
											<td>${users.uname }</td>
											<td>${users.usex }</td>
											<td class="delete"><div align="center">
												</div></td>
										</tr>
									</tbody>
									</c:forEach>
								</table>
							</div> <!--分页显示角色信息 end-->
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>


</body>

</html>