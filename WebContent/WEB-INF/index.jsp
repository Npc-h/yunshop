<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="Generator" content="EditPlus®">
	<meta name="Author" content="">
	<meta name="Keywords" content="">
	<meta name="Description" content="">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
	<meta name="renderer" content="webkit">
	<title>云购物商城-换一种方式购物</title>
	<link rel="shortcut icon" type="image/x-icon" href="img/icon/favicon.ico">
	<link rel="stylesheet" type="text/css" href="css/base.css">
	<link rel="stylesheet" type="text/css" href="css/home.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
	<script type="text/javascript">

        var intDiff = parseInt(90000);//倒计时总秒数量

        function timer(intDiff){
            window.setInterval(function(){
                var day=0,
                    hour=0,
                    minute=0,
                    second=0;//时间默认值
                if(intDiff > 0){
                    day = Math.floor(intDiff / (60 * 60 * 24));
                    hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
                    minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
                    second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
                }
                if (minute <= 9) minute = '0' + minute;
                if (second <= 9) second = '0' + second;
                $('#day_show').html(day+"天");
                $('#hour_show').html('<s id="h"></s>'+hour+'时');
                $('#minute_show').html('<s></s>'+minute+'分');
                $('#second_show').html('<s></s>'+second+'秒');
                intDiff--;
            }, 1000);
        }

        $(function(){
            timer(intDiff);
        });//倒计时结束

        $(function(){
	        /*======右按钮======*/
            $(".you").click(function(){
                nextscroll();
            });
            function nextscroll(){
                var vcon = $(".v_cont");
                var offset = ($(".v_cont li").width())*-1;
                vcon.stop().animate({marginLeft:offset},"slow",function(){
                    var firstItem = $(".v_cont ul li").first();
                    vcon.find(".flder").append(firstItem);
                    $(this).css("margin-left","0px");
                });
            };
	        /*========左按钮=========*/
            $(".zuo").click(function(){
                var vcon = $(".v_cont");
                var offset = ($(".v_cont li").width()*-1);
                var lastItem = $(".v_cont ul li").last();
                vcon.find(".flder").prepend(lastItem);
                vcon.css("margin-left",offset);
                vcon.animate({marginLeft:"0px"},"slow")
            });
        });
		
	</script>
		<script type="text/javascript">
			$(function(){
				init();
			})
			//定时器
			function init() {
				//setTimeout只执行一次，setInterval从载入开始每隔指定时间执行
				setInterval("sliderimg()", 2000);
			}
			//定义全局变量
			var i = 1;
			function sliderimg(imgIndex) {
				i++;
				if (imgIndex != null) {  //必须判断是否点击，在进行同步
					i = imgIndex;
				}
				if (i == 5) { //使得可以循环轮播
					i = 1;
				}
				$("#img1").attr("src","img/" + i + ".jpg");
			}
		</script>
	<script type="text/javascript">
			$(function(){
				setTimeout("showAd()",2000);
			})
			function showAd(){
			//样式一
			//$("#img2").show(1000);
			//样式二
			$("#imgkxgg").slideDown(5000);
			 setTimeout("hiddenAd()",2000);
			}
			function hiddenAd(){
				//样式一
				$("#imgkxgg").hide(2000);
				//样式二
				//$("#img2").slideUp(5000);
			}
		</script>
