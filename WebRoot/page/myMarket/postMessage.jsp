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
	href="css/myMarket/iframe/postMessage.css">
<link rel="stylesheet" href="extjs/resources/css/ext-all-gray.css"
	type="text/css"></link>

<script type="text/javascript" src="extjs/bootstrap.js"></script>
<script type="text/javascript" src="extjs/ext-lang-zh_CN.js"></script>
</head>
<script type="text/javascript">
    var reg = /^(-|\+)?\d+$/ ;   /* 判断是否为整数的正则表达式 */
	var flag = null;

	function setflag() {
        var gname = document.getElementById("gname").value;
        var gprice = document.getElementById("gprice").value;
        var gdescb = document.getElementById("gdescb").value;
        if(gname.length == 0  ||  gprice.length == 0  || gdescb.length ==  0)
        {
            Ext.Msg.alert('温馨提示','您有信息没填写完整,然后点击提交信息按钮!');        
        } 
        else if(!reg.test(gprice)){
            Ext.Msg.alert('温馨提示','商品价格必须是数字，请重新填写'); 
        }
		else{flag = 1;document.getElementById("form1").submit();}
	};
   
	function checkflag() {
	var gname = document.getElementById("gname").value;
        var gprice = document.getElementById("gprice").value;
        var gdescb = document.getElementById("gdescb").value;
		if (flag == null && gname.length == 0  ||  gprice.length == 0  || gdescb.length ==  0) {
			Ext.Msg.alert('温馨提示', '请先将物品的信息填写完整');
		}
		else if(!reg.test(gprice)){
		    Ext.Msg.alert('温馨提示','商品价格必须是数字，请重新填写'); 
		}
		else{
		   Ext.Msg.alert('温馨提示', '请先点击上方的提交信息按钮');
		}
	}
</script>


<body>
	<div class="mainPageLayout">
		<div style="height:520px">
			<div class="postBlank"></div>
			<s:form action="PostGoods_ifo.action" method="post" id="form1">
				<div class="selectSort">
					<div class="inputBlank1">
						<span style="font-size: 20px; line-height: 30px;">选择类目:</span><select name="goods.gtype">
							<option >生活用品</option>
							<option>运动装备</option>
							<option>电子产品</option>
							<option>交通工具</option>
							<option>书籍资料</option>
							<option>服装箱包</option>
						</select><input type="button" value="提交信息" style="margin-left: 150px;"
							onclick="setflag()" /><br /> <span
							style="font-size: 20px; line-height: 30px;">商品名称:</span><input
							type="text" id="gname" name="goods.gname" ><br /> <span
							style="font-size: 20px; line-height: 30px;">商品价格:</span><input
							type="text" id="gprice" name="goods.gprice"><br/>
					</div>
				</div>
				<div class="messageDes">
					<div class="inputBlank2">
						<span style="font-size: 25px; line-height: 30px;">商品描述</span><br />
						<textarea cols="50" rows="8"
							style="resize:none; margin-left: 10px;" id="gdescb" name="goods.gdescb"></textarea>
					</div>
				</div>
			</s:form>
			<div class="showMessagePic">
				<div class="inputBlank3">
					<span style="font-size: 25px; line-height: 30px;">图片展示</span><br />
					<div style="float: left;">
						<img src="img/myMarket/postThing.gif">
					</div>
					<div style="float: left;">
						<img src="img/myMarket/postThing.gif">
					</div>
					<div style="float: left;">
						<img src="img/myMarket/postThing.gif">
					</div>
				</div>
			</div>
		</div>

		<s:form action="PostGoods_pics.action" method="post"
			enctype="multipart/form-data">
			<div style="width:508px;">
				<div style="float:left;">
					<s:file name="doc"
						style="width:68px;margin-left:40px;float:left;margin-top:20px;"></s:file>
				</div>
				<div style="float:left;">
					<s:file name="doc"
						style="width:68px;margin-left:230px;float:left;margin-top:-28px;"></s:file>
				</div>
				<div style="float:left;">
					<s:file name="doc" 
						style="width:68px;margin-left:380px;float:left;margin-top:-32px;"></s:file>
				</div>
			</div>
			<div style="width: 508px; text-align: center;margin-top: 10px;">
				<input type="button" value="提交图片" onclick="checkflag()">
			</div>
		</s:form>
	</div>
</body>
</html>
