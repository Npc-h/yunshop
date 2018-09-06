<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
<meta name="renderer" content="webkit">
<title>确认订单-云购物商城</title>
<link rel="shortcut icon" type="image/x-icon"
	href="img/icon/favicon.ico">
<link rel="stylesheet" type="text/css" href="css/base.css">
<link rel="stylesheet" type="text/css" href="css/home.css">
<link rel="stylesheet" type="text/css" href="css/car/base.css">
<link rel="stylesheet" type="text/css" href="css/car/home.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function confirmOrder() {
		//提交表单
		$("#orderForm").submit();

	}
</script>
</head>

<body>
	<%@ include file="/WEB-INF/header.jsp"%>
	<%@ include file="/WEB-INF/daohanglan.jsp"%>


	<div class="container" style="margin-left: 160px; width: 1220px;">
		<div class="checkout-box" style="padding-left: 30px;">
			<form id="orderForm"
				action="${pageContext.request.contextPath }/product.do"
				method="post">
				<!-- method的名字 通过表单提交 -->
				<input type="hidden" name="method" value="confirmOrder">
				<!-- 传递订单oid -->
				<input type="hidden" name="oid" value="${order.oid}">

				<div class="checkout-box-bd">
					<!-- 地址状态 0：默认选择；1：新增地址；2：修改地址 -->


					<div id="checkoutPayment">
						<!-- 收货地址 -->
						<div class="xm-box">
							<div class="box-hd ">
								<h2 class="title">请填写你的收货地址</h2>
							</div>
							<div class="pc-sign">
								<input type="text" placeholder="xx省xx市xx县xx街道" name="address">
							</div>
						</div>
						<!-- 收货地址 END-->
						<!-- 收货人姓名 -->
						<div class="xm-box">
							<div class="box-hd ">
								<h2 class="title">请填写收货人姓名</h2>
							</div>
							<div class="pc-sign">
								<input type="text" name="name" placeholder="${user.username}">
							</div>
						</div>
						<!-- 收货地址 END-->
						<!-- 电话号码 -->
						<div class="xm-box">
							<div class="box-hd ">
								<h2 class="title">请填写你的联系电话号码</h2>
							</div>
							<div class="pc-sign">
								<input type="text" name="telephone" placeholder="${user.utelephone}">
							</div>
						</div>
						<!-- 收货地址 END-->

						<!-- 支付方式 -->
						<div class="xm-box">
							<div class="box-hd ">
								<h2 class="title">支付方式</h2>
							</div>
							<div class="box-bd">
								<ul id="checkoutPaymentList"
									class="checkout-option-list clearfix J_optionList">
									<li class="item selected"><input type="radio"
										name="Checkout[pay_id]" checked="checked" value="1">
										<p>
											支付宝支付 <span></span>
										</p></li>
								</ul>
							</div>
						</div>


					</div>
					<div class="checkout-box-ft">
						<!-- 商品清单 -->
						<div id="checkoutGoodsList" class="checkout-goods-box">
							<div class="xm-box">
								<div class="box-hd">
									<h2 class="title">确认订单信息</h2>
								</div>
								<div class="box-bd" style="width: 1150px;">
									<dl class="checkout-goods-list">
										<dt class="clearfix">
											<span class="col col-1">商品名称</span> <span class="col col-2">购买价格</span>
											<span class="col col-3">购买数量</span> <span class="col col-4">小计（元）</span>
										</dt>
											<c:forEach items="${cart.cartItems }" var="entry">
										<dd class="item clearfix">
											<div class="item-row">
												<div class="col col-1">
													<div class="g-pic">
														<img src="${entry.value.product.pimage}" width="40"
															height="40" />
													</div>
													<div class="g-info">
														<a href="#" target="_blank">
															${entry.value.product.pdesc} </a>
													</div>
												</div>

												<div class="col col-2">${entry.value.product.pshop_price}元</div>
												<div class="col col-3">${entry.value.buyNum }</div>
												<div class="col col-4">${entry.value.subtotal }</div>
											</div>
										</dd>
										</c:forEach>
									</dl>
									<div class="checkout-confirm">
										<p>一共:￥${cart.total }元</p>
										<a href="javascript:;" onclick="confirmOrder()"
											class="btn btn-primary">立即支付</a>

									</div>
								</div>
							</div>
			</form>

		</div>

	</div>
	<!--收货地址body部分结束-->





	<%@ include file="/WEB-INF/footer.jsp"%>

	<script type="text/javascript">
		//hover 触发两个事件，鼠标移上去和移走
		//mousehover 只触发移上去事件
		$(".top-nav ul li").hover(function() {
			$(this).addClass("hover").siblings().removeClass("hover");
			$(this).find("li .nav a").addClass("hover");
			$(this).find(".con").show();
		}, function() {
			//$(this).css("background-color","#f5f5f5");
			$(this).find(".con").hide();
			//$(this).find(".nav a").removeClass("hover");
			$(this).removeClass("hover");
			$(this).find(".nav a").removeClass("hover");
		})
	</script>
</body>
</html>