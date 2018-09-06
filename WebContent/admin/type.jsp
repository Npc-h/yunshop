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
<style>
</style>
<body>
	<div class="dvcontent">

		<div>
			<!--tab start-->
			<div class="tabs">
				<div class="hd">
					<ul style="">
						<li style="box-sizing: initial; -webkit-box-sizing: initial;"
							class="on">查看分类</li>
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
											<td align="center" width="25%">分类名称</td>

										</tr>
									</thead>
									
								<c:forEach items="${allcategory }" var="category" varStatus="vs">	
									<tbody>
										<tr>
											<td>${vs.count }</td>
											<td>${category.cname }</td>
										</tr>
									</tbody>
									</c:forEach>

								</table>
							</div> <!--分页显示角色信息 end-->
						</li>
					</ul>
					<ul class="theme-popbod dform" style="display: none;">
						<div class="am-cf admin-main" style="padding-top: 0px;">
							<!-- content start -->

							<div class="am-cf admin-main" style="padding-top: 0px;">
								<!-- content start -->
								<div class="admin-content">
									<div class="admin-content-body">

										<div class="am-g">
											<div class="am-u-sm-12 am-u-md-4 am-u-md-push-8"></div>

										</div>

									</div>
									<!-- content end -->
								</div>
								<!-- end-->
					</ul>
				</div>
			</div>
			<!--tab end-->

		</div>


		<script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
		<script src="js/plugs/Jqueryplugs.js" type="text/javascript"></script>
		<script src="js/_layout.js"></script>
		<script src="js/plugs/jquery.SuperSlide.source.js"></script>
		<script>
			var num = 1;
			$(function() {

				$(".tabs").slide({
					trigger : "click"
				});

			});

			var btn_save = function() {
				var pid = $("#RawMaterialsTypePageId  option:selected").val();
				var name = $("#RawMaterialsTypeName").val();
				var desc = $("#RawMaterialsTypeDescription").val();
				var ramark = $("#Ramark").val();
				$.ajax({
					type : "post",
					url : "/RawMaterialsType/AddRawMaterialsType",
					data : {
						name : name,
						pid : pid,
						desc : desc,
						ramark : ramark
					},
					success : function(data) {
						if (data > 0) {
							$.jq_Alert({
								message : "添加成功",
								btnOktext : "确认",
								dialogModal : true,
								btnOkClick : function() {
									//$("#RawMaterialsTypeName").val("");
									//$("#RawMaterialsTypeDescription").val("");
									//$("#Ramark").val("");                           
									//page1();
									location.reload();

								}
							});
						}
					}
				});
				alert(t);
			}
		</script>

	</div>
</body>

</html>