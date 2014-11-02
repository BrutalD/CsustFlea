<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<%
	String flag = null;
	if (session.getAttribute("logUserTemp") == null) {
		flag = "a";
	} else {
		flag = "b";
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>电子产品</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<link rel="shortcut icon" href="img/index/logo.gif">
<link rel="stylesheet" type="text/css"
	href="css/livingGoods/livingGoods.css">

<link rel="stylesheet" type="text/css" href="css/livingGoods/bottem.css">

<link rel="stylesheet" type="text/css" href="css/livingGoods/top.css">

<link rel="stylesheet" type="text/css"
	href="css/livingGoods/changePic.css">

<link rel="stylesheet" type="text/css" href="css/livingGoods/middle.css">
<link rel="stylesheet" href="extjs/resources/css/ext-all-gray.css"
	type="text/css"></link>

<script type="text/javascript" src="extjs/bootstrap.js"></script>
<script type="text/javascript" src="extjs/ext-lang-zh_CN.js"></script>

<script type="text/javascript" src="js/phoneWeb/jquery-1.4.2.min.js"></script>

<script type="text/javascript" src="js/livingGoods/nav.js"></script>

<script type="text/javascript" src="js/livingGoods/changePic.js"></script>

<script type="text/javascript" src="js/index/logAndReg.js"></script>

<script type="text/javascript">
	var flag = "<%=flag%>";
	function checklogin() {
		if (flag == "a") {
			Ext.Msg.alert('温馨提示', '您还没登录，请先登录');
		} else {
			window.location.href = "page/myMarket.action";
		}
	}

	function checkrelogin(){
	  if (flag =="b") 
	  {
	    Ext.MessageBox.show({
	     title:'温馨提示',
	     msg:'用户已登录，请点击确定先退出',
	     modal:true,
         fn:callBack,	     
	     buttons:Ext.Msg.YESNO,
	    });
	    function callBack(id){
	     if(id == "yes"){
	     Ext.onReady(function(){
	     var requestConfig = {
			url :'Util.action',
			callback : function(options,success,response){
				 if(success){
				location.reload(); 
				}
				else{
				Ext.Msg.alert('温馨提示','请求失败,请重新操作');
				}
			}
		};
		Ext.Ajax.request(requestConfig);
	    });
	    }
	    }
	    }
	 else {
	   login();
	 }
	}
</script>
</head>

<body>
	<div id="layout">

		<div id="layout1">
			<div class="top1">
				<div class="blk3"></div>
				<div class="top3">
					<div class="topid2" onclick="checkrelogin()"
						style="cursor:pointer;color:white;font-family: '黑体'" id="topid2">登录</div>
				</div>
				<div class="top3">
					<div class="topid2" onclick="register()"
						style="cursor:pointer;color:white;font-family: '黑体'" id="topid2">注册</div>
				</div>
				<div class="top3">
					<div class="topid2" id="topid2" onclick="checklogin()"
						style="cursor:pointer;color:white;font-family: '黑体'">我的市场</div>
				</div>
				<div class="blk4"></div>
				<div class="top4">
					<a href="page/phoneWeb.jsp" class="topid1" id="topid2">手机客户端</a>
				</div>
				<div class="blk5"></div>
				<div class="top4">
					<a href="" class="topid1" id="topid2">梦之站首页</a>
				</div>
				<div class="blk6"></div>
				<div class="top4">
					<a href="index.jsp" class="topid1" id="topid2">市场首页</a>
				</div>
			</div>
			<div class="top2">
				<div class="blk7"></div>

				<div class="topsearch1">
					<form action="searchGoods_limit.action" method="post">
						<div class="searchpic">
							<img src="img/index/searchpic.gif" />
						</div>
						<div style="float:left;">
							<input type="text" value="搜索身边的二货 " name="key"
								style="color:gray;width:236px;height:33px;line-height:30px;"
								onfocus="if(value='搜索身边的二货') value=''" />
						</div>
						<div style="float: left;width:78px;height:33px;">
							<input type="submit" value=''
								style="background-image: url('img/index/search.gif');width: 78px;height: 33px;padding: 0px;border: 0px;" />
						</div>
					</form>
				</div>
			</div>
			<div class="nav1">
				<div style="width:156px;height:43px;float: left;"></div>
				<div id="nav11" class="select"
					style="float:left;height:43px;width:73px;line-height: 35px;margin-left:14px;margin-top:5px;"
					onmouseover="change(this,'nav11');">
					<a href="getGoods_livingGoods.action?key=生活用品&flag=livingGoods" class="navherf" id="topid2">生活用品</a>
				</div>
				<div id="nav3" onmouseover="change(this,'nav3');"
					class="nonselected">
					<a href="getGoods_sportEquipment.action?key=运动装备 &flag=sportEquipment" class="navherf" id="topid2">运动装备</a>
				</div>
				<div id="nav4" onmouseover="change(this,'nav4');"
					class="nonselected">
					<a href="getGoods_electronicProduct.action?key=电子产品 &flag=electronicProduct" class="navherf" id="topid2">电子产品</a>
				</div>
				<div id="nav5" onmouseover="change(this,'nav5');"
					class="nonselected">
					<a href="getGoods_traficTools.action?key=交通工具 &flag=traficTools" class="navherf" id="topid2">交通工具</a>
				</div>
				<div id="nav6" onmouseover="change(this,'nav6');"
					class="nonselected">
					<a href="getGoods_bookMaterial.action?key=书籍资料 &flag=bookMaterial" class="navherf" id="topid2">书籍资料</a>
				</div>
				<div id="nav7" onmouseover="change(this,'nav7');"
					class="nonselected">
					<a href="ListIndexPGoods_limit.action" class="navherf" id="topid2">求购</a>
				</div>
				<div id="nav8" onmouseover="change(this,'nav8');"
					class="nonselected">
					<a href="getGoods_clothAndBags.action?key=服装箱包 &flag=clothAndBags" class="navherf" id="topid2">服装箱包</a>
				</div>
				<div id="nav9" onmouseover="change(this,'nav9');"
					class="nonselected">
					<a href="repairPrefecture_list.action" class="navherf" id="topid2">维修专区</a>
				</div>
			</div>
		</div>


		<div id="layout2">
			<div class="player">
				<div id="icon_left"></div>
				<div id="icon_right"></div>
				<div>
					<ul class="clearfix">
						<li class="p1"><img src="img/phoneWeb/changePic1.gif" />
						</li>
						<li class="p2"><img src="img/phoneWeb/changePic2.gif" />
						</li>
						<li class="p3"><img src="img/phoneWeb/changePic3.gif" />
						</li>
					</ul>
				</div>
			</div>
		</div>






		<div id="layout3">

			<div class="middleTop"></div>

			<div class="middleBlank"></div>
			<div class="middleLeft">
				<div class="middleLeftMain">
					<s:iterator value="#request.livinggoods" id="dd">
						<ul>
							<li><div>
									<a
										href="getGoods_getGoodsById.action?goodsId=<s:property value='#dd.id' />"><img
										src='<s:property value="#dd.gpic" />'> </a>
								</div>
								<div style="margin-left: 20px;width:166px;height:27px;"><div style="width:100px;height:27px;font-size: 16px;font-family: '黑体';float: left;padding-left: 4px;color: #603914"><s:property value="#dd.gname" /></div><div style="color:CA0001;float: left;font-size: 16px;font-family: '黑体';"><s:property value="#dd.gprice" /></div></div>
							</li>
						</ul>
					</s:iterator>
				</div>
				<div class="middleLeftChangePage">
					<s:if test="%{page<=1}">第一页</s:if>
					<s:else>
						<s:a href="getGoods_electronicProduct.action?page=%{page-1}">上一页</s:a>
					</s:else>
					&nbsp;&nbsp; 第
					<s:property value="%{page}" />
					页&nbsp;共
					<s:property value="%{pageCount}" />
					页&nbsp;&nbsp;
					<s:if test="%{pageCount<=page}">最后页
				</s:if>
					<s:else>
						<s:a href="getGoods_electronicProduct.action?page=%{page+1}">下一页</s:a>
					</s:else>
				</div>
			</div>

			<div class="middleRight">
				<div class="rightTop">
					<div class="titleBlank"></div>
					<div class="rightTitle" id="topid2">
						评论排行版<br /> <img src="img/livingGoods/line.jpg">
					</div>
					<div class="rightUpMain">
					<% int i =1;%>
						<ul>
						<s:iterator value="#request.billboardGoods" id="dd" status="st">
						<s:if test="#st.index <= 2">
						
							<li class="first3"><div class="sortNum" id="topid2"><%= i %>.</div>
								<a href="getGoods_getGoodsById.action?goodsId=<s:property value='#dd.id' />"><img src="<s:property value="#dd.gpic" />"> </a></li>
								<% i++;%>
						</s:if>	
							<s:else>
							<li class="remain7"><div class="sortNum" id="topid2">
									<%= i %>.<a href="getGoods_getGoodsById.action?goodsId=<s:property value='#dd.id' />" id="topid2"><s:property value="#dd.gname" /></a>
								</div></li>
								<% i++;%>
								</s:else>
							</s:iterator>
						</ul>
					</div>
				</div>
				<div class="rightDown">
					<div class="titleBlank"></div>
					<div class="rightTitle">
						技术文章<br /> <img src="img/livingGoods/line.jpg">
					</div>
					<div class="Tarticle">
						<ul>
						<s:iterator value="#request.billboardArticles" id="dd" status="st">
						<s:if test="#st.index < 5">
							<li><a href="repairPrefecture_sarticle.action?articleid=<s:property value='#dd.id' />&uid=<s:property value="#dd.uid"/>" id="topid2"><s:property value="#dd.title" /></a></li>
							</s:if>
							</s:iterator>
						</ul>
					</div>
				</div>

			</div>


		</div>







		<div id="layout4">
			<div class="herf1">
				<div style="width: 100px;height: 15px;"></div>
				<div>
					<table class="herftable1" width="80%" height="80%"
						cellspacing="0px" style="margin-left: 150px;">
						<tr>
							<td width="8%"><a href="">中关村</a></td>
							<td width="10%"><a href="">拉手网</a></td>
							<td width="10%"><a href="">58同城</a></td>
							<td width="10%"><a href="">新浪NBA</a></td>
							<td width="10%"><a href="">赶集网</a></td>
							<td width="10%"><a href="">二手市场</a></td>
							<td width="10%"><a href="">二手车</a></td>
							<td width="10%"><a href="">二手房</a></td>
							<td width="8%"><a href="">加油网</a></td>
							<td><a href="">北京</a></td>
						</tr>
						<tr>
							<td width="8%"><a href="">中关村</a></td>
							<td width="10%"><a href="">拉手网</a></td>
							<td width="10%"><a href="">58同城</a></td>
							<td width="10%"><a href="">新浪NBA</a></td>
							<td width="10%"><a href="">赶集网</a></td>
							<td width="10%"><a href="">二手市场</a></td>
							<td width="10%"><a href="">二手车</a></td>
							<td width="10%"><a href="">二手房</a></td>
							<td width="8%"><a href="">加油网</a></td>
							<td><a href="">北京</a></td>
						</tr>
						<tr>
							<td width="8%"><a href="">中关村</a></td>
							<td width="10%"><a href="">拉手网</a></td>
							<td width="10%"><a href="">58同城</a></td>
							<td width="10%"><a href="">新浪NBA</a></td>
							<td width="10%"><a href="">赶集网</a></td>
							<td width="10%"><a href="">二手市场</a></td>
							<td width="10%"><a href="">二手车</a></td>
							<td width="10%"><a href="">二手房</a></td>
							<td width="8%"><a href="">加油网</a></td>
							<td><a href="">北京</a></td>
						</tr>
						<tr>
							<td width="8%"><a href="">中关村</a></td>
							<td width="10%"><a href="">拉手网</a></td>
							<td width="10%"><a href="">58同城</a></td>
							<td width="10%"><a href="">新浪NBA</a></td>
							<td width="10%"><a href="">赶集网</a></td>
							<td width="10%"><a href="">二手市场</a></td>
							<td width="10%"><a href="">二手车</a></td>
							<td width="10%"><a href="">二手房</a></td>
							<td width="8%"><a href="">加油网</a></td>
							<td><a href="">北京</a></td>
						</tr>
						<tr>
							<td width="8%"><a href="">中关村</a></td>
							<td width="10%"><a href="">拉手网</a></td>
							<td width="10%"><a href="">58同城</a></td>
							<td width="10%"><a href="">新浪NBA</a></td>
							<td width="10%"><a href="">赶集网</a></td>
							<td width="10%"><a href="">二手市场</a></td>
							<td width="10%"><a href="">二手车</a></td>
							<td width="10%"><a href="">二手房</a></td>
							<td width="8%"><a href="">加油网</a></td>
							<td><a href="">北京</a></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="cpy1">
				<div style="height: 20px;">
					<div style="width:350px;height: 15px;float: left;"></div>
					<div style="float: left;" class="cpy2">CopyRight © 2013 &nbsp
						梦之站 &nbsp All Right Reserved</div>
				</div>
				<div style="height: 23px;">
					<div style="width:400px;height: 15px;float: left;"></div>
					<div style="float: left;" class="cpy3">
						长理跳蚤市场 &nbsp 版权所有 &nbsp <a href="" style="color: white;">联系我们</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
