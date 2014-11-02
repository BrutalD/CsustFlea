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
<script type="text/javascript">
	function subpic() {
		var doc1 = document.getElementById("doc1").value;
		var doc2 = document.getElementById("doc2").value;
		var doc3 = document.getElementById("doc3").value;
		if (doc1 == "" && doc2 == "" && doc3 == "") {
			Ext.Msg.alert('温馨提示', '你没有选择图片，请重新选择');
		} else if (doc1 != "" && doc2 == "" && doc3 == "") {
			appendChild(1, 0, 0);
		} else if (doc1 == "" && doc2 != "" && doc3 == "") {
			appendChild(0, 1, 0);
		}
		else if (doc1 == "" && doc2 == "" && doc3 != "") {
			appendChild(0, 0, 1);
		}
		else if (doc1 != "" && doc2 != "" && doc3 == "") {
			appendChild(1, 1, 0);
		}
		else if (doc1 != "" && doc2 == "" && doc3 != "") {
			appendChild(1, 0, 1);
		}
		else if (doc1 == "" && doc2 != "" && doc3 != "") {
			appendChild(0, 1, 1);
		}
		else if (doc1 != "" && doc2 != "" && doc3 != "") {
			appendChild(1, 1, 1);
		}
	}

	function appendChild(flag1, flag2, flag3) {
		var myForm = document.getElementById("form1");
		var myInput1 = document.createElement("input");
		var myInput2 = document.createElement("input");
		var myInput3 = document.createElement("input");
		myInput1.setAttribute("name", "flag1");
		myInput2.setAttribute("name", "flag2");
		myInput3.setAttribute("name", "flag3");
		myInput1.setAttribute("value", flag1);
		myInput2.setAttribute("value", flag2);
		myInput3.setAttribute("value", flag3);
		document.getElementById("util").appendChild(myInput1);
		document.getElementById("util").appendChild(myInput2);
		document.getElementById("util").appendChild(myInput3);
		myForm.submit();
	}
</script>

</head>



<body>
	<div class="mainPageLayout">
		<div style="height:520px">
			<div class="postBlank"></div>
			<s:form action="PostGoods_ifo.action" method="post">
				<div class="selectSort">
					<div class="inputBlank1">
						<span style="font-size: 20px; line-height: 30px;">选择类目:</span><select name="goods.gtype">
							<option >生活用品</option>
							<option>运动装备</option>
							<option>电子产品</option>
							<option>交通工具</option>
							<option>书籍资料</option>
							<option>服装箱包</option>
						</select><br /> <span
							style="font-size: 20px; line-height: 30px;">商品名称:</span><input
							type="text" id="gname" name="goods.gname" value="<s:property value="#attr.listgoodsinfo.gname"/>"><br /> <span
							style="font-size: 20px; line-height: 30px;">商品价格:</span><input
							type="text" id="gprice" name="goods.gprice" value="<s:property value="#attr.listgoodsinfo.gprice"/>"><br/>
					</div>
				</div>
				<div class="messageDes">
					<div class="inputBlank2">
						<span style="font-size: 25px; line-height: 30px;">商品描述</span><br />
						<textarea cols="50" rows="8"
							style="resize:none; margin-left: 10px;" id="gdescb" name="goods.gdescb"><s:property value="#attr.listgoodsinfo.gname"/></textarea>
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
			enctype="multipart/form-data" id="form1">
			<div style="width:508px;">
				<div style="float:left;">
					<s:file name="doc1" id="doc1"
						style="width:68px;margin-left:40px;float:left;margin-top:20px;"></s:file>
				</div>
				<div style="float:left;">
					<s:file name="doc2" id="doc2"
						style="width:68px;margin-left:230px;float:left;margin-top:-28px;"></s:file>
				</div>
				<div style="float:left;">
					<s:file name="doc3" id="doc3"
						style="width:68px;margin-left:380px;float:left;margin-top:-32px;"></s:file>
				</div>
			</div>
			<div style="width: 508px; text-align: center;margin-top: 10px;">
				<input type="button" value="提交图片" onclick="subpic()">
			</div>
			<div id="util" style="display: none;"></div>
		</s:form>
	</div>
</body>
</html>
