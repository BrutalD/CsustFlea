<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
String flag=null; 
if(session.getAttribute("logUserTemp")==null)
{ flag = "a";}
else{flag = "b";}
 %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>求购列表</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/pleaseGoods/top.css">
<link rel="stylesheet" type="text/css" href="css/pleaseGoods/middle.css">
<link rel="stylesheet" type="text/css" href="css/pleaseGoods/bottem.css">
<link rel="stylesheet" type="text/css" href="css/index/top.css">
<link rel="shortcut icon" href="img/index/logo.gif">
<link rel="stylesheet" href="extjs/resources/css/ext-all-gray.css"
	type="text/css"></link>
<link rel="stylesheet" type="text/css" href="css/index/blank.css">
<script type="text/javascript" src="extjs/bootstrap.js"></script>
<script type="text/javascript" src="extjs/ext-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/index/logAndReg.js"></script>
<script type="text/javascript" src="js/livingGoods/nav.js"></script>
<script type="text/javascript">
 
 function submit(){
   fm.submit();
 }
 
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
	<div class="bg">
		<div class="layout1">
			<div class="top1">
				<div class="blk3"></div>
				<div class="top3">
					<div class="topid2" onclick="checkrelogin()" id="topid2"
						style="cursor:pointer;color:white;font-family: '黑体'">登录</div>
				</div>
				<div class="top3">
					<div class="topid2" onclick="register()" id="topid2"
						style="cursor:pointer;color:white;font-family: '黑体'">注册</div>
				</div>
				<div class="top3">
					<a href="javascript:void(0);" class="topid2" id="topid2"
						onclick="checklogin()">我的市场</a>
				</div>
				<div class="blk4"></div>
				<div class="top4">
					<a href="page/phoneWeb.jsp" class="topid1" id="topid2">手机客户端</a>
				</div>
				<div class="blk5" style="width:42px;"></div>
				<div class="top4">
					<a href="" class="topid1" id="topid2">梦之站首页</a>
				</div>
				<div class="blk6" style="width:38px;"></div>
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
		<div class="layout2">
			<div class="l1">
				<a href="">长理跳蚤市场</a>><a href="">求购</a>>搜索：<s:property value="key" />
			</div>
			<div class="l2">
				<div class="ll1"></div>
				<form action="ListIndexPGoods_Search.action" method="post" name="fm">
					<div class="ll2">
						<div>
							<div class="lll1">关键字:</div>
							<div>
								<input type="text" style="width:195px;height:31px;" id="lll1" value="iphone" name="key" />
							</div>
							<div class="lll2" onclick="submit()"></div>
							<div class="lll3">
								<a href="ListIndexPGoods_Search.action?key=手机">二手手机</a>&nbsp&nbsp<a href="ListIndexPGoods_Search.action?key=电脑">二手电脑</a>&nbsp&nbsp<a
									href="ListIndexPGoods_Search.action?key=iphone">iphone收购</a>&nbsp&nbsp<a href="ListIndexPGoods_Search.action?key=自行车">二手自行车</a>
							</div>
						</div>
					</div>
				</form>

			</div>

			<div class="l3">
				<div class="ll5">求购</div>
				<div class="ll3"></div>
				<div class="ll4"></div>
			</div>
			<div>
			<div style="margin-top: 5px;"></div>
			<s:iterator value="#request.listtemp" id="dd">
				<ul>
					<li><div class="l4">
					<div style="font-size: 16px;font-family: '黑体';float:left;width:80px;height:45px;"><div style="margin-left: 4px;margin-top:12px;"><s:property value="#dd.pgtime" /></div></div>
					<div style="font-size: 20px;font-family: '黑体';float:left;width:555px;height:45px;"><div style="margin-left: 20px;margin-top:12px;"><a href="ListPGoods_listsinglepgoods.action?id=<s:property value="#dd.id"/>&uid=<s:property value="#dd.uid"/>" style="color:#235A90;"><s:property value="#dd.pgname" /></a></div></div>
					<%-- <div style="font-size: 20px;font-family: '黑体';float:left;width:390px;height:45px; "><div style="margin-left: 8px;margin-top:12px;"><s:property value="#dd.pdescb" /></div></div> --%>
					<div style="font-size: 18px;font-family: '黑体';float:left;width:100px;height:45px; "><div style="margin-left: 8px;margin-top:12px;color:#605E60"><s:property value="#dd.paddress" /></div></div>
					<div style="font-size: 18px;font-family: '黑体';float:left;width:110px;height:45px; "><div style="margin-left: 8px;margin-top:12px;color:red;"><s:property value="#dd.pphonenumber" /></div></div>
					</div>
					</li>
				</ul>
			</s:iterator>	
			</div>
			<div class="l5">
			<s:if test="%{flag == null}">
				<s:a href="ListIndexPGoods_limit.action?page=%{page-1}">上一页</s:a>&nbsp<s:a href="ListIndexPGoods_limit.action?page=1">首页</s:a>&nbsp<s:a href="ListIndexPGoods_limit.action?page=1">1</s:a>&nbsp<s:a
					href="ListIndexPGoods_limit.action?page=2">2</s:a>&nbsp<s:a href="ListIndexPGoods_limit.action?page=3">3</s:a>&nbsp<s:a href="ListIndexPGoods_limit.action?page=4">4</s:a>&nbsp<s:a
					href="ListIndexPGoods_limit.action?page=5">5</s:a>&nbsp<s:a href="ListIndexPGoods_limit.action?page=6">6</s:a> ...&nbsp<s:a href="ListIndexPGoods_limit.action?page=">尾页</s:a>&nbsp<s:a
					href="ListIndexPGoods_limit.action?page=%{page+1}">下一页</s:a>
			</s:if>
			<s:elseif test="%{flag == flag}">
			  <s:a href="ListIndexPGoods_Search.action?page=%{page-1}">上一页</s:a>&nbsp<s:a href="ListIndexPGoods_Search.action?page=1">首页</s:a>&nbsp<s:a href="ListIndexPGoods_Search.action?page=1">1</s:a>&nbsp<s:a
					href="ListIndexPGoods_Search.action?page=2">2</s:a>&nbsp<s:a href="ListIndexPGoods_Search.action?page=3">3</s:a>&nbsp<s:a href="ListIndexPGoods_Search.action?page=4">4</s:a>&nbsp<s:a
					href="ListIndexPGoods_Search.action?page=5">5</s:a>&nbsp<s:a href="ListIndexPGoods_Search.action?page=6">6</s:a> ...&nbsp<s:a href="ListIndexPGoods_Search.action?page=">尾页</s:a>&nbsp<s:a
					href="ListIndexPGoods_Search.action?page=%{page+1}">下一页</s:a>
			</s:elseif>
			</div>
			<div class="l6">共有<s:property value="countAll" />条记录</div>
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
