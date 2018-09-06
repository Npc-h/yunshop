<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@page import="cn.lanqiao.model.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header id="pc-header">
<div class="pc-header-nav">
	<div class="pc-header-con">
		<div class="fl pc-header-link">
			<c:if test="${sessionScope.user==null}">
				<a href="${pageContext.request.contextPath}/forward.do?type=login">请登录</a>
				<a href="${pageContext.request.contextPath}/forward.do?type=reg">免费注册</a>
			</c:if>
			<c:if test="${sessionScope.user!=null }">
			欢迎<a href="${pageContext.request.contextPath}/forward.do?type=myselfAll&uid=${sessionScope.user.uid }">${sessionScope.user.username }</a>来到云购物 
				<a href="${pageContext.request.contextPath}/userexit.do?">注销</a>
			</c:if>
		</div>
			
			<div class="fr pc-header-list top-nav">
				<ul>
				<c:if test="${sessionScope.user!=null}">
					<li>
						<div class="nav"><i class="pc-top-icon"></i><a href="#">我的订单</a></div>
						<div class="con">
							<dl>
								<dt><a href="">批发进货</a></dt>
								<dd><a href="">已买到货品</a></dd>
								<dd><a href="">优惠券</a></dd>
								<dd><a href="">店铺动态</a></dd>
							</dl>
						</div>
					</li>
				</c:if>
				
				<c:if test="${sessionScope.user==null}">
				<a href="${pageContext.request.contextPath}/forward.do?type=login">我的订单</a>
				</c:if>
				<!--  -->
				<c:if test="${sessionScope.user!=null}">
					<li>
						<div class="nav"><i class="pc-top-icon"></i><a href="#">我的商城</a></div>
						<div class="con">
							<dl>
								<dt><a href="">批发进货</a></dt>
								<dd><a href="">已买到货品</a></dd>
								<dd><a href="">优惠券</a></dd>
								<dd><a href="">店铺动态</a></dd>
							</dl>
						</div>
					</li>
					</c:if>
					<c:if test="${sessionScope.user==null}">
					<li><a href="${pageContext.request.contextPath}/forward.do?type=login">我的商城</a></li>
					</c:if>
					
					<c:if test="${sessionScope.user!=null}">
					<li><a href="my-car.jsp">我的云购</a></li>
					</c:if>
					<c:if test="${sessionScope.user==null}">
					<li><a href="${pageContext.request.contextPath}/forward.do?type=login">我的云购</a></li>
					</c:if>
					
					
					<li><a href="${pageContext.request.contextPath}/history.do">我的浏览记录</a></li>
					
					<c:if test="${sessionScope.user!=null}">
					<li><a href="${pageContext.request.contextPath}/forward.do?type=myselfAll&uid=${sessionScope.user.uid}">会员中心</a></li>
					</c:if>
					<c:if test="${sessionScope.user==null}">
					<li><a href="${pageContext.request.contextPath}/forward.do?type=login">我的收藏</a></li>
					</c:if>
					<c:if test="${sessionScope.user!=null}">
					<li><a href="${pageContext.request.contextPath}/forward.do?type=mylove">我的收藏</a></li>
					</c:if>
					<li><a href="${pageContext.request.contextPath}/forward.do?type=service">客服中心</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="pc-header-logo clearfix">
		<div class="pc-fl-logo fl">
			<h1>
				<a href="index.jsp"></a>
			</h1>
		</div>
		<div class="head-form fl">
		<!-- action="${pageContext.request.contextPath }/forward.do?type=info&?uid=${user.uid}" method="post"> -->
			<form class="clearfix" action="${pageContext.request.contextPath }/search.do" method="post">
				<input class="search-text" accesskey="" id="key" autocomplete="off" placeholder="洗衣机" type="text" name="search">
				<!-- <button class="button" onclick="search('key');return false;">搜索</button>  -->
				<input type="submit" class="button" value="搜索"/>
			</form>
			<div class="words-text clearfix">
				<a href="#" class="red">1元秒爆</a>
				<a href="#">低至五折</a>
				<a href="#">农用物资</a>
				<a href="#">佳能相机</a>
				<a href="#">服装城</a>
				<a href="#">买4免1</a>
				<a href="#">家电秒杀</a>
				<a href="#">农耕机械</a>
				<a href="#">手机新品季</a>
			</div>
		</div>
		<div class="fr pc-head-car">
			<i class="icon-car"></i>
			<a href="my-car.jsp">我的购物车</a>
			<%-- <em>${cart.cartItems.size() }</em> --%>
			<c:choose>
                   <c:when test="${cart.cartItems!=null}">
                 	<em>${cart.cartItems.size() }</em>
                   </c:when>
                   <c:otherwise>
                   <em>0</em>
                   </c:otherwise>
			</c:choose>
		</div>
	</div>
	<!-- 客服测试 -->
	
</header>