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

<title>My JSP 'mainPage.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="css/myMarket/iframe/askToBuy.css">
	<link rel="stylesheet" href="extjs/resources/css/ext-all-gray.css"
	type="text/css"></link>
<link rel="stylesheet" type="text/css" href="css/index/blank.css">
<script type="text/javascript" src="extjs/bootstrap.js"></script>
<script type="text/javascript" src="js/myMarket/selectAll.js"></script>
<script type="text/javascript">
 function checkwords(){
   if(document.getElementById("pgname").value.length > 25){
     Ext.Msg.alert('温馨提示','求购商品名字的长度不能超过25个字');
   }
   else if(document.getElementById("descb").value.length > 240){
    Ext.Msg.alert('温馨提示','求购商品描述的长度不能超过240个字');
   }
   else{
     document.getElementById("myform").submit();
   }
 }


</script>
	

</head>

<body>
	<div class="mainPageLayout">
		<div class="managementBlank"></div>
		<div class="managementInfo">
			<s:form action="ListPGoods_savepgoods.action" method="post" id="myform">
				<div style="font-size: 20px;">
					<span style="line-height:30px;">求购商品:</span><input type="text" id="pgname"
						name="pgoods.pgname"><br> <span
  						style="line-height: 30px;">求购价格:</span><input type="text" 
						name="pgoods.pgprice" /><br>
					<div style="font-size: 24px;">
						<span style="line-height: 30px;">求购描叙:</span><br>
						<textarea cols="50" rows="6" name="pgoods.pdescb" id="descb"></textarea>
						&nbsp<input type="button" value="提交" onclick="checkwords()" />
					</div>
				</div>
			</s:form>
			<div class="managementTitle" style="font-size: 16px;font-family: '黑体'">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;求购商品&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;求购描述&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;求购价格<br />
				&nbsp;<img src="img/myMarket/managementLine.gif">
			</div>
			<div class="managementList">
				<form action="ListPGoods_deletepgoods.action" method="post">
					<ul style="margin-left: 30px;font-size: 16px;font-family: '黑体'">
						<s:iterator value="ListGoodsManTemp" id="dd">
							<li><div class="managementList1">
									<input type="checkbox" name="things" value="<s:property value="#dd.id" />" />&nbsp;&nbsp;<a href="#"><s:property
											value="#dd.pgname" />
									</a>
								</div>
								<div class="managementList2">
									<s:property value="#dd.pdescb" />
								</div>
								<div class="managementList3">
									<s:property value="#dd.pgprice" />
								</div></li>
						</s:iterator>
					</ul>
					&nbsp;<img src="img/myMarket/managementLine.gif">
					<div class="managementSubmit" style="font-size: 16px;font-family: '黑体'">
						<input type="checkbox" id="selectAll" onclick="selectAllThings()">&nbsp;&nbsp;全选&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
							type="submit" value="删除">
					</div>
				</form>
			</div>
			<div style="float:left;margin-left: 176px;font-size: 16px;font-family: '黑体'"><s:a href="ListPGoods_listpgoods.action?page=%{page-1}">上一页</s:a></div>       
			<div style="float:left;margin-left: 30px;font-size: 16px;font-family: '黑体'"><s:a href="ListPGoods_listpgoods.action?page=%{page+1}">下一页</s:a></div>
		</div>
	</div>
</body>
</html>
