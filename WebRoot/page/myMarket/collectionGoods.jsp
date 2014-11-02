<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'MyJsp.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css"
	href="css/myMarket/iframe/collectionGoods.css">
<script type="text/javascript" src="js/myMarket/selectAll.js">
	
</script>
</head>

<body>
	<div id="managementLayout">
		<div class="managementBlank"></div>
		<div class="managementInfo">
			<div class="managementTitle">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品图片&nbsp;&nbsp;&nbsp;&nbsp;商品名称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价格&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发布时间<br />
				&nbsp;<img src="img/myMarket/managementLine.gif">
			</div>
			<div class="managementList">
				<form action="ListCollection_DelCGoods.action">
					<ul style="margin-left: 30px;">
						<s:iterator value="listcollection" id="dd">
							<li><div style="float:left;">
									<input type="checkbox" name="things" value="<s:property value="#dd.id" />"/>
								</div>
								<div style="float: left;">
									<img src='<s:property value="#dd.gpic" />'>
								</div>
								<div class="managementList1">
									&nbsp;&nbsp;&nbsp;<a href="#"><s:property value="#dd.gname" /></a>
								</div>
								<div class="managementList2"><s:property value="#dd.gprice" /></div>
								<div class="managementList3"><s:property value="#dd.gdate" /></div>
							</li>
						</s:iterator>
					</ul>
					&nbsp;<img src="img/myMarket/managementLine.gif">
					<div class="managementSubmit">
						<input type="checkbox" id="selectAll" onclick="selectAllThings()">&nbsp;&nbsp;全选&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
							type="submit" value="删除">
					</div>
				</form>
			</div>
			<div style="margin-top: 20px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<s:a href="ListCollection_list.action?page=%{page-1}">上一页</s:a>&nbsp&nbsp&nbsp&nbsp<s:a href="ListCollection_list.action?page=%{page+1}">下一页</s:a></div>
		</div>
	</div>
</body>
</html>
