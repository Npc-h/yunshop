<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>云购物商城-巴黎欧莱雅官方旗舰店</title>
<link rel="shortcut icon" type="image/x-icon"
	href="img/icon/favicon.ico">
<link rel="stylesheet" type="text/css" href="css/base.css">
<link rel="stylesheet" type="text/css" href="css/home.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="js/modernizr-custom-v2.7.1.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.js"></script>
<script type="text/javascript">
	var intDiff = parseInt(90000);//倒计时总秒数量

	function timer(intDiff) {
		window.setInterval(function() {
			var day = 0, hour = 0, minute = 0, second = 0;//时间默认值
			if (intDiff > 0) {
				day = Math.floor(intDiff / (60 * 60 * 24));
				hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
				minute = Math.floor(intDiff / 60) - (day * 24 * 60)
						- (hour * 60);
				second = Math.floor(intDiff) - (day * 24 * 60 * 60)
						- (hour * 60 * 60) - (minute * 60);
			}
			if (minute <= 9)
				minute = '0' + minute;
			if (second <= 9)
				second = '0' + second;
			$('#day_show').html(day + "天");
			$('#hour_show').html('<s id="h"></s>' + hour + '时');
			$('#minute_show').html('<s></s>' + minute + '分');
			$('#second_show').html('<s></s>' + second + '秒');
			intDiff--;
		}, 1000);
	}

	$(function() {
		timer(intDiff);
	});//倒计时结束

	$(function() {
		/*======右按钮======*/
		$(".you").click(function() {
			nextscroll();
		});
		function nextscroll() {
			var vcon = $(".v_cont");
			var offset = ($(".v_cont li").width()) * -1;
			vcon.stop().animate({
				marginLeft : offset
			}, "slow", function() {
				var firstItem = $(".v_cont ul li").first();
				vcon.find(".flder").append(firstItem);
				$(this).css("margin-left", "0px");
			});
		}
		;
		/*========左按钮=========*/
		$(".zuo").click(function() {
			var vcon = $(".v_cont");
			var offset = ($(".v_cont li").width() * -1);
			var lastItem = $(".v_cont ul li").last();
			vcon.find(".flder").prepend(lastItem);
			vcon.css("margin-left", offset);
			vcon.animate({
				marginLeft : "0px"
			}, "slow")
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		var $miaobian = $('.Xcontent08>div');
		var $huantu = $('.Xcontent06>img');
		var $miaobian1 = $('.Xcontent26>div');
		$miaobian.mousemove(function() {
			miaobian(this);
		});
		$miaobian1.click(function() {
			miaobian1(this);
		});
		function miaobian(thisMb) {
			for (var i = 0; i < $miaobian.length; i++) {
				$miaobian[i].style.borderColor = '#dedede';
			}
			thisMb.style.borderColor = '#cd2426';

			$huantu[0].src = thisMb.children[0].src;
		}
		function miaobian1(thisMb1) {
			for (var i = 0; i < $miaobian1.length; i++) {
				$miaobian1[i].style.borderColor = '#dedede';
			}
			//		thisMb.style.borderColor = '#cd2426';
			$miaobian.css('border-color', '#dedede');
			thisMb1.style.borderColor = '#cd2426';
			$huantu[0].src = thisMb1.children[0].src;
		}
		$(".Xcontent33").click(function() {
			var value = parseInt($('.input').val()) + 1;
			$('.input').val(value);
		})

		$(".Xcontent32").click(function() {
			var num = $(".input").val()
			if (num > 0) {
				$(".input").val(num - 1);
			}

		})

	})
</script>
<style>
.li-ul-ss l {
	width: 200px;
}
</style>
<script type="text/javascript">
	function addCart() {
		//获得购买的商品的数量
		var buyNum = $("#buyNum").val();
		location.href = "${pageContext.request.contextPath}/product.do?method=addProductToCart&pid=${product.pid}&buyNum="
				+ buyNum;
	}
</script>
</head>
<body>

	<%@ include file="/WEB-INF/header.jsp"%>
	<%@ include file="/WEB-INF/daohanglan.jsp"%>
	<!-- jstl对象的声明 -->
	<c:set var="product" value="${product}" />
	<div class="Xcontent">
		<ul class="Xcontent01">
			<div class="Xcontent06">
				<img src="${product.pimage}">
			</div>
			<ol class="Xcontent08">
				<!-- images/shangpinxiangqing/X1.png -->

				<div class="Xcontent07"><%-- ${product.pname}1.jpg --%>
					<img src="images/shangpinxiangqing/${product.cid}.1.jpg">
				</div>
				<div class="Xcontent09">
					<img src="images/shangpinxiangqing/${product.cid}.2.jpg">
				</div>
				<div class="Xcontent10">
					<img src="images/shangpinxiangqing/${product.cid}.3.jpg">
				</div>
				<div class="Xcontent11">
					<img src="images/shangpinxiangqing/${product.cid}.4.jpg">
				</div>
				<div class="Xcontent12">
					 <img src="images/shangpinxiangqing/${product.cid}.5.jpg"> 
				</div>
			</ol>

			<ol class="Xcontent13 clearfix">
				<div class="Xcontent14 clearfix">
					<a href="#"><p>${product.pdesc}</p></a>
				</div>
				<div class="Xcontent15 clearfix red fl" style="margin-top: 2px">新品上架</div>
				<div class="Xcontent16 clearfix">
					<p style="margin: 0">大牌放肆购，你值得拥有！更多惊喜</p>
				</div>
				<div class="Xcontent17">
					<p class="Xcontent18">售价</p>
					<p class="Xcontent19">
						￥<span>${product.pshop_price}</span>
					</p>
					<div class="Xcontent20">
						<p class="Xcontent21">促销</p>
						<img src="images/add_cart.png">
						<p class="Xcontent22">领610元新年礼券，满再赠好礼</p>
					</div>
					<div class="Xcontent23">
						<p class="Xcontent24">服务</p>
						<p class="Xcontent25">30天无忧退货&nbsp;&nbsp;&nbsp;&nbsp; 48小时快速退款
							&nbsp;&nbsp;&nbsp;&nbsp; 满88元免邮</p>
					</div>

				</div>
				<div class="Xcontent26">
					<p class="Xcontent27">颜色</p>
					<div class="Xcontent28">
						<img src="${product.pimage}">
					</div>
					<div class="Xcontent29">
						<img src="${product.pimage}">
					</div>
				</div>
				<div class="Xcontent30"style="margin-left: 40px; float: left; higet: auto;">
					<p class="Xcontent31">购买数量:</p>
					<input id="buyNum" name="buyNum" value="1" maxlength="4" size="10"
						type="text" style="margin-top: 40px; margin-left: 10px;">
					<div class="Xcontent32">
						<img src="${product.pimage}">
					</div>
					<form>
						<input class="input" value="1">
					</form>
					<div class="Xcontent33">
						<img src="${product.pimage}">
					</div>

				</div>
				<div class="Xcontent35">
					<a href="javascript:void(0);" onclick="addCart()">加入购物车</a>
				</div>
				<div class="Xcontent35">
					<!-- <a
					href="">加入收藏夹
					</a> -->
						<form class="clearfix" action="${pageContext.request.contextPath }/love.do?pid=${product.pid}" method="post">
						<div class=""style="height: 38px;width: 170px; background-color:#e94949;"> 
							<input  style="font-size: 14px;color: white;background-color:#e94949;border:none;text-align: center; margin-top:10px;margin-left:18px; cursor: pointer;" type="submit"  value="加入收藏夹继续浏览" onfocus="blur()"/>
						</div>
						</form>
				</div>
			</ol>
		</ul>
	</div>

	<div class="containers center clearfix"
		style="margin-top: 20px; background: #fff;">


		<div class="pc-overall">
			<ul id="H-table1" class="brand-tab H-table1 H-table-shop clearfix "
				style="padding: 0PX; margin: 0PX;">
				<li class="cur"><a href="javascript:void(0);">商品介绍</a></li>

			</ul>
			<div class="pc-term clearfix">
				<div class="H-over1 pc-text-word clearfix">
					<ul class="clearfix">
						<li>
							<p>屏幕尺寸：4.8英寸</p>
							<p>分辨率：1280×720(HD,720P)</p>
						</li>
						<li>
							<p>后置摄像头：800万像素</p>
							<p>分辨率：1280×720(HD,720P)</p>
						</li>
						<li>
							<p>前置摄像头：190万像素</p>
							<p>分辨率：1280×720(HD,720P)</p>
						</li>
						<li>
							<p>3G：电信(CDMA2000)</p>
							<p>2G：移动/联通(GSM)/电信(CDMA</p>
						</li>
					</ul>
					<div class="pc-line"></div>
					<ul class="clearfix">
						<li>
							<p>商品名称：三星I939I</p>
							<p>商品毛重：360.00g</p>
						</li>
						<li>
							<p>商品编号：1089266</p>
							<p>商品产地：中国大陆</p>
						</li>
						<li>
							<p>品牌： 三星（SAMSUNG）</p>
							<p>系统：安卓（Android</p>
						</li>
						<li>
							<p>上架时间：2015-03-30 09:07:18</p>
							<p>机身颜色：白色</p>
						</li>
					</ul>
					<div>
						<div style="text-align: center">
							<img src="images/shangpinxiangqing/${product.cid}.1.jpg" width="50%">
						</div>
						<div style="text-align: center">
							<img src="images/shangpinxiangqing/${product.cid}.2.jpg" width="50%">
						</div>
						<div style="text-align: center">
							<img src="images/shangpinxiangqing/${product.cid}.3.jpg" width="50%">
						</div>
						<div style="text-align: center">
							<img src="images/shangpinxiangqing/${product.cid}.4.jpg" width="50%">
						</div>
					</div>
				</div>
				<div class="H-over1" style="display: none">
					<div class="pc-comment fl">
						<strong>86<span>%</span></strong><br> <span>好评度</span>
					</div>
					<div class="pc-percent fl">
						<dl>
							<dt>
								好评<span>(86%)</span>
							</dt>
							<dd>
								<div style="width: 86px"></div>
							</dd>
						</dl>
						<dl>
							<dt>
								中评<span>(86%)</span>
							</dt>
							<dd>
								<div style="width: 86px"></div>
							</dd>
						</dl>
						<dl>
							<dt>
								好评<span>(86%)</span>
							</dt>
							<dd>
								<div style="width: 86px"></div>
							</dd>
						</dl>
					</div>
				</div>
				<div class="H-over1 pc-text-title" style="display: none">
					<p>本产品全国联保，享受三包服务，质保期为：一年质保
						如因质量问题或故障，凭厂商维修中心或特约维修点的质量检测证明，享受7日内退货，15日内换货，15日以上在质保期内享受免费保修等三包服务！
						(注:如厂家在商品介绍中有售后保障的说明,则此商品按照厂家说明执行售后保障服务。)
						您可以查询本品牌在各地售后服务中心的联系方式，请点击这儿查询......</p>
					<div class="pc-line"></div>
				</div>
			</div>
		</div>

	</div>



	<div style="height: 100px"></div>

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