</head>
<body>

 <header id="pc-header">
 <c:if test="${sessionScope.user==null}">
 <img src="images/kxgg.jpg" width="100%" style="display: none" id="imgkxgg" />
 </c:if>
 <%@ include file="/WEB-INF/header.jsp" %>

	<!--  顶部    start-->
	<div class="yHeader">
		<!-- 导航   start  -->
		<div class="yNavIndex">
		
			<div class="pullDown">
			
				<h2 class="pullDownTitle"><i class="icon-class"></i>所有商品分类</h2><!-- 商品分类 -->
				<ul class="pullDownList" id="ul_one">
				
				</ul>
			</div>
			
			
			<ul class="yMenuIndex">
				<li><a href="/lanqiaoshop/index.jsp" >首页</a></li>
				<li><a href="/lanqiaoshop/pager.do?cid=1" >电脑办公 </a></li>
				<li><a href="/lanqiaoshop/pager.do?cid=2" >数码相机</a></li>
				<li><a href="/lanqiaoshop/pager.do?cid=3" >手机通讯</a></li>
				<li><a href="/lanqiaoshop/pager.do?cid=4" >服装装饰</a></li>
				<li><a href="/lanqiaoshop/pager.do?cid=5" >化妆保养</a></li>
				<li><a href="/lanqiaoshop/pager.do?cid=6" >蔬菜水果</a></li>
			</ul>
		</div>
		<!-- 导航   end  -->
	</div>
	<!--  顶部    end-->

	<!-- banner  -->
	<div class="yBanner">
		<div class="yBannerList">
			<div class="yBannerListIn">
				<a href=""><img class="ymainBanner" src="img/4.jpg"  width="840px" height="510px" id="img1"></a>
				<div class="yBannerListInRight">
					<a href=""><img src="images/BR2.png" width="100%"/></a>
					<a href=""><img src="images/BR3.png" width="100%" /></a>
				</div>
			</div>
		</div>

		<div class="yBannerList ybannerHide">
			<div class="yBannerListIn">
				<a href=""><img class="ymainBanner" src="images/banner1.jpg" width="100%"></a>
				<div class="yBannerListInRight">
					<a href=""><img src="images/BR6.png" width="100%"/></a>
					<a href=""><img src="images/BR4.png" width="100%" /></a>
				</div>
			</div>
		</div>

		<div class="yBannerList ybannerHide">
			<div class="yBannerListIn">
				<a href=""><img class="ymainBanner" src="images/banner1.jpg" width="100%"></a>
				<div class="yBannerListInRight">
					<a href=""><img src="images/BR7.png" width="100%"/></a>
					<a href=""><img src="images/BR5.png" width="100%" /></a>
				</div>
			</div>
		</div>
	</div>
	<!-- banner end -->
</header>
<section id="">
	<div class="center pc-ad-img clearfix">
		<div class="pc-center-img"><img src="img/ad/ad1.jpg"></div>
		<div class="pc-center-img"><img src="img/ad/ad2.jpg"></div>
		<div class="pc-center-img"><img src="img/ad/ad3.jpg"></div>
		<div class="pc-center-img"><img src="img/ad/ad4.jpg"></div>
		<div class="pc-center-img"><img src="img/ad/ad5.jpg"></div>
	</div>
</section>
<section id="s">
	<div class="center">
		<div class="pc-center-he">
		
			<div class="pc-box-he clearfix">
				<div class="fl"><i class="pc-time-icon"></i></div>
					<div class="time-item fr">
					<span id="day_show">0天</span>
					<strong id="hour_show">0时</strong>
					<strong id="minute_show">00分</strong>
					<strong id="second_show">00秒</strong>
					<em style="color:#fff">后结束抢购</em>
					</div>
				</div>
			
			<div class="pc-list-goods">
				<div class="flashSale_wrap">
					<div class="flashSale area">
						<div class="tab-content">
							<div class="tab-pane active">
								<div class="flashSaleDeals">
									<div class="v_cont" style="width:9648px;overflow: hidden">
										<ul class="flder">
											<li index="0" id="box_li1">
											</li>
											
											</ul>
										 <a href="javascript:;" class="zuo trigger"></a>
										<a href="javascript:;" class="you trigger"></a> 
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		
			<!--  -->
			<div class="center pc-top-20">
		<div class="pc-center-he">
			<div class="pc-box-he pc-box-qr clearfix" >
				<div class="fl"><i class="pc-time-icon"></i></div>
				<div class="fr pc-box-blue-link">
					<a href="/lanqiaoshop/pager.do?cid=1" >电脑办公 </a>
					<a href="/lanqiaoshop/pager.do?cid=2" >数码相机</a>
					<a href="/lanqiaoshop/pager.do?cid=3" >手机通讯</a>
					<a href="/lanqiaoshop/pager.do?cid=4" >服装装饰</a>
					<a href="/lanqiaoshop/pager.do?cid=5" >化妆保养</a>
				</div>
			</div>
			<!--  -->
			<div class="pc-list-goods">
				<div class="flashSale_wrap">
					<div class="flashSale area">
						<div class="tab-content">
							<div class="tab-pane active">
								<div class="flashSaleDeals">
									<div class="v_cont" style="width:9648px;overflow: hidden">
										<ul class="flder">
											<li index="0" id="box_li2">
											</li>
										</ul>
										<!-- <a href="javascript:;" class="zuo trigger"></a>
										<a href="javascript:;" class="you trigger"></a> -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--  -->
		</div>
	</div>
