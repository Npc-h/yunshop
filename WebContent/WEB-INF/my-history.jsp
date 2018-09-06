<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<title>云购物商城-商城资讯</title>
	<link rel="shortcut icon" type="image/x-icon" href="img/icon/favicon.ico">
	<link rel="stylesheet" type="text/css" href="css/base.css">
	<link rel="stylesheet" type="text/css" href="css/home.css">
	<link rel="stylesheet" type="text/css" href="css/member.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
	<script type="text/javascript" src="js/modernizr-custom-v2.7.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.SuperSlide.js"></script>
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
        $(document).ready(function(){
            var $miaobian=$('.Xcontent08>div');
            var $huantu=$('.Xcontent06>img');
            var $miaobian1=$('.Xcontent26>div');
            $miaobian.mousemove(function(){miaobian(this);});
            $miaobian1.click(function(){miaobian1(this);});
            function miaobian(thisMb){
                for(var i=0; i<$miaobian.length; i++){
                    $miaobian[i].style.borderColor = '#dedede';
                }
                thisMb.style.borderColor = '#cd2426';

                $huantu[0].src = thisMb.children[0].src;
            }
            function miaobian1(thisMb1){
                for(var i=0; i<$miaobian1.length; i++){
                    $miaobian1[i].style.borderColor = '#dedede';
                }
//		thisMb.style.borderColor = '#cd2426';
                $miaobian.css('border-color','#dedede');
                thisMb1.style.borderColor = '#cd2426';
                $huantu[0].src = thisMb1.children[0].src;
            }
            $(".Xcontent33").click(function(){
                var value=parseInt($('.input').val())+1;
                $('.input').val(value);
            })

            $(".Xcontent32").click(function(){
                var num = $(".input").val()
                if(num>0){
                    $(".input").val(num-1);
                }

            })

        })
	</script>

</head>
<body>
<%@ include file="/WEB-INF/header.jsp" %>
<%@ include file="/WEB-INF/daohanglan.jsp" %>
<!-- 封装历史记录 -->

<div class="containers center"><div class="pc-nav-item"><a href="#">首页</a> &gt; <a href="#">会员中心 </a> &gt; <a href="#">浏览历史</a></div></div>
<section id="member">
	<div class="member-center clearfix">
		<div class="member-left fl">
			<div class="member-apart clearfix">
				<div class="fl"><a href="#"><img src="img/mem.png"></a></div>
				<div class="fl">
					<p>用户名：</p>
					<p><a href="#">${user.username}</a></p>
					<p>搜悦号：</p>
					<p>${user.uname}</p>
				</div>
			</div>
			<div class="member-lists">
				<dl>
					<dt>我的商城</dt>
					<dd><a href="${pageContext.request.contextPath}/forward.do?type=myselfAll">账户安全</a></dd>
					<dd><a href="${pageContext.request.contextPath}/forward.do?type=myself&uid=${sessionScope.user.uid }">信息管理</a></dd>
					<dd><a href="#">详细信息</a></dd>
					<dd><a href="#">我的评价</a></dd>
					<dd><a href="#">地址管理</a></dd>
				</dl>
				<dl>
					<dt>客户服务</dt>
					<dd><a href="#">退货申请</a></dd>
					<dd><a href="#">退货/退款记录</a></dd>
				</dl>
				<dl>
					<dt>我的消息</dt>
					<dd class="cur"><a href="#">浏览记录</a></dd>
					<dd><a href="#">帮助中心</a></dd>
				</dl>
			</div>
		</div>
		<div class="member-right fr">
			<div class="member-head">
				<div class="member-heels fl"><h2>浏览记录</h2></div>
			</div>
			<div class="member-border">
				<div class="member-form clearfix">
					<form>
						<input class="text-news" placeholder="浏览记录关键字" type="text">
						<input class="button-btn" value="搜索" type="button">
					</form>
				</div>
				<div class="member-entry">
					<div class="member-issue clearfix">
						<span>您最近的浏览商品</span>
					</div>
					
	<div class="center pc-top-20">
		<div class="pc-center-he">
			
			<div class="pc-list-goods"style="width: 967px;">
				<div class="xsq_deal_wrapper pc-deal-list clearfix">
					<c:if test="${!empty historyProductOver}">
				 	<c:forEach var="historyProduct" items="${historyProductOver}"> 
					<a class="saleDeal" href="">
						<div class="dealCon"><img class="dealImg" src="${historyProduct.pimage}" alt=""></div>
						<div class="title_new"><p class="word" title="【京东超市】福临门 葵花籽原香食用调和油5L 中粮出品"><span class="baoyouText">[包邮]</span>${historyProduct.pdesc}</p></div>
						<div class="dealInfo"><span class="price">¥<em>${historyProduct.pshop_price}</em></span></div>
					</a>
					 </c:forEach>
					 </c:if>
					 <c:if test="${empty historyProductOver}">
					 	<div >
				<img alt="" src="${pageContext.request.contextPath }/images/cart-empty.png">
				<div class="" style="margin-top:260px;margin-right:700px;float:right;height:auto;width:200px;">
				</div>
				</div>
					 </c:if>
				</div>
			</div>
		</div>
	</div>
				</div>
				<div class="member-pages clearfix">
					<div class="fr pc-search-g">
						<a href="#" class="fl pc-search-f">上一页</a>
						<a class="current" href="#">1</a>
						<a href="javascript:;">2</a>
						<a href="javascript:;">3</a>
						<a href="javascript:;">4</a>
						<a href="javascript:;">5</a>
						<a href="javascript:;">6</a>
						<a href="javascript:;">7</a>
						<span class="pc-search-di">…</span>
						<a onclick="SEARCH.page(3, true)" href="javascript:;" class="pc-search-n" title="使用方向键右键也可翻到下一页哦！">下一页</a>
						<span class="pc-search-y">
                        <em>  共1页    到第</em>
                        <input placeholder="1" class="pc-search-j" type="text">
                        <em>页</em>
                        <a class="confirm" href="#">确定</a>
                    </span>

					</div>
				</div>
			</div>
		</div>
	</div>
</section>

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