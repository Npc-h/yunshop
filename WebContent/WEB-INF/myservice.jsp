<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>客服聊天</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" href="css/service.css">
<script src="css/car/jquery-1.11.1.min.js" type="text/javascript" charset="utf-8"></script>


	<meta name="Generator" content="EditPlus®">
	<meta name="Author" content="">
	<meta name="Keywords" content="">
	<meta name="Description" content="">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
	<meta name="renderer" content="webkit">
	<link rel="shortcut icon" type="image/x-icon" href="img/icon/favicon.ico">
	<link rel="stylesheet" type="text/css" href="css/base.css">
	<link rel="stylesheet" type="text/css" href="css/home.css">
	<style type="text/css">
			#div{
				width: 753px;
				height: 303px;
				margin: auto;
				margin-top: 150px;
				margin-left: 150px;
				position: relative;/*相对定位*/
			}
			.img_none{
				display: none;
			}
			.spot{
				position: absolute;/*绝对定位*/
				bottom: -150px;
			}
			.li{
				color: grey;
				width: 100px;
				text-align: center;
				list-style: none;
				cursor: pointer;/*手形状*/
			}
			.leftFloat{
				float: left;
			}
			.hot{
				color: white;
			}
			.hidden{
				display: none;
			}
		</style>
		
			<script type="text/javascript">
							//753 x 303
			var nowIndex = 0;
			function changeImg(liIndex){
				//先获取
				var imgs = document.querySelectorAll('#div img');//数组
				var lis = document.querySelectorAll('li');//数组
//				alert(lis.length);
				
				for(var i = 0;i<4;i++){
					if(nowIndex==i){
						console.log(imgs[i]);
						imgs[i].className ='';
						lis[i].className='hot li leftFloat';
					}else{
						imgs[i].className = 'hidden';
						lis[i].className='li leftFloat';
					}
				}
				nowIndex++;
				if(nowIndex==4){
					nowIndex = 0;
				}
				time = setTimeout(changeImg,2000);
				if(Number(liIndex)){
					clearTimeout(time);
					nowIndex = liIndex;
				}
			}
			window.onload = function(){
				changeImg();
			}
			
		</script>
</head>
<body>
<%@ include file="/WEB-INF/header.jsp" %>
<%@ include file="/WEB-INF/daohanglan.jsp" %>
<!-- 客服轮播图-->
	<div id="div">
			<div >
				<img src="photos/3.png" />
			</div>
			<div >
				<img src="photos/2.png" class="img_none"/>
			</div>
			<div >
				<img src="photos/3.png" class="img_none"/>
			</div>
			<div >
				<img src="photos/2.png" class="img_none"/>
			</div>
			<div class="spot">
				<ul>
					<li class="li leftFloat hot" onclick="changeImg('0')"></li>
					<li class="li leftFloat" onclick="changeImg('1')"></li>
					<li class="li leftFloat" onclick="changeImg('2')"></li>
					<li class="li leftFloat" onclick="changeImg('3')"></li>
				</ul>
			</div>
		</div>
<!--  -->
<div class="dialogue-wrapper">
    <div id="btn_open" class="dialogue-support-btn">
        <i class="dialogue-support-icon"></i>
        <i class="dialogue-support-line"></i>
        <span class="dialogue-support-text">联系客服</span>
    </div>
    <div class="dialogue-main">
        <div class="dialogue-header">
            <i id="btn_close" class="dialogue-close">></i>
            <div class="dialogue-service-info">
                <i class="dialogue-service-img"><img src="img/timg.jpg" width="100%" height="100%"/></i>
                <div class="dialogue-service-title">
                    <p class="dialogue-service-name">蓝桥客服</p>
                    <p class="dialogue-service-detail"></p>
                </div>
            </div>
        </div>
        <div id="dialogue_contain" class="dialogue-contain">
            <p class="dialogue-service-contain"><span class="dialogue-text dialogue-service-text">Hi ${sessionScope.user.username}~，休息时间买点好东西犒劳自己吧！购物有问题，Miku帮您全搞定~</span></p>
            <!-- <p class="dialogue-customer-contain"><span class="dialogue-text dialogue-customer-text">我有个问题</span></p> -->
        </div>
        <div class="dialogue-submit">
           <p id="dialogue_hint" class="dialogue-hint"><span class="dialogue-hint-icon">!</span><span class="dialogue-hint-text">发送内容不能为空</span></p>
            <textarea id="dialogue_input" class="dialogue-input-text"  placeholder="请输入您的问题，按Enter键提交（shift+Enter换行）"></textarea>
         <div class="dialogue-input-tools">
                Enter键发送
            </div>
        </div>
    </div>
