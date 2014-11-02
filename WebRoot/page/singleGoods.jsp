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

<title>单件物品</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="shortcut icon" href="img/index/logo.gif">
<link rel="stylesheet" type="text/css"
	href="css/singleGoods/singleGoods.css">
<link rel="stylesheet" type="text/css" href="css/singleGoods/bottem.css">
<link rel="stylesheet" type="text/css" href="css/singleGoods/middle.css">
<link rel="stylesheet" type="text/css" href="css/singleGoods/top.css">
<link rel="stylesheet" href="extjs/resources/css/ext-all-gray.css"
	type="text/css"></link>
<script type="text/javascript" src="extjs/bootstrap.js"></script>
<script type="text/javascript" src="extjs/ext-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/index/logAndReg.js"></script>
<script type="text/javascript" src="js/livingGoods/nav.js"></script>

</head>
<script type="text/javascript" src="js/singleGoods/changeLargePic.js"></script>
<script type="text/javascript">
var flag = "<%=flag%>";
	function checkcollection() {
		if (flag == "a") {
			Ext.Msg.alert('温馨提示', '您还没登录，请先登录');
		} else {
			Ext.onReady(function() {
				var requestConfig = {
					url : 'ListCollection_SaveCGoods.action',
					params : {
						'collection.gid' : <s:property value='singleGoods.id' />,
					},
					callback : function(options, success, response) {
						if (success) {
							Ext.Msg.alert('温馨提示', '收藏成功,可以到我的市场中查看');
						} else {
							Ext.Msg.alert('温馨提示', '收藏失败,请重新操作');
						}
					}
				};
				Ext.Ajax.request(requestConfig);
			});
		}
	}

	function checklogin() {
		if (flag == "a") {
			Ext.Msg.alert('温馨提示', '您还没登录，请先登录');
		} else {
			window.location.href = "myMarket.action";
		}
	}

	function checkrelogin() {
		if (flag == "b") {
			Ext.MessageBox.show({
				title : '温馨提示',
				msg : '用户已登录，请点击确定先退出',
				modal : true,
				fn : callBack,
				buttons : Ext.Msg.YESNO,
			});
			function callBack(id) {
				if (id == "yes") {
					Ext.onReady(function() {
						var requestConfig = {
							url : 'Util.action',
							callback : function(options, success, response) {
								if (success) {
									location.reload();
								} else {
									Ext.Msg.alert('温馨提示', '请求失败,请重新操作');
								}
							}
						};
						Ext.Ajax.request(requestConfig);
					});
				}
			}
		} else {
			login();
		}
	}

	function postcomments() {
		if (flag == "a") {
			Ext.Msg.alert('温馨提示', '您还没登录，请先登录');
		} else {
			fm.submit();
		}
	}
