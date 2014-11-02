<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>My JSP 'beTechnicist.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<link rel="stylesheet" type="text/css"
	href="css/myMarket/iframe/beTechnicist.css">
	<link rel="stylesheet" href="extjs/resources/css/ext-all-gray.css"
	type="text/css"></link>

<script type="text/javascript" src="extjs/bootstrap.js"></script>
<script type="text/javascript" src="extjs/ext-lang-zh_CN.js"></script>
<script type="text/javascript">	
  //ajax异步提交，不跳转页面
  
  
Ext.onReady(function(){

  var reg = /^(-|\+)?\d+$/ ;   /* 判断是否为整数的正则表达式 */
  Ext.get("submit").on("click",function(){
  if(reg.test(document.getElementById("price").value)){
  var requestConfig = {
			url :'BeTechnicist_smd.action',//请求的服务器地址
			params : {
			'price' : document.getElementById("price").value,     
			'aspect' : document.getElementById("aspect").value,
			'introduce' : document.getElementById("introduce").value,
			'application' : document.getElementById("application").value,
			},
			callback : function(options,success,response){
				 if(success){
				 var obj = Ext.JSON.decode(response.responseText);  //得到json对象，然后转化成变量
				 var flag = obj.flag;
				 var flag1 = obj.flag1;
				 if(flag == false && flag1 == true){
				   Ext.Msg.alert('温馨提示','申请已提交，等待管理员审核');
				 }
				 else if(flag == true){
				 Ext.Msg.alert('温馨提示','请先提交技术文章，再成为技术人员');  
				 }
				 else {
				   Ext.Msg.alert('温馨提示','你已经是技术人员');
				 }
				}
				else{
				Ext.Msg.alert('温馨提示','请求失败，请重试');
				}
			}
		};
		Ext.Ajax.request(requestConfig);//发送请求  
} 
       else{
		   Ext.Msg.alert('温馨提示','价格只能为整数，请重新提交');
		}
	});
});

	
</script>
</head>

<body>
	<div class="mainPageLayout">
		<div class="leftBlank"></div>
		<div class="rightMain">
			<div class="rightMainTopBlank"></div>
			<div class="rightMainTop" style="font-family:'黑体'">申请成为技术人员</div>
			<form id="fm">
				<div class="rightMainMiddle" style="font-size: 16px;font-family:'黑体'">
					简单介绍：<input type="text" id="introduce">&nbsp&nbsp比如:为人友善 服务认真 <br /> 擅长方面：<input type="text" id="aspect">&nbsp&nbsp比如:智能手机 生活窍门 <br />
					技术费用：<input type="text" id="price">&nbsp&nbsp比如: 998<br />
				</div>
				<div style="font-size: 18px;font-family:'黑体'" >申请书:</div>
				<div class="rightMainBottom">
					<textarea cols="55" rows="15" id="application"></textarea>
					<br />
					<input type="button" value="提交" id="submit">
				</div>
			</form>
		</div>
	</div>
</body>
</html>
