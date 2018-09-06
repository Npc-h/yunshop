<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<title>我的购物车-云购物商城</title>
	<link rel="shortcut icon" type="image/x-icon" href="img/icon/favicon.ico">
	<link rel="stylesheet" type="text/css" href="css/base.css">
	<link rel="stylesheet" type="text/css" href="css/home.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
	<script type="text/javascript" src="js/modernizr-custom-v2.7.1.min.js"></script>
	<script type="text/javascript">
			function delProFromCart(pid){
				if(confirm("您是否要删除该项？")){
					location.href="${pageContext.request.contextPath }/product.do?method=delProFromCart&pid="+pid;
				}
			}
			
			function clearCart(){
				if(confirm("您是否要清空购物车？")){
					location.href="${pageContext.request.contextPath }/product.do?method=clearCart";
				}
			}
		
		</script>
		
		<script type="text/javascript">
			$(function(){
				$("#select").click(function(){
					$(".selectOne").prop("checked",this.checked);
				});
			});
		</script>
</head>
<body>
<%@ include file="/WEB-INF/header.jsp" %>
<%@ include file="/WEB-INF/daohanglan.jsp" %>
<!--判断是否为空-->
<c:if test="${!empty cart.cartItems }">
<section id="pc-jie">
	<div class="pc-shopping-cart center">
		<div class="pc-shopping-tab">
			<table>
				<thead>
					<tr class="tab-0">
						<th class="tab-1">
						<th class="tab-2">商品描述</th>
						<th class="tab-3">商品名</th>
						<th class="tab-4">单价</th>
						<th class="tab-5">数量</th>
						<th class="tab-6">小计</th>
						<th class="tab-7">操作</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="7" style="padding-left:10px; background:#eee">
							<input type="checkbox" checked >
							<label for="">云购物自营</label>
							<a href="#" style="position:relative;padding-left:50px"><i class="icon-kefu"></i>联系客服</a>
							<ul class="clearfix fr" style="padding-right:20px">
								<li><i class="pc-shop-car-yun"></i>每天新鲜产品</li>
								<li><i class="pc-shop-car-yun"></i>领取3种优惠券, 最高省30元</li>
							</ul>
						</td>
					</tr>
					
					<c:forEach items="${cart.cartItems }" var="entry">
					<tr>
						<th><input type="checkbox"  style="margin-left:10px; float:left" class="selectOne"></th>
						<th class="tab-th-1">
							<a href="#"><img src="${entry.value.product.pimage}" width="100%" alt=""></a>
							<a href="#" class="tab-title">${entry.value.product.pdesc} </a>
						</th>
						<th>
							<p>${entry.value.product.pname}</p>
						</th>
						<th>
							<p>${entry.value.product.pmarket_price}</p>
							<p class="red">${entry.value.product.pshop_price}</p>
						</th>
						<th class="tab-th-2">
							<input type="text" value="${entry.value.buyNum }" maxlength="3" placeholder="" class="shul">
						</th>
						<th class="red">${entry.value.subtotal }</th>
						<th><a href="javascript:;" onclick="delProFromCart('${entry.value.product.pid}')">删除</a></th>
					</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>
	<div style="height:10px"></div>
	<div class="center">
		<div class="clearfix pc-shop-go">
			<div class="fl pc-shop-fl">
				<input type="checkbox" placeholder="" id="select">
				<label for="">全选</label>
				<a href="javascript:;" onclick="clearCart()" id="clear" class="clear">清空购物车</a>
			</div>
			<div class="fr pc-shop-fr">
				<p>总计（不含运费）保留一位小数</p>
				<span>¥ ${cart.total }</span>
				<a href="${pageContext.request.contextPath }/product.do?method=submitOrder">提交订单</a>
			</div>
		</div>
	</div>
</section>
</c:if>
<!-- 如果为空则显示空图片 -->
<c:if test="${empty cart.cartItems }">
			<div >
				<img alt="" src="${pageContext.request.contextPath }/images/cart-empty.png">
				<div class="" style="margin-top:260px;margin-right:700px;float:right;height:auto;width:200px;">
				<h2><a href="${pageContext.request.contextPath }">返回首页</a></h2>
			</div>
			</div>
</c:if>

<div style="height:100px"></div>

<%@ include file="/WEB-INF/footer.jsp" %>
<script type="text/javascript">
    //hover 触发两个事件，鼠标移上去和移走
    //mousehover 只触发移上去事件
    $(".top-nav ul li").hover(function(){
        $(this).addClass("hover").siblings().removeClass("hover");
        $(this).find("li .nav a").addClass("hover");
        $(this).find(".con").show();
    },function(){
        //$(this).css("background-color","#f5f5f5");
        $(this).find(".con").hide();
        //$(this).find(".nav a").removeClass("hover");
        $(this).removeClass("hover");
        $(this).find(".nav a").removeClass("hover");
    })
</script>
</body>
</html>