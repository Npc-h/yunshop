<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
<meta name="renderer" content="webkit">
<title>云购物商城-所有分类</title>
<link rel="shortcut icon" type="image/x-icon"
	href="img/icon/favicon.ico">
<link rel="stylesheet" type="text/css" href="css/base.css">
<link rel="stylesheet" type="text/css" href="css/home.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="js/modernizr-custom-v2.7.1.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.js"></script>
<link rel="stylesheet" rev="stylesheet" href="${pageContext.request.contextPath }/css/style.css" type="text/css" media="all" />
</head>
<body>
	<%@ include file="/WEB-INF/header.jsp"%>
	<%@ include file="/WEB-INF/daohanglan.jsp"%>
	<c:set var="searchProduct" value="${searchProduct}"/>
	<div class="center" style="background: #fff;">
		<div style="padding: 20px">
			<div class="containers clearfix"><div class="pc-nav-item fl"><a href="#" class="pc-title">首页</a> &gt;<a href="#"> 所有货架</a></div> <div class="fr" style="padding-top:20px;"><a href="#" class="reds">所有品牌&gt;</a></div></div>
		<div class="containers">
			<div class="pc-nav-rack clearfix">
				<ul>   
				<li><a href="/lanqiaoshop/pager.do?cid=1" >电脑办公 </a></li>
				<li><a href="/lanqiaoshop/pager.do?cid=2" >数码相机</a></li>
				<li><a href="/lanqiaoshop/pager.do?cid=3" >手机通讯</a></li>
				<li><a href="/lanqiaoshop/pager.do?cid=4" >服装装饰</a></li>
				<li><a href="/lanqiaoshop/pager.do?cid=5" >化妆保养</a></li>
				<li><a href="/lanqiaoshop/pager.do?cid=6" >蔬菜水果</a></li>
				<li><a href="/lanqiaoshop/pager.do?cid=7" >海鲜肉类</a></li>
				<li><a href="/lanqiaoshop/pager.do?cid=8" >儿童玩具</a></li>
				<li><a href="/lanqiaoshop/pager.do?cid=9">鞋类</a></li>
				<li><a href="/lanqiaoshop/pager.do?cid=10">厨具生活</a></li>
				</ul>
			</div>
			<div>
					
				<c:if test="${empty searchProduct}">
					<div >
				<img alt="" src="${pageContext.request.contextPath }/images/cart-empty.png">
				<div class="" style="margin-top:260px;margin-right:700px;float:right;height:auto;width:200px;">
				</div>
				</div>
				</c:if>
				<div class="pc-nav-rack clearfix" id="newBox"> 
				<c:if test="${!empty searchProduct}">
				<c:forEach var="searchProduct" items="${searchProduct}">
				<a class='saleDeal' href='${pageContext.request.contextPath}/forward.do?type=more&pid=${searchProduct.pid}'><div class='dealCon'><img class='dealImg' src="${searchProduct.pimage}" ></div><div class='title_new'><p class='word' title='暖风机家用取暖器婴儿电暖气暖手宝浴室防水N'><span class='baoyouText'>[包邮]</span>${searchProduct.pdesc}</p></div><div class='dealInfo'><span class='price'>心动价¥<em>${searchProduct.pshop_price}</em></span></div></a>
				</c:forEach>
				</div>
				</c:if>
				<div class="clearfix">
						<div class="fr pc-search-g">
							<a class="fl pc-search-f" href="#">上一页</a>
							<a href="#" class="current">1</a>
							<a href="javascript:;">2</a>
							<a href="javascript:;">3</a>
							<a href="javascript:;">4</a>
							<a href="javascript:;">5</a>
							<a href="javascript:;">6</a>
							<a href="javascript:;">7</a>
							<span class="pc-search-di">…</span>
							<a title="使用方向键右键也可翻到下一页哦！" class="pc-search-n" href="javascript:;" onclick="SEARCH.page(3, true)">下一页</a>
							<span class="pc-search-y">
                        <em>  共1页    到第</em>
                        <input class="pc-search-j" placeholder="1" type="text">
                        <em>页</em>
                        <a href="#" class="confirm">确定</a>
                    </span>

						</div>
					</div>

			</div>
		</div>


		<div style="height: 100px"></div>
	
		<%@ include file="/WEB-INF/footer.jsp"%>
</body>
</html>