</div>
<script>
    var doc = document;
    // 模拟一些后端传输数据
    var serviceData = {
        'robot': {
            'name': 'robot001',
            'dialogue': ['您收到商品超过15天，在质保期内出现质量问题，可以联系厂家售后维修，也可申请京东代修，具体以审核意见为准。',
            '您收到商品7日内（含包装及附件）完好前提下可享受7日无理由退货，商品页面可查看是否支持7天无理由退货。注：激活类商品若已激活且无质量问题不支持退货，如有疑问请联系客服美眉哟~',
            '在的哦~亲', 
            'Miku好像不能理解你所说的哦~,太复杂的问题请联系人工客服2333'],
            'welcome': '您好，robot001为您服务'
        }
    };
    var dialogueInput = doc.getElementById('dialogue_input'),
        dialogueContain = doc.getElementById('dialogue_contain'),
        dialogueHint = doc.getElementById('dialogue_hint'),
        btnOpen = doc.getElementById('btn_open'),
        btnClose = doc.getElementById('btn_close'),
        timer,
        timerId,
        shiftKeyOn = false;  // 辅助判断shift键是否按住

    btnOpen.addEventListener('click', function(e) {
        $('.dialogue-support-btn').css({'display': 'none'});
        $('.dialogue-main').css({'display': 'inline-block', 'height': '0'});
        $('.dialogue-main').animate({'height': '600px'})
    })

    btnClose.addEventListener('click', function(e) {
        $('.dialogue-main').animate({'height': '0'}, function() {
            $('.dialogue-main').css({'display': 'none'});
            $('.dialogue-support-btn').css({'display': 'inline-block'});
        });
    })

    dialogueInput.addEventListener('keydown', function(e) {
        var e = e || window.event;
        if (e.keyCode == 16) {
            shiftKeyOn = true;
        }
        if (shiftKeyOn) {
            return true;
        } else if (e.keyCode == 13 && dialogueInput.value == '') {
            // console.log('发送内容不能为空');
            // 多次触发只执行最后一次渐隐
            setTimeout(function() {
                fadeIn(dialogueHint);
                clearTimeout(timerId)
                timer = setTimeout(function() {
                    fadeOut(dialogueHint)
                }, 2000);
            }, 10);
            timerId = timer;
            return true;
        } else if (e.keyCode == 13) {
            var nodeP = doc.createElement('p'),
                nodeSpan = doc.createElement('span');
            nodeP.classList.add('dialogue-customer-contain');
            nodeSpan.classList.add('dialogue-text', 'dialogue-customer-text');
            nodeSpan.innerHTML = dialogueInput.value;
            nodeP.appendChild(nodeSpan);
            dialogueContain.appendChild(nodeP);
            dialogueContain.scrollTop = dialogueContain.scrollHeight;
            submitCustomerText(dialogueInput.value);
        }
    });

    dialogueInput.addEventListener('keyup', function(e) {
        var e = e || window.event;
        if (e.keyCode == 16) {
            shiftKeyOn = false;
            return true;
        }
        if (!shiftKeyOn && e.keyCode == 13) {
            dialogueInput.value = null;
        }
    });

    function submitCustomerText(text) {
        console.log(text)
//      if(text.indexOf("在")!=-1){
//		console.log(serviceData.robot.dialogue[0]);
		if(text.indexOf("在")!=-1){
			getServiceText(serviceData.robot.dialogue[2])
		}else if(text.indexOf("退")!=-1){
			getServiceText(serviceData.robot.dialogue[1])
		}else if(text.indexOf("售后")!=-1){
			getServiceText(serviceData.robot.dialogue[0])
		}else{
			getServiceText(serviceData.robot.dialogue[3])
		}
//      	getServiceText(serviceData);
//      }
        // code here 向后端发送text内容

        // 模拟后端回复
//      var num = Math.random() * 10;
//      if (num <= 7) {
            
//      }
    }

    function getServiceText(data) {
      /*  var serviceText = data.robot.dialogue,
            i = Math.floor(Math.random() * serviceText.length);*/
        var nodeP = doc.createElement('p'),
            nodeSpan = doc.createElement('span');
        nodeP.classList.add('dialogue-service-contain');
        nodeSpan.classList.add('dialogue-text', 'dialogue-service-text');
//      nodeSpan.innerHTML = serviceText[i];
		nodeSpan.innerHTML = data;
        nodeP.appendChild(nodeSpan);
        dialogueContain.appendChild(nodeP);
        dialogueContain.scrollTop = dialogueContain.scrollHeight;
    }

    // 渐隐
    function fadeOut(obj) {
        var n = 100;
        var time = setInterval(function() {
            if (n > 0) {
                n -= 10;
                obj.style.opacity = '0.' + n;
            } else if (n <= 30) {
                obj.style.opacity = '0';
                clearInterval(time);
            }
        }, 10);
        return true;
    }

    // 渐显
    function fadeIn(obj) {
        var n = 30;
        var time = setInterval(function() {
            if (n < 90) {
                n += 10;
                obj.style.opacity = '0.' + n;
            } else if (n >= 80) {
                
                obj.style.opacity = '1';
                clearInterval(time);
            }
        }, 100);
        return true;
    }
</script>
</body>
</html>