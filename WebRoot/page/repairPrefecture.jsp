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

<title>维修专区</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="shortcut icon" href="img/index/logo.gif">
<link rel="stylesheet" type="text/css"
	href="css/repairPrefecture/top.css">
<link rel="stylesheet" type="text/css"
	href="css/repairPrefecture/middle.css">
<link rel="stylesheet" type="text/css"
	href="css/repairPrefecture/bottem.css">
<link rel="stylesheet" type="text/css" href="css/index/top.css">
<link rel="stylesheet" href="extjs/resources/css/ext-all-gray.css"
	type="text/css"></link>
<link rel="stylesheet" type="text/css" href="css/index/blank.css">
<script type="text/javascript" src="extjs/bootstrap.js"></script>
<script type="text/javascript" src="extjs/ext-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/index/logAndReg.js"></script>
<script type="text/javascript" src="js/livingGoods/nav.js"></script>
<script type="text/javascript">
var flag = "<%= flag %>";
function checklogin(){
	 if (flag=="a"){
			Ext.Msg.alert('温馨提示','您还没登录，请先登录');  }
	 else {
      window.location.href="myMarket.action";
	}
	}
	
function checklogin1(tid){
    if (flag=="a"){
			Ext.Msg.alert('温馨提示','您还没登录，请先登录');  }
	 else {
	   Ext.onReady(function(){
	     var requestConfig = {
			url :'PostTecScore_smd.action',
			params:{
			  'tid' : tid ,
			},
			callback : function(options,success,response){
				 if(success){
				  var obj = Ext.JSON.decode(response.responseText);
				  flag = obj.flag;
				  if(flag){
				   Ext.Msg.alert('温馨提示','预约成功，维修人员会主动和你联系');
				   }
				   else{
				   Ext.Msg.alert('温馨提示','请先填写好联系方式，方便维修人员联系');
				   }
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
					<a href="javascript:void(0)" class="topid2" id="topid2"
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
				<div class="article1"></div>
				<s:iterator value="#request.article" id="dd">
				<div class="article2">
				
					<div class="article3">
						<div class="articleimg">
							<img src="<s:property value="#dd.uimg"/>" />
						</div>
						<div class="articlewords">
							<div class="articleperson">
								<div class="articleperson1"><a href="repairPrefecture_singleperson.action?singleuid=<s:property value="#dd.uid"/>" style="color:black;"><s:property value="#dd.uname" /></a></div>
							</div>
							<div class="articletype">(技术达人)</div>
							<div style="clear: both;">
								<div class="articletitle">
									<div class="articletitle1"><a href="repairPrefecture_sarticle.action?articleid=<s:property value='#dd.id' />&uid=<s:property value="#dd.uid"/>" style="color:black;"><s:property value="#dd.title"/></a></div>
								</div>
								<div class="articletitle2"><s:property value="#dd.adate"/></div>
							</div>
						</div>
						<div class="articlebody">&nbsp&nbsp&nbsp&nbsp&nbsp<s:property value="#dd.content"/></div>
						<div class="articleother">
							<div class="articleother1">已阅(5708)</div>
						</div>
					</div>
					

				</div>
				</s:iterator>
				<div style="margin-left: 265px;margin-top: 10px;"><s:a href="repairPrefecture_list.action?page=%{page-1}" style="font-size: 14px;font-family:'黑体';color: black;">上一页</s:a>&nbsp&nbsp&nbsp<s:a href="repairPrefecture_list.action?page=%{page+1}" style="font-size: 14px;font-family:'黑体';color: black;">下一页</s:a> </div>
             

				
			</div>
			<div class="l3"></div>
			<div class="l2">
				<div class="repairman1"></div>
				<s:iterator value="#request.technician" id="dd">
			   <div class="repairmanbody">
					<div style="height:8px;width:322px;"></div>
					<div class="repairtop">
						<div class="repairimg">
							<img src="<s:property value="#dd.timg" />" />
						</div>
						<div class="repairtopword">
							<div class="repairtopword1"><a href="repairPrefecture_singleperson.action?singleuid=<s:property value="#dd.uid"/>" style="color:black;font-size: 16px;font-family:'黑体';"><s:property value="#dd.tname" /></a></div>
                            <div class="repairtopword2">
                              <div class="repairtopword3">
                                <div style="float: left;font-size: 14px;font-family:'黑体';color: #49739E;">&nbsp评分:</div>
                                <div style="float: left;font-size: 14px;font-family:'黑体';width:73px;">&nbsp<s:property value="#dd.score" /></div>
                                <div style="float: left;font-size: 14px;font-family:'黑体';color: #49739E;">维修范围:</div>
                              </div>
                              <div style="margin-top: 20px;width:209px;height:38px;">
                              <div class="repairtopword4">
                                <div style="width:115px;height:21px;">
                                  <div style="float: left;font-size: 14px;font-family:'黑体';color: #49739E;">&nbsp维修数目:</div>
                                  <div style="float: left;font-size: 14px;font-family:'黑体';width:42px;">&nbsp<s:property value="#dd.tcount" /></div>
                                </div>
                                <div class="repairtopword5" style="clear: both;">
                                  <div style="float: left;font-size: 14px;font-family:'黑体';color: #49739E;">&nbsp维修费用:</div>
                                  <div style="float: left;font-size: 14px;font-family:'黑体';width:40px;">&nbsp<s:property value="#dd.price" /></div>
                                </div>
                                </div>
                                <div style="float:left;font-size: 14px;font-family:'黑体';"><s:property value="#dd.aspect"></s:property></div>
                              </div>
                            </div> 
						</div>
					</div>
				   <div style="height:10px;width:322px;"></div>
                   <div class="repairbottem">
                     <div class="repairbottemwords1"><div class="repairbottemwords">最新评价:</div><s:property value="#dd.comment" /><input type="button" value="预约 " style="height:20px;" onclick="checklogin1(<s:property value="#dd.id" />);"/></div>
                   </div>
				</div>	
          </s:iterator>
          <div style="margin-left: 105px;margin-top: 10px;"><s:a href="repairPrefecture_list.action?tpage=%{tpage-1}" style="font-size: 14px;font-family:'黑体';color: black;">上一页</s:a>&nbsp&nbsp&nbsp<s:a href="repairPrefecture_list.action?tpage=%{tpage+1}" style="font-size: 14px;font-family:'黑体';color: black;">下一页</s:a> </div>
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
