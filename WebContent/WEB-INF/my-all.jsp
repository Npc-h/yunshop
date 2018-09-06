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

	<div class="center" style="background: #fff;">
		<div style="padding: 20px">
			<div class="containers clearfix">
				<div class="containers">
					<div class="pc-nav-title">
						<h3>${goods.pname}</h3>
					</div>
					<div class="pc-nav-digit clearfix">
						<c:forEach var="goods" items="${pageinfo.datas }">
							<ul>
								<li>
									<div class="digit1">
										<a href="/lanqiaoshop/forward.do?type=more&pid=${goods.pid}&cid=${goods.cid}&currpage=${pageinfo.pageindex}"><img src="${goods.pimage}" width="100%"></a>
									</div>
									<div class="digit2">
										<a href="#">${goods.pname}</a>
									</div>
									<div class="digit3">商城价格: ${goods.pshop_price}</div>
								</li>
							</ul>
						</c:forEach>
					</div>
				</div>

				<div class="pagination" style="width: 100%">
					<form id="f1" action="" method="post">

						<ul>
							<c:if test="${pageinfo.pageindex==1 }">
								<li class="disablepage"><< 首页</li>
								<li class="disablepage"><< 上一页</li>
							</c:if>
							<c:if test="${pageinfo.pageindex!=1 }">
								<li class="nextpage"><a
									href="${pageContext.request.contextPath }/pager.do?cid=${param.cid}&pageindex=1">首页
										>></a></li>
								<li class="nextpage"><a
									href="${pageContext.request.contextPath }/pager.do?cid=${param.cid}&pageindex=${pageinfo.pageindex-1 }">上一页
										>></a></li>
							</c:if>
							<c:set var="startindex" value="${pageinfo.pageindex-5 }" />
							<c:set var="endindex" value="${startindex+9 }" />
							<c:if test="${startindex <= 0}">
								<c:set var="startindex" value="1" />
								<c:set var="endindex" value="${startindex+9 }" />
							</c:if>
							<c:if test="${ endindex>=pageinfo.pagecount}">
								<c:set var="endindex" value="${pageinfo.pagecount }" />
								<c:set var="startindex" value="${endindex-9 }" />
							</c:if>
							<c:if test="${startindex <= 0}">
								<c:set var="startindex" value="1"></c:set>
							</c:if>

							<c:forEach begin="${startindex }" end="${endindex }" var="item">
								<c:if test="${item==pageinfo.pageindex }">
									<li class="currentpage">${item }</li>
								</c:if>
								<c:if test="${item!=pageinfo.pageindex }">
									<li><a
										href="${pageContext.request.contextPath }/pager.do?cid=${param.cid}&pageindex=${item}">${item}</a></li>
								</c:if>
							</c:forEach>

							<c:if test="${pageinfo.pageindex<pageinfo.pagecount-5 }">
								<li>...</li>
								<li><a
									href="${pageContext.request.contextPath }/pager.do?cid=${param.cid}&pageindex=${pageinfo.pagecount-1}">${pageinfo.pagecount-1}</a></li>
								<li><a
									href="${pageContext.request.contextPath }/pager.do?cid=${param.cid}&pageindex=${pageinfo.pagecount}">${pageinfo.pagecount}</a></li>
							</c:if>


							<c:if test="${pageinfo.pageindex==pageinfo.pagecount }">
								<li class="disablepage"><< 下一页</li>
								<li class="disablepage"><< 尾页</li>
							</c:if>
							<c:if test="${pageinfo.pageindex!=pageinfo.pagecount }">
								<li class="nextpage"><a
									href="${pageContext.request.contextPath }/pager.do?cid=${param.cid}&pageindex=${pageinfo.pageindex+1 }">下一页
										>></a></li>
								<li class="nextpage"><a
									href="${pageContext.request.contextPath }/pager.do?cid=${param.cid}&pageindex=${pageinfo.pagecount}">尾页
										>></a></li>
							</c:if>
							<li><select id="s1"
								style="height: 28px; width: 40px; border: solid 1px #9aafe5;">
									<c:forEach begin="0" end="${pageinfo.pagecount}" var="i">
										<option value='${i}' ${i==pageinfo.pageindex?'selected':''}>${i}</option>
									</c:forEach>
							</select></li>
						</ul>

					</form>
				</div>
			 	<script type="text/javascript">
					window.onload = function() {
						document.getElementById("s1").onchange = function() {
							var index = this.selectedIndex;
							var pageindex = this.options[index].value;
							var f1 = document.getElementById("f1");
							f1.action = "/lanqiaoshop/pager.do?cid="
									+
				<%=request.getParameter("cid")%>
					+ "&pageindex=" + pageindex;
							f1.submit();
						}
					}
				</script> 

			</div>
		</div>


		<div style="height: 100px"></div>


		<%@ include file="/WEB-INF/footer.jsp"%>
</body>
</html>