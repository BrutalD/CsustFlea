<%@ page language="java" import="java.util.*,com.csustflea.model.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%
String flag=null; 
if(session.getAttribute("logUserTemp")==null)
{ flag = "a";response.sendRedirect("page/exit.jsp");}
else{flag = "b";}
 %>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>我的市场</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="shortcut icon" href="img/index/logo.gif">
<link rel="stylesheet" type="text/css" href="css/myMarket/myMarket.css">

<link rel="stylesheet" type="text/css" href="css/myMarket/top.css">

<link rel="stylesheet" type="text/css" href="css/myMarket/bottem.css">

<link rel="stylesheet" type="text/css" href="css/myMarket/middle.css">

<link rel="stylesheet" href="extjs/resources/css/ext-all-gray.css"
	type="text/css"></link>

<script type="text/javascript" src="extjs/bootstrap.js"></script>

<script type="text/javascript" src="extjs/ext-lang-zh_CN.js"></script>

<script type="text/javascript" src="js/livingGoods/nav.js"></script>

<script type="text/javascript" src="js/myMarket/afterOnclick.js"></script>

<script type="text/javascript" src="js/index/logAndReg.js"></script>

<s:url id="smdUrl" namespace="/test" action="BeTechnicistAction" />

<script type="text/javascript">

var flag = "<%= flag %>";
	function checklogin(){
	 if (flag=="a"){
			Ext.Msg.alert('温馨提示','您还没登录，请先登录');  }
	 else {
      window.location.href="myMarket.action";
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
				window.location.href="index.jsp";
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
	 
	
	function checkApp(){
	     changeBg(11);
	     var requestConfig = {
			url :'CheckFlags.action',
			callback : function(options,success,response){
				 if(success){
				 var obj = Ext.JSON.decode(response.responseText);
				 var flag = obj.flag;
				 var appflag = obj.appflag;
				 if(!flag){
				 Ext.Msg.alert('温馨提示','您不是技术人员');
				 }
				 else if(flag == true && appflag == false){
				   Ext.Msg.alert('温馨提示','暂时没有人预约你');
				 }
				 else{
				 
				 }
				}
				else{
				Ext.Msg.alert('温馨提示','请求失败,请重新操作');
				}
			}
		};
		Ext.Ajax.request(requestConfig);
	}
	
</script>

</head>

<body>
	<div id="layout">
		<div id="layout1">
			<div class="top1">
				<div class="blk3"></div>
				<div class="top3">
					<div class="topid2" 
						style="cursor:pointer;color:white;font-family: '黑体'" id="topid2" onclick="checkrelogin()">登录</div>
				</div>
				<div class="top3">
					<div class="topid2" onclick="register()"
						style="cursor:pointer;color:white;font-family: '黑体'" id="topid2">注册</div>
				</div>
				<div class="top3">
					<a href="javascript:void(0)" class="topid2" id="topid2"
						onclick="checklogin()">我的市场</a>
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
						onfocus="if(value='搜索身边的二货') value=''"
						 />
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
			<div class="leftBlank"></div>
			<div class="middleLeft">
				<div class="middleTitle">交易管理</div>
				<div class="leftTop">
					<ul>
						<li id="needBgImg1"><a href="postMessage.action"
							target="middleChangePage" onclick="changeBg(1)">发布信息</a>
						</li>
						<li id="needBgImg2"><a
							href="ListGoodsMan_list.action"
							target="middleChangePage" onclick="changeBg(2)">商品管理</a></li>
						<li id="needBgImg3"><a href="ListPGoods_listpgoods.action"
							target="middleChangePage" onclick="changeBg(3)">求购信息</a>
						</li>
						<li id="needBgImg4"><a
							href="ListCollection_list.action"
							target="middleChangePage" onclick="changeBg(4)">我的收藏</a>
						</li>
					</ul>
				</div>
				<div class="middleTitle">账号管理</div>
				<div class="leftMiddle">
					<ul>
						<li id="needBgImg5"><a
							href="CpUser_list.action"
							target="middleChangePage" onclick="changeBg(5)">基本信息</a>
						</li>
						<li id="needBgImg6"><a
							href="changePassword.action" target="middleChangePage"
							onclick="changeBg(6)">修改密码</a>
						</li>
					</ul>
				</div>
				<div class="middleTitle">信息管理</div>
				<div class="leftDown">
					<ul>
						<li id="needBgImg7"><a href="RemindMe_list.action" target="middleChangePage"
							onclick="changeBg(7)">提到我的</a>
						</li>
						<li id="needBgImg8"><a href="IJoined_list.action" target="middleChangePage"
							onclick="changeBg(8)">我参与的</a>
						</li>
						<li id="needBgImg9"><a href="technicarticle.action" target="middleChangePage"
							onclick="changeBg(9)">技术文章</a>
						</li>
						<li id="needBgImg11"><a href="CheckAppointment_list.action" target="middleChangePage"
							onclick="return checkApp()">查看预约</a>
						</li>
						<li id="needBgImg10"><a href="beTechnicist.action" target="middleChangePage"
							onclick="changeBg(10)">成为技术人员</a>
						</li>
						<li id="needBgImg12"><a href="TechnicistScore_list.action" target="middleChangePage"
							onclick="changeBg(12)">技术人员评分</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="middleChange">
				<iframe src="myMarket1.action" frameborder="0"                       
					width="508px" height="667px" name="middleChangePage"></iframe>
			</div>                 <!-- 这里是先跳到一个action，然后再跳转到页面，不然就会出现那种一个很小的页面的情况，因为这个不像类似的“基本资料”的页面是通过链接来跳转的 -->
			<div class="middleRight">
				<div class="rightTop">
					<div style="height: 25px; line-height: 25px;text-align: center"
						id="topid2">技术文章</div>
					<div class="rightTopMain">
						<ul style="margin-left: 10px" id="topid2">
							<li>1.技术文章之洗洗睡吧</li>
							<li>2.技术文章之洗洗睡吧</li>
							<li>3.技术文章之洗洗睡吧</li>
							<li>4.技术文章之洗洗睡吧</li>
							<li>5.技术文章之洗洗睡吧</li>
						</ul>
					</div>
				</div>
				<div class="rightDown">
					<div style="height: 35px; line-height: 35px;text-align: center"
						id="topid2">提示</div>
					<div class="rightTopMain">
						<ul style="margin-left: 10px" id="topid2">
							<li>1.技术文章之洗洗睡吧</li>
							<li>2.技术文章之洗洗睡吧</li>
							<li>3.技术文章之洗洗睡吧</li>
							<li>4.技术文章之洗洗睡吧</li>
							<li>5.技术文章之洗洗睡吧</li>
						</ul>
					</div>
				</div>
			</div>

		</div>

		<div id="layout3">
			<div class="herf1">
				<div style="width: 100px;height: 15px;"></div>
				<div>
					<table class="herftable1" width="80%" height="80%"
						cellspacing="0px" style="margin-left: 150px;">
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
				<div style="height: 23px;">
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
