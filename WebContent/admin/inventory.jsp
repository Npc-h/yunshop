<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" />
<link rel="stylesheet" href="css/Site.css" />
<link rel="stylesheet" href="css/zy.all.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="css/amazeui.min.css" />
<link rel="stylesheet" href="css/admin.css" />
<link rel="stylesheet" rev="stylesheet" href="css/page.css" type="text/css" media="all" />
<!-- ajax异步查询网页商品代码 -->
<script type="text/javascript">
	function findOrderInfoByname(){
		var orderName = $("#mhname").val();
		findOrderInfoBynames(orderName);
	}
	function findOrderInfoBynames(orderName){
		$.post(
						"${pageContext.request.contextPath }/admin.do?method=findOrderInfoByName",
						{
							"orderName" : orderName
						},
						function(data) {
							var content ="";
							for (var i = 0; i < data.length; i++) {
								content +="<tr>"
									+ "<td style='CURSOR: hand; HEIGHT: 22px' align='center'"
									+ "width='10%'>"+i+1+"</td>"
									+ "<td style='CURSOR: hand; HEIGHT: 22px' align='center'"
									+ "width='15%'><img width='60%' height='50' src='${pageContext.request.contextPath }/"+data[i].pimage+"'></td>"
									+ "<td style='CURSOR: hand; HEIGHT: 22px' align='center'"
								    + "width='15%'>"+data[i].pname+"</td>"
									+ "<td style='CURSOR: hand; HEIGHT: 22px' align='center'"
								    + "width='10%'>"+"是"+"</td>"
									+ "<td style='CURSOR: hand; HEIGHT: 22px' align='center'"
								    + "width='10%'>"+data[i].pmarket_price+"</td>"
									+ "<td style='CURSOR: hand; HEIGHT: 22px' align='center'"
								    + "width='10%'>"+data[i].pshop_price+"</td>"
									+ "<td style='CURSOR: hand; HEIGHT: 22px' align='center'"
								    + "width='7%'>"+"是"+"</td>"
								    + "<td class='edit'><button onclick='btn_edit(1)'><i class='icon-edit bigger-120'></i>"+"编辑"+"</button></td>"
									+ "<td class='delete'><button onclick='btn_delete(1)'><i class='icon-trash bigger-120'></i>"+"删除"+"</button></td>"
									+ "</tr>"
							}

							$("#show").html(content);

						}, "json");
	}
</script>