</div>
</div>
	<!-- 	
	<div class="center pc-top-20">
		<div class="pc-center-he">
			<div class="pc-box-he pc-box-qr clearfix" >
				<div class="fl"><i class="pc-time-icon"></i></div>
				<div class="fr pc-box-blue-link">
					<a href="/lanqiaoshop/pager.do?cid=4">数码</a>
					<a href="/lanqiaoshop/pager.do?cid=4">手机</a>
					<a href="/lanqiaoshop/pager.do?cid=4">移动电话</a>
					<a href="/lanqiaoshop/pager.do?cid=4">老人机</a>
					<a href="/lanqiaoshop/pager.do?cid=4">智能机</a>
				</div>
			</div>
			<div class="pc-list-goods">
				<div class="xsq_deal_wrapper pc-deal-list clearfix" id="newBox">
				</div>
			</div>
		</div>
	</div> -->
	<!-- 静态 -->
	<div class="center pc-top-20">
		<div class="pc-center-he">
			<div class="pc-box-he pc-box-ue clearfix">
				<div class="fl"><i class="pc-time-icon"></i></div>
				<div class="fr pc-box-blue-link">
					<a href="#">上衣</a>
					<a href="#">短裙</a>
					<a href="#">牛仔裤</a>
					<a href="#">短袖</a>
					<a href="#">帽子</a>
				</div>
			</div>
			<div class="pc-list-goods" style="height:auto">
				<div class="xsq_deal_wrapper pc-deal-list clearfix">
					<a class="saleDeal" href="" target="_blank">
						<div class="dealCon"><img class="dealImg" src="images/xlqg19.jpg" alt=""></div>
						<div class="title_new"><p class="word" title="【京东超市】福临门 葵花籽原香食用调和油5L 中粮出品"><span class="baoyouText">[包邮]</span>【京东超市】福临门 葵花籽原香食用调和油5L 中粮出品</p></div>
						<div class="dealInfo"><span class="price">¥<em>39.9</em></span></div>
					</a>
					<a class="saleDeal" href="" target="_blank">
						<div class="dealCon"><img class="dealImg" src="images/xlqg14.jpg" alt=""></div>
						<div class="title_new"><p class="word" title="神火（supfire）C8T6 强光手电筒 远射LED充电式防身灯 配18650电池"><span class="baoyouText">[包邮]</span>神火（supfire）C8T6 强光手电筒 远射LED充电式防身灯 配18650电池</p></div>
						<div class="dealInfo"><span class="price">¥<em>99.0</em></span></div>
					</a>
					<a class="saleDeal" href="" target="_blank">
						<div class="dealCon"><img class="dealImg" src="images/xlqg15.jpg" alt=""></div>
						<div class="title_new"><p class="word" title="【京东超市】福临门 葵花籽原香食用调和油5L 中粮出品"><span class="baoyouText">[包邮]</span>【京东超市】福临门 葵花籽原香食用调和油5L 中粮出品</p></div>
						<div class="dealInfo"><span class="price">¥<em>99.9</em></span></div>
					</a>
					<a class="saleDeal" href="" target="_blank">
						<div class="dealCon"><img class="dealImg" src="images/xlqg16.jpg" alt=""></div>
						<div class="title_new"><p class="word" title="暖风机家用取暖器婴儿电暖气暖手宝浴室防水N"><span class="baoyouText">[包邮]</span>暖风机家用取暖器婴儿电暖气暖手宝浴室防水N</p></div>
						<div class="dealInfo"><span class="price">¥<em>199.9</em></span></div>
					</a>
					<a class="saleDeal" href="" target="_blank">
						<div class="dealCon"><img class="dealImg" src="images/xlqg17.jpg" alt=""></div>
						<div class="title_new"><p class="word" title="CIKOO 洗澡玩具 戏水玩具 水枪玩具 高压水枪玩具"><span class="baoyouText">[包邮]</span>CIKOO 洗澡玩具 戏水玩具 水枪玩具 高压水枪玩具</p></div>
						<div class="dealInfo"><span class="price">¥<em>29.0</em></span></div>
					</a>
					<a class="saleDeal" href="" target="_blank">
						<div class="dealCon"><img class="dealImg" src="images/xlqg18.jpg" alt=""></div>
						<div class="title_new"><p class="word" title="联想（ThinkPad）轻薄系列E470c（20H3A004CD）14英寸笔记本电脑（i5-6200U 8G 500G 2G独显 Win10）黑色 "><span class="baoyouText">[包邮]</span>联想（ThinkPad）轻薄系列E470c（20H3A004CD）14英寸笔记本电脑（i5-6200U 8G 500G 2G独显 Win10）黑色 </p></div>
						<div class="dealInfo"><span class="price">¥<em>4499.9</em></span></div>
					</a>
				</div>
				<div class="xsq_deal_wrapper pc-deal-list clearfix" >
					<a class="saleDeal" href="" target="_blank">
						<div class="dealCon"><img class="dealImg" src="images/xlqg12.jpg" alt=""></div>
						<div class="title_new"><p class="word" title="【京东超市】福临门 葵花籽原香食用调和油5L 中粮出品"><span class="baoyouText">[包邮]</span>【京东超市】福临门 葵花籽原香食用调和油5L 中粮出品</p></div>
						<div class="dealInfo"><span class="price">¥<em>39.9</em></span></div>
					</a>
					<a class="saleDeal" href="" target="_blank">
						<div class="dealCon"><img class="dealImg" src="images/xlqg1.jpg" alt=""></div>
						<div class="title_new"><p class="word" title="神火（supfire）C8T6 强光手电筒 远射LED充电式防身灯 配18650电池"><span class="baoyouText">[包邮]</span>神火（supfire）C8T6 强光手电筒 远射LED充电式防身灯 配18650电池</p></div>
						<div class="dealInfo"><span class="price">¥<em>99.0</em></span></div>
					</a>
					<a class="saleDeal" href="" target="_blank">
						<div class="dealCon"><img class="dealImg" src="images/xlqg5.jpg" alt=""></div>
						<div class="title_new"><p class="word" title="【京东超市】福临门 葵花籽原香食用调和油5L 中粮出品"><span class="baoyouText">[包邮]</span>【京东超市】福临门 葵花籽原香食用调和油5L 中粮出品</p></div>
						<div class="dealInfo"><span class="price">¥<em>99.9</em></span></div>
					</a>
					<a class="saleDeal" href="" target="_blank">
						<div class="dealCon"><img class="dealImg" src="images/xlqg4.jpg" alt=""></div>
						<div class="title_new"><p class="word" title="暖风机家用取暖器婴儿电暖气暖手宝浴室防水N"><span class="baoyouText">[包邮]</span>暖风机家用取暖器婴儿电暖气暖手宝浴室防水N</p></div>
						<div class="dealInfo"><span class="price">¥<em>199.9</em></span></div>
					</a>
					<a class="saleDeal" href="" target="_blank">
						<div class="dealCon"><img class="dealImg" src="images/xlqg9.jpg" alt=""></div>
						<div class="title_new"><p class="word" title="CIKOO 洗澡玩具 戏水玩具 水枪玩具 高压水枪玩具"><span class="baoyouText">[包邮]</span>CIKOO 洗澡玩具 戏水玩具 水枪玩具 高压水枪玩具</p></div>
						<div class="dealInfo"><span class="price">¥<em>29.0</em></span></div>
					</a>
					<a class="saleDeal" href="" target="_blank">
						<div class="dealCon"><img class="dealImg" src="images/xlqg10.jpg" alt=""></div>
						<div class="title_new"><p class="word" title="联想（ThinkPad）轻薄系列E470c（20H3A004CD）14英寸笔记本电脑（i5-6200U 8G 500G 2G独显 Win10）黑色 "><span class="baoyouText">[包邮]</span>联想（ThinkPad）轻薄系列E470c（20H3A004CD）14英寸笔记本电脑（i5-6200U 8G 500G 2G独显 Win10）黑色 </p></div>
						<div class="dealInfo"><span class="price">¥<em>4499.9</em></span></div>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- //-----------加载分类区 -->