</script>

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
				<div class="top41">
					<a href="page/phoneWeb.jsp" class="topid1" id="topid2">手机客户端</a>
				</div>
				<div class="blk5"></div>
				<div class="top42">
					<a href="" class="topid1" id="topid2">梦之站首页</a>
				</div>
				<div class="blk6"></div>
				<div class="top43">
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
					<a href="getGoods_livingGoods.action?key=生活用品&flag=livingGoods"
						class="navherf" id="topid2">生活用品</a>
				</div>
				<div id="nav3" onmouseover="change(this,'nav3');"
					class="nonselected">
					<a
						href="getGoods_sportEquipment.action?key=运动装备 &flag=sportEquipment"
						class="navherf" id="topid2">运动装备</a>
				</div>
				<div id="nav4" onmouseover="change(this,'nav4');"
					class="nonselected">
					<a
						href="getGoods_electronicProduct.action?key=电子产品 &flag=electronicProduct"
						class="navherf" id="topid2">电子产品</a>
				</div>
				<div id="nav5" onmouseover="change(this,'nav5');"
					class="nonselected">
					<a href="getGoods_traficTools.action?key=交通工具 &flag=traficTools"
						class="navherf" id="topid2">交通工具</a>
				</div>
				<div id="nav6" onmouseover="change(this,'nav6');"
					class="nonselected">
					<a href="getGoods_bookMaterial.action?key=书籍资料 &flag=bookMaterial"
						class="navherf" id="topid2">书籍资料</a>
				</div>
				<div id="nav7" onmouseover="change(this,'nav7');"
					class="nonselected">
					<a href="ListIndexPGoods_limit.action" class="navherf" id="topid2">求购</a>
				</div>
				<div id="nav8" onmouseover="change(this,'nav8');"
					class="nonselected">
					<a href="getGoods_clothAndBags.action?key=服装箱包 &flag=clothAndBags"
						class="navherf" id="topid2">服装箱包</a>
				</div>
				<div id="nav9" onmouseover="change(this,'nav9');"
					class="nonselected">
					<a href="repairPrefecture_list.action" class="navherf" id="topid2">维修专区</a>
				</div>
			</div>
		</div>

		<div id="layout2">
			<div class="layout21">
				<div class="topLeftBlank"></div>
				<div class="topMain">
					<div class="topMainTitle">
						<font size="5" color="#225A92">商品名称:</font><font size="5"><s:property
								value='singleGoods.gname' /> </font>
					</div>
					<div class="topMainLeft">
						<div class="large">
							<img src="<s:property value='singleGoods.gpic'/>" id="largePic">
						</div>
						<div class="small">
							<img src="<s:property value='singleGoods.gpic'/>"
								onmouseover="changeThingPic(this)">
							<s:if test="singleGoods.gpic2!=null">
								<img src="<s:property value='singleGoods.gpic2'/>"
									onmouseover="changeThingPic(this)">
							</s:if>
							<s:else>
								<img src="img/singleGoods/listGoods3.gif"
									onmouseover="changeThingPic(this)">
							</s:else>

							<s:if test="singleGoods.gpic3!=null">
								<img src="<s:property value='singleGoods.gpic3'/>"
									onmouseover="changeThingPic(this)">
							</s:if>
							<s:else>
								<img src="img/singleGoods/listGoods3.gif"
									onmouseover="changeThingPic(this)">
							</s:else>
						</div>

					</div>
					<div class="topMainRight">
						<div>
							<form>
								<ul>
									<li><div
											style="float:left;font-size: 16px;font-family: '黑体';">商品类别:</div>
										<div class="listLine"
											style="font-size: 14px;font-family: '黑体';">
											<s:property value='singleGoods.gtype' />
										</div>
									</li>
									<li><div
											style="float:left;font-size: 16px;font-family: '黑体';margin-left: 32px;">价格:</div>
										<div class="listLine"
											style="font-size: 16px;font-family: '黑体';">
											<s:property value='singleGoods.gprice' />
										</div>
									</li>
									<li><div
											style="float:left;font-size: 16px;font-family: '黑体';margin-left:16px; ">发布人:</div>
										<div class="listLine"
											style="font-size: 16px;font-family: '黑体';">
											<s:property value='uname' />
										</div>
									</li>
									<li><div
											style="float:left;font-size: 16px;font-family: '黑体';">发布时间:</div>
										<div class="listLine"
											style="font-size: 16px;font-family: '黑体';">
											<s:property value="singleGoods.gdate" />
										</div>
									</li>
									<li>
										<div style="float: left;">

											<div style="font-size: 16px;font-family: '黑体';">商品描述:</div>
											<div style="margin-top: 148px;">
												<a href="javascript:void(0)"
													style="color:black;font-size: 18px;font-family: '黑体';"
													onclick="checkcollection()">收藏</a>
											</div>
										</div>
										<div class="listLine2"
											style="font-size: 16px;font-family: '黑体';float: left;">
											<s:property value='singleGoods.gdescb' />
										</div></li>
								</ul>
							</form>
						</div>

					</div>
				</div>
			</div>
			<div class="layout22">
				<div>
					<center>
						<img src="img/singleGoods/middleLine.gif">
					</center>
				</div>
				<div class="topLeftBlank"></div>
				<div class="bottomMain">
					<div class="leaveMessage">
						<div style="height:30px;">
							<font color="#225A92" size="5">留言</font>
						</div>
						<div class="leaveMsMain">
							<form action="PostGoodsComments_save.action" method="post"
								id="fm">
								<div style="background-color: #F3F1ED;">
									<s:textarea
										style="resize: none; border:0px;background-color: #F3F1ED;  overflow-x:hidden; overflow-y:hidden;height:100px; width:903px;"
										name="ucomment"></s:textarea>
									<input type="text" name="gid" style="display:none"
										value="<s:property value='singleGoods.id' />" /> <input
										type="text" name="gname" style="display:none"
										value="<s:property value='singleGoods.gname' />" /> <input
										type="text" name="gprice" style="display:none"
										value="<s:property value='singleGoods.gprice' />" /> <input
										type="text" name="gdate" style="display:none"
										value="<s:property value='singleGoods.gdate' />" /> <input
										type="text" name="gtype" style="display:none"
										value="<s:property value='singleGoods.gtype' />" />
								</div>
								<div style="margin-left: 855px;">
									<input type="button" value="发表" onclick="postcomments()">
								</div>
							</form>
						</div>
					</div>
					<div class="showMessage" style="font-family: '黑体';">


						<s:iterator value="gac" id="dd">
							<div class="line1"></div>
							<!-- <img src="../img/singleGoods/singleGoods_bg1.gif" style="height:2px;width:904px;" /> -->
							<s:iterator value="dd" id="aa">
								<div class="line2">

									<span> <span style="font-size: 20px;margin-left: 25px;">
											<s:property value="#aa.uname" /> : </span> <span
										style="color:#2C5E92;font-size: 16px;line-height: 24px;">
											<s:property value="#aa.ucomment" /> </span> </span> <br> <span>
										<span
										style="font-size:20px;margin-left: 55px;line-height: 28px;">
											<s:property value="#aa.guname" /> </span> <span
										style="color:#2C5E92;font-size: 20px;margin-left: 5px;">&nbsp&nbsp回复&nbsp&nbsp</span>
										<span
										style="font-size: 20px;margin-left: 5px;line-height: 28px;">
											<s:property value="#aa.uname" /> </span> <span
										style="color:#2C5E92;font-size: 16px;margin-left: 15px;line-height: 28px;">
											<s:property value="#aa.gucomment" /> </span> </span> <br>

								</div>

							</s:iterator>

						</s:iterator>

					</div>

				</div>
			</div>
		</div>

		<div id="layout3">
			<div class="herf1">
				<div style="width: 100px;height: 15px;"></div>
				<div>
					<table class="herftable1" width="80%" height="80%"
						cellspacing="0px" style="margin-left: 150px;font-size: 12px;">
						<tr>
							<td width="8%"><a href="">中关村</a>
							</td>
							<td width="10%"><a href="">拉手网</a>
							</td>
							<td width="10%"><a href="">58同城</a>
							</td>
							<td width="10%"><a href="">新浪NBA</a>
							</td>
							<td width="10%"><a href="">赶集网</a>
							</td>
							<td width="10%"><a href="">二手市场</a>
							</td>
							<td width="10%"><a href="">二手车</a>
							</td>
							<td width="10%"><a href="">二手房</a>
							</td>
							<td width="8%"><a href="">加油网</a>
							</td>
							<td><a href="">北京</a>
							</td>
						</tr>
						<tr>
							<td width="8%"><a href="">中关村</a>
							</td>
							<td width="10%"><a href="">拉手网</a>
							</td>
							<td width="10%"><a href="">58同城</a>
							</td>
							<td width="10%"><a href="">新浪NBA</a>
							</td>
							<td width="10%"><a href="">赶集网</a>
							</td>
							<td width="10%"><a href="">二手市场</a>
							</td>
							<td width="10%"><a href="">二手车</a>
							</td>
							<td width="10%"><a href="">二手房</a>
							</td>
							<td width="8%"><a href="">加油网</a>
							</td>
							<td><a href="">北京</a>
							</td>
						</tr>
						<tr>
							<td width="8%"><a href="">中关村</a>
							</td>
							<td width="10%"><a href="">拉手网</a>
							</td>
							<td width="10%"><a href="">58同城</a>
							</td>
							<td width="10%"><a href="">新浪NBA</a>
							</td>
							<td width="10%"><a href="">赶集网</a>
							</td>
							<td width="10%"><a href="">二手市场</a>
							</td>
							<td width="10%"><a href="">二手车</a>
							</td>
							<td width="10%"><a href="">二手房</a>
							</td>
							<td width="8%"><a href="">加油网</a>
							</td>
							<td><a href="">北京</a>
							</td>
						</tr>
						<tr>
							<td width="8%"><a href="">中关村</a>
							</td>
							<td width="10%"><a href="">拉手网</a>
							</td>
							<td width="10%"><a href="">58同城</a>
							</td>
							<td width="10%"><a href="">新浪NBA</a>
							</td>
							<td width="10%"><a href="">赶集网</a>
							</td>
							<td width="10%"><a href="">二手市场</a>
							</td>
							<td width="10%"><a href="">二手车</a>
							</td>
							<td width="10%"><a href="">二手房</a>
							</td>
							<td width="8%"><a href="">加油网</a>
							</td>
							<td><a href="">北京</a>
							</td>
						</tr>
						<tr>
							<td width="8%"><a href="">中关村</a>
							</td>
							<td width="10%"><a href="">拉手网</a>
							</td>
							<td width="10%"><a href="">58同城</a>
							</td>
							<td width="10%"><a href="">新浪NBA</a>
							</td>
							<td width="10%"><a href="">赶集网</a>
							</td>
							<td width="10%"><a href="">二手市场</a>
							</td>
							<td width="10%"><a href="">二手车</a>
							</td>
							<td width="10%"><a href="">二手房</a>
							</td>
							<td width="8%"><a href="">加油网</a>
							</td>
							<td><a href="">北京</a>
							</td>
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
