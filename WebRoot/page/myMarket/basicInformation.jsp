<%@ page language="java" import="java.util.*,com.csustflea.model.*"
	pageEncoding="UTF-8"%>
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

<link rel="stylesheet" href="extjs/resources/css/ext-all-gray.css"
	type="text/css"></link>

<script type="text/javascript" src="extjs/bootstrap.js"></script>
<script type="text/javascript" src="extjs/ext-lang-zh_CN.js"></script>

<link rel="stylesheet" type="text/css"
	href="css/myMarket/iframe/basicInformation.css">
<script type="text/javascript">
 function check(){
   var reg = /^(-|\+)?\d+$/ ;   /* 判断是否为整数的正则表达式 */
   if (reg.test(document.getElementById("age").value)){
     document.getElementById("myform").submit();
   }
   else{
   Ext.Msg.alert('温馨提示','年龄请填写整数');
   }
 }
 
 
 function subpic(){
 if(form1.file1.value == ""){
   Ext.Msg.alert('温馨提示','你没有选择相片,请重新选择'); 
 }
 else{
  form1.submit();
 }
    
 }

</script>
</head>

<body>
	<div class="mainPageLayout">
		<div class="basicInforBlank"></div>
		<div class="changeFacePic">
			<div class="submitPic">
				<img src='<s:property value="#attr.listUserTemp.image"/>'>
			</div>
			<form action="CpUser_updateuserpic.action" method="post"
				enctype="multipart/form-data" id="form1">
				<div>
					<div>
						<s:file name="doc" style="width:68px;margin-top:-20px;" id="file1"></s:file>
					</div>
					<div style="margin-left: 350px;">
						<input type="button" value="提交图片" onclick="subpic()"></input>
					</div>
				</div>
			</form>
			<form action="CpUser_updateuserifo.action" method="post" id="myform">
				<div class="changeList">
					<ul style="margin-top: 30px;font-size:16px;font-family: '黑体'">
						<li style="display:none">账号名:&nbsp;&nbsp;<input type="text" name="user.username"
							value="<s:property value="listUserTemp.username" />"></li>
						<li>手机:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
							name="user.phonenumber" value="<s:property value="listUserTemp.phonenumber" />">
						</li>
						<li>性别:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
							name="user.sex" value="<s:property value="listUserTemp.sex" />">
						</li>
						<li>年龄:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
							name="user.age" value="<s:property value="listUserTemp.age" />" id="age" >
						</li>
						<li>真实姓名:<input type="text" name="user.realname"
							value="<s:property value="listUserTemp.realname" />">
						</li>
						<li>年级:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
							name="user.grade" value="<s:property value="listUserTemp.grade" />">
						</li>
						<li>邮箱:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
							name="user.email" value="<s:property value="listUserTemp.email" />">
						</li>
						<li>院校:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
							name="user.college" value="<s:property value="listUserTemp.college" />">
						</li>
						<li>住址:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
							name="user.address" value="<s:property value="listUserTemp.address" />">
						</li>
						<li style="display:none">密码:&nbsp;&nbsp;&nbsp;&nbsp;<input
							type="text" name="user.password" value="<s:property value="listUserTemp.password" />">
						</li>
						<li style="display:none">头像:&nbsp;&nbsp;&nbsp;&nbsp;<input
							type="text" name="user.image" value="<s:property value="listUserTemp.image" />">
						</li>
					</ul>
					<div style="margin-left: 350px;">
						<input type="button" value="提交信息" onclick="check()"></input>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
