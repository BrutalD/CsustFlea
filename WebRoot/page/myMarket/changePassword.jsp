<%@ page language="java" import="java.util.*,com.csustflea.model.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>





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
	href="css/myMarket/iframe/changePassword.css">
<script type="text/javascript">
	function check() {
		Ext.onReady(function() {
			var pwd1 = document.getElementById("pwd1").value;
			var pwd2 = document.getElementById("pwd2").value;
			if (pwd1 != pwd2) {
				Ext.Msg.alert('温馨提示', '您两次输入的密码不一致');
			} else {
			
				 var requestConfig = {
			     url :'CheckUserPwd_smd.action',
			     form:'myForm',
			     method:'post',
			callback : function(options,success,response){
				 if(success){
				  var obj = Ext.JSON.decode(response.responseText);
				  flag = obj.flag;
				  if(flag){
				   Ext.Msg.alert('温馨提示','修改密码成功,请重新登录');
				   }
				   else{
				   Ext.Msg.alert('温馨提示','你的原始密码不正确');
				   }
				}
				else{
				Ext.Msg.alert('温馨提示','请求失败,请重新操作');
				}
			}
		};
		Ext.Ajax.request(requestConfig);
		
			}
		});
	}
	
</script>
</head>

<body>
	<div id="changeLayout">
		<div class="changeBlank"></div>
		<div class="changeMain">
			<form id="myForm" name="myForm">
				&nbsp;&nbsp;
				<div style="font-size:16px;font-family: '黑体'">
					&nbsp;&nbsp;原密码:<input type="password" name="newpassword"></input>
				</div>
				<br /> <br /> &nbsp;&nbsp;
				<div style="font-size:16px;font-family: '黑体'">
					&nbsp;&nbsp;新密码:<input type="password" name="user.password"
						id="pwd1"></input>
				</div>
				<br /> <br />
				<div style="font-size:16px;font-family: '黑体'">
					确认密码:<input type="password" id="pwd2"></input>
				</div>
				<br /> <br /> <br /> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="button" value="提交" onclick="check()" id="bt1">
			</form>
		</div>
	</div>
</body>
</html>
