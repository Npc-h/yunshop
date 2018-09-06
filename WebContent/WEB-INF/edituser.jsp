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
<c:set var="user" value="${user}"/>
<div class="containers center"><div class="pc-nav-item"><a href="#">首页</a> &gt; <a href="#">会员中心 </a> &gt; <a href="#">我的中心</a></div></div>
<section id="member">
	<div class="member-center clearfix">
		<div class="member-left fl">
			<div class="member-apart clearfix">
				<div class="fl"><a href="#"><img src="img/mem.png"></a></div>
				<div class="fl">
					<p>用户名：</p>
					<p><a href="#">${user.username}</a></p>
					<p>云账号：</p>
					<p>${sessionScope.user.uname}</p>
				</div>
			</div>
			<div class="member-lists">
				<dl>
					<dt>我的商城</dt>
					<dd><a href="${pageContext.request.contextPath}/forward.do?type=myselfAll">账户安全</a></dd>
					<dd><a>信息管理</a></dd>
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
				<div class="member-heels fl"><h2>完善个人信息</h2></div>
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
					<div class="fr reds"><p> * 建议您完善信息，以保障您的账户具有更多权利</p></div>
				</div>
				
				<div class="member-caution clearfix">
				
				<form action="${pageContext.request.contextPath }/forward.do?type=info&uid=${user.uid}" method="post">
					<ul>
						<li class="clearfix">
							<div class="warn1"></div>
							<div class="warn2">真实姓名</div>
							<div class="warn3"><input type="text"style="width: 300px;" id="name" name="uname"><span id="span_name" style="color: chartreuse;"></span></div>
						</li>
						<li class="clearfix">
							<div class="warn1"></div>
							<div class="warn2">电话号码</div>
							<div class="warn3"><input type="text"style="width: 300px;" id="tel" name="utel"><span id="span_tel" style="color: chartreuse;"></span></div>
						</li>
						<li class="clearfix">
							<div class="warn1"></div>
							<div class="warn2">你的生日</div>
							<div class="warn3"><input type="text"style="width: 300px;" id="bir" name="ubir"><span id="span_bir" style="color: chartreuse;"></span></div>
						</li>
						<li class="clearfix">
							<div class="warn6"></div>
							<div class="warn2">你的性别</div>
								<span style="margin-right: 300px;">
							<input type="radio" name="sex" value="男" style="width: 100px;"/><font size="4">男</font>
							<input type="radio" name="sex" value="女" style="width: 100px;"/><font size="4">女</font>
							<label for="sex" class="error" style="display: none;"></label>
								</span>
							<div class="warn5"><input type="submit" value="完善" style="height: 40px; width: 120px;margin-left: 20px"/></div>
						</li>
					</ul>
					</form>
					<div class="member-prompt">
						<p>安全提示：</p>
						<p>您当前IP地址是：<i class="reds">110.106.0.01</i>  北京市          上次登录的TP： 2018-08-16  <i class="reds">110.106.0.02 </i> 天津市</p>
						<p>1. 注意防范进入钓鱼网站，不要轻信各种即时通讯工具发送的商品或支付链接，谨防网购诈骗。</p>
						<p>2. 建议您安装杀毒软件，并定期更新操作系统等软件补丁，确保账户及交易安全。      </p>
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
<script src="js/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$(function(){
				$("#name").hover(
					function(){
						 $("#span_name").html("请填写你的真实姓名哦!");
					},
					function(){
						$("#span_name").html("");
					}
				);
				$("#tel").hover(
					function(){
						 $("#span_tel").html("是你本人的手机号码");
					},
					function(){
						$("#span_tel").html("");
					}
				);
				$("#bir").hover(
					function(){
						 $("#span_bir").html("我们会在生日当天送出彩蛋哦!");
					},
					function(){
						$("#span_bir").html("");
					}
				);
				$("#sub").click(function(){
					if($("#name").text()==""){
						/* confirm("是否提交你的完善信息"); */
						alert("更新成功");
					}
				})
			});
		</script>
</body>
</html>