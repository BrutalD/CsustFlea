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

<title>My JSP 'technicistScore.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/myMarket/iframe/technicistScore.css"
	type="text/css"></link>
</head>

<body>
	<div class="mainPageLayout">

		<div
			style="color: #18528C;width:150px;height:25px;padding-top: 10px;margin-left: 10px;font-size: 18px;clear: both;">已预约用户</div>
		<s:iterator value="uat" id="dd">
			<div
				style="width:489px;height:3px;margin-left: 10px;background-image: url('img/myMarket/technicaScore_bg2.gif');"></div>
			<div
				style="height:100px;font-size: 20px;margin-left: 12px;margin-top: 5px;">
				<div style="float: left;color: #18528C;">&nbsp<s:property value="#dd.utdate" />&nbsp</div>
				<div style="float: left;margin-left: 6px;width:200px;"><s:property value="#dd.uname" />&nbsp&nbsp</div>
				<div style="float: left;color: #18528C;">预约&nbsp&nbsp我</div>
				<div style="float: left;margin-left: 10px;color:red;">完成</div>
				<div style="clear:both;">
					<div
						style="float:left;color: #18528C;padding-left: 12px;padding-top: 10px;">他/她&nbsp&nbsp</div>
					<div style="float:left;padding-top: 10px;">联系方式为&nbsp&nbsp</div>
					<div style="float:left;color: #18528C;padding-top: 10px;"><s:property value="#dd.unumber" /></div>
				</div>
				<div style="clear:both;">
					<div
						style="float:left;color: #18528C;padding-left: 12px;padding-top: 10px;">长理跳蚤市场&nbsp&nbsp</div>
					<div style="float:left;padding-top: 10px;">提醒你&nbsp&nbsp</div>
					<div style="float:left;color: #18528C;padding-top: 10px;">请技术达人尽快联系用户</div>
				</div>
			</div>
		</s:iterator>


		<div style="margin-left:170px;margin-top: 20px; ">
			<s:a href="CheckAppointment_list.action?page=%{page-1}" style="color:black;">上一页</s:a>
			&nbsp&nbsp&nbsp
			<s:a href="CheckAppointment_list.action?page=%{page+1}" style="color:black;">下一页</s:a>
		</div>
	</div>
</body>
</html>
