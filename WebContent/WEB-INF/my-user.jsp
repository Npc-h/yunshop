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
	<title>云购物商城-会员中心</title>
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
 <c:if test="${sessionScope.user!=null}"> 
			<!-- <h1>测试user账号是否为空</h1> -->
			<div class="containers center"><div class="pc-nav-item"><a href="#">首页</a> &gt; <a href="#">会员中心 </a> &gt; <a href="#">账号安全</a></div></div>
<section id="member">
	<div class="member-center clearfix">
		<div class="member-left fl">
			<div class="member-apart clearfix">
				<div class="fl"><a href="#"><img src="img/mem.png"></a></div>
				<div class="fl">
					<p>用户名：</p>
					<p><a href="#">${sessionScope.user.username}</a></p>
					<p>云账号：</p>
					<p>${sessionScope.user.uname}</p>
				</div>
			</div>
			<div class="member-lists">
				<dl>
					<dt>我的商城</dt>
					<dd><a >账户安全</a></dd>
					<dd><a href="${pageContext.request.contextPath}/forward.do?type=myself&uid=${sessionScope.user.uid }">信息管理</a></dd>
					<dd><a href="${pageContext.request.contextPath}/forward.do?type=mymsg&uid=${sessionScope.user.uid }">详细信息</a></dd>
					<dd><a href="${pageContext.request.contextPath}/forward.do?type=mylove">我的收藏</a></dd>
					<dd><a href="#">地址管理</a></dd>
				</dl>
				<dl>
					<dt>客户服务</dt>
					<dd><a href="#">退货申请</a></dd>
					<dd><a href="#">退货/退款记录</a></dd>
				</dl>
				<dl>
					<dt>我的消息</dt>
					<dd class="cur"><a href="#">商城快讯</a></dd>
					<dd><a href="#">帮助中心</a></dd>
				</dl>
			</div>
		</div>
		<div class="member-right fr">
			<div class="member-head">
				<div class="member-heels fl"><h2>账户安全</h2></div>
			</div>
			<div class="member-border">
				<div class="member-secure clearfix">
					<div class="member-extent fl">
						<h2 class="fl">安全级别</h2>
						<ul class="fl">
							<li class="on"></li>
							<li class="on"></li>
							<li class="on"></li>
							<li class="on"></li>
							<li class="on"></li>
							<li class="on"></li>
							<li class="on"></li>
							<li class="on1"><a href="#"></a></li>
							<li class="on2"><a href="#"></a></li>
							<li class="on3"><a href="#"></a></li>
						</ul>
						<span class="fl">较高</span>
					</div>
					<div class="fr reds"><p> * 建议您开启全部安全设置，以保障您的账户及资金安全</p></div>
				</div>
				<div class="member-caution clearfix">
					<ul>
						<li class="clearfix">
							<div class="warn1"></div>
							<div class="warn2">登录密码</div>
							<div class="warn3">互联网账号存在被盗风险，建议您定期更改密码以保护账户安全。</div>
							<div class="warn4"><a href="#">修改</a> </div>
						</li>
						<li class="clearfix">
							<div class="warn1"></div>
							<div class="warn2">密保问题</div>
							<div class="warn3">建议您设置密保问题。  </div>
							<div class="warn4"><a href="#">设置密保</a> </div>
						</li>
						<li class="clearfix">
							<div class="warn1"></div>
							<div class="warn2">手机验证</div>
							<div class="warn3">您验证的手机： <i class="reds">134*****693</i>   若已丢失或停用，请立即更换，<i class="reds">避免账户被盗</i></div>
							<div class="warn5"><p>解绑请咨询搜小悦官方客服 <i>souyue@zhongsou.com  </i></p></div>
						</li>
						<li class="clearfix">
							<div class="warn6"></div>
							<div class="warn2">支付密码</div>
							<div class="warn3">安全程度：  建议您设置更高强度的密码。</div>
							<div class="warn5"><a href="#">支付密码管理</a></div>
						</li>
					</ul>
					<div class="member-prompt">
						<p>安全提示：</p>
						<p>您当前IP地址是：<i class="reds">110.106.0.01</i>  北京市          上次登录的TP： 2015-09-16  <i class="reds">110.106.0.02 </i> 天津市</p>
						<p>1. 注意防范进入钓鱼网站，不要轻信各种即时通讯工具发送的商品或支付链接，谨防网购诈骗。</p>
						<p>2. 建议您安装杀毒软件，并定期更新操作系统等软件补丁，确保账户及交易安全。      </p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<div style="height:100px"></div>
 </c:if> 
 <c:if test="${sessionScope.user==null}"> 
 <!-- 用户没有登陆的时候图片待定 -->
 	
 </c:if> 

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