<div style="height:100px"></div>
<%@ include file="footer.jsp" %>
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
    
    //----------商品分类----------------
    $(function(){
    	var content = "";
		$.post(
				"${pageContext.request.contextPath}/category.do",
				function(data){
					for(var i=0;i<data.length;i++){
						cname = data[i].cname;
						content+="<li class=''><i class='list-icon-2'></i><a href='/lanqiaoshop/pager.do?cid="+data[i].cid+"'>"+cname+"</a><span></span></li>";	
					}
					$("#ul_one").html(content);
				},
				"json"
		);
    });
  //----------热门商品----------------
  	 $(function(){
  		var content = "";
		$.post(
				"${pageContext.request.contextPath}/hot.do",
				function(data){
					console.log(data) 
					for(var i=0;i<data.length;i++){
						pdesc = data[i].pdesc;
						content +="<div class='xsq_deal_wrapper'><a class='saleDeal' href='${pageContext.request.contextPath}/forward.do?type=morelike&pid="+data[i].pid+"&pname="+data[i].pname+"' ><div class='dealCon'><img class='dealImg' src='"+data[i].pimage+"' alt=''><div class='zt2Qrcode overlay'><div class='xsqMask'></div><p class='word1'>15:00开抢</p><p class='word2'>限100件，抢完恢复"+data[i].pmarket_price+"元</p><p class='word3'>查看商品&gt;&gt;</p></div><div class='stock'><div class='xsqMask'></div><span class='stockWord'><i class='stocknumber'>还剩73件</i> 抢完恢复原价"+data[i].pmarket_price+"元</span></div></div><div class='title_new'><p class='word' title='升级版原汁机低速榨汁机HUZK24WNM '><span class='baoyouText'>[包邮]</span>"+pdesc+" </p></div><div class='dealInfo'><span class='price'>¥<em>"+data[i].pshop_price+"</em></span><span class='shop_preferential'>满2件8.8折</span></div></a></div>"; 
					}
					$("#box_li1").html(content);
				},
				"json"
		);
    });
  		/*最新商品*/
  	  $(function(){
  		var content = "";
		$.post(
				"${pageContext.request.contextPath}/new.do",
				function(data){
					//console.log(data)
					for(var i=0;i<6;i++){
						pdesc = data[i].pdesc;
						content +="<div class='xsq_deal_wrapper'><a class='saleDeal' href='${pageContext.request.contextPath}/forward.do?type=morelike&pid="+data[i].pid+"&pname="+data[i].pname+"' ><div class='dealCon'><img class='dealImg' src='"+data[i].pimage+"' alt=''><div class='zt2Qrcode overlay'><div class='xsqMask'></div><p class='word1'>15:00开抢</p><p class='word2'>限100件，抢完恢复"+data[i].pmarket_price+"元</p><p class='word3'>查看商品&gt;&gt;</p></div><div class='stock'><div class='xsqMask'></div><span class='stockWord'><i class='stocknumber'>还剩73件</i> 抢完恢复原价"+data[i].pmarket_price+"元</span></div></div><div class='title_new'><p class='word' title='升级版原汁机低速榨汁机HUZK24WNM '><span class='baoyouText'>[包邮]</span>"+pdesc+" </p></div><div class='dealInfo'><span class='price'>¥<em>"+data[i].pshop_price+"</em></span><span class='shop_preferential'>满2件8.8折</span></div></a></div>"; 
					}
					$("#box_li2").html(content);
				},
				"json"
		);
    });  
    </script>
    	

</body>
</html>