</head>
<body>
	<div class="dvcontent">

		<div>
			<!--tab start-->
			<div class="tabs">
				<div class="hd">
					<ul>
						<li class="on"
							style="box-sizing: initial; -webkit-box-sizing: initial;">商品列表</li>
						<li class=""
							style="box-sizing: initial; -webkit-box-sizing: initial;">添加商品</li>
							
							<!-- 搜索栏 -->
							<input  style="background-color:white ;padding-top: 5px;margin-top: 5px ;margin-left:750px;width: 300px;text-align: left;" type="text" class="form-control" placeholder="请输入检索关键字" id="mhname">
               					 <span class="input-group-btn">
                    			 <button class="btn btn-primary"style="margin-top: 3px ;style="text-align: center"; onclick="findOrderInfoByname()">检索</button>
                			</span>
							<!--  -->
					</ul>
				</div>
				
				
				
				
				<!-- 表格数据 -->
				<div class="bd">
					<ul style="display: block; padding: 20px;">
						<li>
							<!--分页显示角色信息 start-->
							<div id="dv1">
								<table class="table" id="tbRecord">
									<thead>
										<tr >
											<td align="center" width="10%">序号</td>
											<td align="center" width="15%">商品图片</td>
											<td align="center" width="15%">商品名称</td>
											<td align="center" width="10%">商品类别</td>
											<td align="center" width="10%">市场价格</td>
											<td align="center" width="10%">商品价格</td>
											<td align="center" width="7%">是否热门</td>
											<td width="7%" align="center">编辑</td>
											<td width="7%" align="center">删除</td>

										</tr>
									</thead>
									
									 <tbody id="show">
											
										<c:forEach var="product" items="${pageinfo.datas }" >
											<tr>
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="10%">${product.pid }</td>
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="15%"><img src="${pageContext.request.contextPath }/${product.pimage }" width="115" height="129" border="0" /></td>
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="15%">${product.pname  }</td>
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="10%">${product.cid }</td>
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="10%">${product.pmarket_price }</td>
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="10%">${product.pshop_price }</td>
												<td style="CURSOR: hand; HEIGHT: 22px" align="center"
													width="7%"><c:if test="${product.pis_hot!=0}">
																	 是
																</c:if>
																<c:if test="${product.pis_hot==0}">
																	 否
																</c:if></td>	
												<td class="edit"><button onclick="btn_edit('${product.pid}')">
														<i class="icon-edit bigger-120"></i>编辑
													</button></td>
												<td class="delete"><button onclick="btn_delete('${product.pid}')">
														<i class="icon-trash bigger-120"></i>删除
													</button></td>
											</tr>
											</c:forEach> 
									
									</tbody> 
								
								</table>
							</div> <!--分页显示角色信息 end-->
							
							
							<!-- 测试是否能在此加分页样式 -->
							<div class="pagination" style="width:100%" >
						 	<ul  id="pageBox">

								<li class="nextpage"><a href="#" >首页>></a></li>
								<li class="nextpage">
								<a href="#" >上一页>></a></li>
					
							
							
							  <c:set var="startindex" value="${pageinfo.pageindex-5 }"/>
 							 <c:set var="endindex" value="${startindex+9 }"/>
 							 
   							<c:if test="${startindex <= 0}">
							<c:set var="startindex" value="1"/>
							<c:set var="endindex" value="${startindex+9 }"/>
  						 	 </c:if>
   							 <c:if test="${ endindex>=pageinfo.pagecount}">
    							<c:set var="endindex" value="${pageinfo.pagecount }"/>
    						<c:set var="startindex" value="${endindex-9 }"/>
   							 </c:if>
   							
   							 <c:if test="${startindex <= 0}">
							<c:set var="startindex" value="1"/>
  						 	 </c:if>
                                                   
  							<c:forEach begin="${startindex }" end="${endindex }" var="item">
   							<c:if test="${item==pageinfo.pageindex }">
   							<li class="currentpage">${item }</li>
							</c:if>
 							 <c:if test="${item!=pageinfo.pageindex }">
  							<li><a href="#" onclick="pageimpl('${item}')">${item}</a></li>                                              
 							</c:if>
 							</c:forEach>



							
							<li class="nextpage"><a href="#" >下一页>></a></li>
							<li class="nextpage"><a href="#" >尾页>></a></li>

						
						</ul>
					</div>
							
							<!--  -->
					<ul class="theme-popbod dform" style="display: none;">
						<div class="am-cf admin-main" style="padding-top: 0px;">
							<!-- content start -->
							<div class="am-cf admin-main" style="padding-top: 0px;">
								<!-- content start -->
								<div class="admin-content">
									<div class="admin-content-body">

										<div class="am-g">
											<div class="am-u-sm-12 am-u-md-4 am-u-md-push-8"></div>
											<div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4"
												style="padding-top: 30px;">
												<form class="am-form am-form-horizontal" action="${pageContext.request.contextPath }/productperation.do?type=insert" method="post" enctype="multipart/form-data">

													<div class="am-form-group">
														<label for="name" class="am-u-sm-3 am-form-label">
															商品名称</label>
														<div class="am-u-sm-9">
															<input type="text" id="name" required placeholder="商品名称" name="pname"> <small>10字以内...</small>
														</div>
													</div>

													<div class="am-form-group">
														<label for="user-hot" class="am-u-sm-3 am-form-label">
															是否热门</label>
														<div class="am-u-sm-9">
															<td class="ta_01" bgColor="#ffffff">
															<select name="pis_hot">
																	<option value="1" selected="selected">是</option>
																	<option value="0">否</option>
															</select></td>
														</div>
													</div>

													<div class="am-form-group">
														<label for="user-email" class="am-u-sm-3 am-form-label">
															所属分类</label>
														<div class="am-u-sm-9">
															<select name="cid" required>
																<option  disabled="disabled">请选择分类</option>
																<c:forEach var="categor" items="${categorylist }">
																	<option value="${categor.cid }">${categor.cname }</option>
																</c:forEach>
															</select>

														</div>
													</div>

													<div class="am-form-group">
														<label for="market" class="am-u-sm-3 am-form-label">
															市场价格</label>
														<div class="am-u-sm-9">
															<input type="text" id="name" required placeholder="市场价格"
																name="pmarket_price">

														</div>
													</div>
													<div class="am-form-group">
														<label for="mall" class="am-u-sm-3 am-form-label">
															商城价格</label>
														<div class="am-u-sm-9">
															<input type="text" id="name" required placeholder="商城价格"
																name="pshop_price">

														</div>
													</div>

													<div class="am-form-group">
														<label for="photo" class="am-u-sm-3 am-form-label">
															商品图片</label>
														<div class="am-u-sm-9">
															<td class="ta_01" bgColor="#ffffff" colspan="3"><input
																type="file" name="pimage" /></td>

														</div>
													</div>

													<div class="am-form-group">
														<label for="user-intro" class="am-u-sm-3 am-form-label">
															商品描述</label>
														<div class="am-u-sm-9">
															<textarea class="" rows="5" id="user-intro" name="pdesc" placeholder="商品描述"></textarea>
															<small>250字以内...</small>
														</div>
													</div>
													<div class="am-form-group">
														<div class="am-u-sm-9 am-u-sm-push-3">
															<input type="submit" class="am-btn am-btn-success" value="确认添加" />
															&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; 
															<input type="submit" class="am-btn am-btn-success" value="取消"
																onclick="location.href='inventory.jsp'" />
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>

								</div>
								<!-- content end -->
							</div>
							<!--添加 end-->
					</ul>
				</div>
				
				
			</div>
			<!-- 表格数据结束-->
		<!-- 上整体界面结束 -->
		</div>
		

		<script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
		<script src="js/plugs/Jqueryplugs.js" type="text/javascript"></script>
		<script src="js/_layout.js"></script>
		<script src="js/plugs/jquery.SuperSlide.source.js"></script>
		<script>
			var num = 1;
			$(function() {

				$(".tabs").slide({
					trigger : "click"
				});

			});

			function btn_save(){
				$.jq_Confirm({
					message : "您确定要添加吗?",
					btnOkClick : function() {
						location.href="${pageContext.request.contextPath}/productperation.do?type=insert";					}
				});
			}

			function btn_edit(pid){
				$.jq_Panel({
					url : "/RawMaterialsType/EditRawMaterialsType?id=" + id,
					title : "编辑分类",
					dialogModal : true,
					iframeWidth : 500,
					iframeHeight : 400
				});
			}
			function btn_delete(pid){
				$.jq_Confirm({
					message : "您确定要删除吗?",
					btnOkClick : function() {
						 location.href="${pageContext.request.contextPath}/productperation.do?type=delete&pid="+pid;
					}
				});
			}
		</script>
		<!-- 分页ajax -->
		
		<script type="text/javascript">
				//分页请求数据
					function pageimpl(pageindex){
					$("#show").html("");
					var content = "";
					var content1 = "";
					var startindex =0;
					var endindex =0;
					$.post(
						/* 	console.log(pageindex), */
							"${pageContext.request.contextPath}/admin.do?method=pageimpl",
							{
								"pageindex":pageindex
							},
							function(data){
								for(var i=0;i<data.datas.length;i++){		
										 content+="<tr><td style='CURSOR: hand; HEIGHT: 22px' align='center' width='10%'>"+data.datas[i].pid+"</td>"
										+"<td style='CURSOR: hand; HEIGHT: 22px' align='center' width='15%'><img src='"+data.datas[i].pimage+"' width='115' height='129' border='0' /></td>"
										+"<td style='CURSOR: hand; HEIGHT: 22px' align='center' width='15%'>"+data.datas[i].pname+"</td>"
										+"<td style='CURSOR: hand; HEIGHT: 22px' align='center' width='10%'>"+data.datas[i].pid+"</td>"
										+"<td style='CURSOR: hand; HEIGHT: 22px' align='center' width='10%'>"+data.datas[i].pmarket_price+"</td>"  
										+"<td style='CURSOR: hand; HEIGHT: 22px' align='center' width='10%'>"+data.datas[i].pshop_price+"</td>"
										+"<td style='CURSOR: hand; HEIGHT: 22px' align='center' width='7%'>"
										+"<c:if test='"+data.datas[i].pis_hot!=0+"'>是</c:if>"		
										+"<c:if test='"+data.datas[i].pis_hot==0+"'>否</c:if></td>"	
										+"<td class='edit'><button onclick='btn_edit('"+data.datas[i].pshop_pid+"')'>"
										+"<i class='icon-edit bigger-120'></i>编辑</button></td>"
										+"<td class='delete'><button onclick='btn_delete('"+data.datas[i].pid+"')'>"
										+"<i class='icon-trash bigger-120'></i>删除</button></td></tr>" 
										
								}
								for(var j=0;j<data.datas.length;j++){
								 startindex = data.pageindex-5;
									 endindex = startindex+9;
								 	if(startindex<=0){
										startindex=1;
										endindex=startindex+9;
									}
									if(endindex>=data.pagecount){
										endindex=data.pagecount;
										startindex = endindex-9;
									}
									if(startindex<=0){
										startindex = 1;
									} 
									
								}
			
								 content1+="<li class='nextpage'><a href='#' >"+"首頁"+">></a></li>"
										 + "<li class='nextpage'>"
										  + "<a href='#'>"+"上一页"+">></a></li>" 
								for(var j=startindex;j<=endindex;j++){
									if(j==data.pageindex){
									content1+= "<li class='currentpage'>"+j+"</li>"
									}
									if(j!=data.pageindex){
										content1+= "<li><a href='#' onclick='pageimpl("+j+")'>"+j+"</a></li>"
									} 
									
								}
									
								 content1+=	"<li class='nextpage'><a href='#' >"+"下一页"+">></a></li>"
										 +"<li class='nextpage'><a href='#' >"+"尾页"+">></a></li>"
											  
								$("#show").html(content);
								$("#pageBox").html(content1);
							},
							"json"
					);//post
				
				}//function	
		</script>
		
	</div><!-- 全整体界面结束 -->
</body>
</html>