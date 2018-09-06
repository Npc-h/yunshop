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

<!-- 弹出层插件 -->
<link href="css/popup_layer.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/popup_layer.js"></script>
<!-- 调用插件弹出层的方法 -->
<script type="text/javascript">
	$(function() {
		//弹出层插件调用
		new PopupLayer({
			trigger : ".clickedElement",//触发点 点击谁弹出div
			popupBlk : "#showDiv",//弹出哪个div
			closeBtn : "#closeBtn",//关闭按钮
			useOverlay : true
		});

	});

	//点击按钮查询某个订单的详情
	function findOrderInfoByOid(oid) {
		//清理上一次显示的内容覆盖
		$("#showDivTab").html("");
		$("#shodDivOid").html("");
		$("#loading").css("display", "block");

		//ajax异步访问数据
		$.post(
						"${pageContext.request.contextPath }/admin.do?method=findOrderInfoByOid",
						{
							"oid" : oid
						},
						function(data) {

							//隐藏加载图片
							$("#loading").css("display", "none");
							var content = "<tr id='showTableTitle'><th width='20%'>图片</th><th width='25%'>商品</th><th width='20%'>价格</th><th width='15%'>数量</th><th width='20%'>小计</th></tr>";
							for (var i = 0; i < data.length; i++) {
								content += "<tr style='text-align: center;'>"
										+ "<td>"
										+ "<img src='${pageContext.request.contextPath }/"+data[i].pimage+"' width='70' height='60'>"
										+ "</td>" + "<td><a target='_blank'>"
										+ data[i].pname + "</a></td>" + "<td>￥"
										+ data[i].pshop_price + "</td>" + "<td>"
										+ data[i].icount + "</td>"
										+ "<td><span class='subtotal'>￥"
										+ data[i].isubtotal + "</span></td>"
										+ "</tr>";
							}

							$("#showDivTab").html(content);

							//订单编号
							$("#shodDivOid").html(oid);

						}, "json");
	}
</script>
</head>

<body>
	<div class="dvcontent">

		<div>
			<!--tab start-->
			<div class="tabs">
				<div class="hd">
					<ul>
						<li class="on"
							style="box-sizing: initial; -webkit-box-sizing: initial;">订单列表</li>

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

											<td align="center" width="10%"><a href="">序号</a></td>
											<td align="center" width="10%">订单编号</td>

											<td align="center" width="10%">订单金额</td>
											<td align="center" width="10%">订单状态</td>
											<td align="center" width="10%">收货人姓名</td>
											<td align="center" width="10%">订单详情</td>

										</tr>
									</thead>
									<c:forEach items="${orderList }" var="order" varStatus="vs">
										<tbody>
											<tr onmouseover="this.style.backgroundColor = 'white'"
												onmouseout="this.style.backgroundColor = '#F5FAFE';">
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="10%">${vs.count }</td>
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="10%">${order.oid }</td>

												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="10%">${order.ototal }</td>
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="10%">${order.ostate==0?"未付款":"已付款" }</td>
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="10%">${order.oname }</td>
												<td align="center" style="HEIGHT: 22px">
													<div id="" align="center">
														<input type="button" value="订单详情" class="clickedElement"
															onclick="findOrderInfoByOid('${order.oid }')" />
													</div>
												</td>

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

								<!-- content end -->
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

								var btn_edit = function(id) {
									$
											.jq_Panel({
												url : "/RawMaterialsType/EditRawMaterialsType?id="
														+ id,
												title : "编辑分类",
												dialogModal : true,
												iframeWidth : 500,
												iframeHeight : 400
											});
								}
								var btn_delete = function(id) {
									$.jq_Confirm({
										message : "您确定要删除吗?",
										btnOkClick : function() {

										}
									});
								}
							</script>

						</div>
						<!-- 弹出层 HaoHao added -->
						<div id="showDiv" class="blk" style="display: none;">
							<div class="main">
								<h2>
									订单编号：<span id="shodDivOid" style="font-size: 13px; color: #999">1</span>
								</h2>
								<a href="javascript:void(0);" id="closeBtn" class="closeBtn">关闭</a>
								<div id="loading" style="padding-top: 30px; text-align: center;">
									<img alt="" style="width: 100px; height: 100px;"
										src="/lanqiaoshop/admin/img/loading.gif">
								</div>
								<div style="padding: 20px;">
									<table id="showDivTab" style="width: 100%">

									</table>
								</div>
							</div>

						</div>
</body>

</html>