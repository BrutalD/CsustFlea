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
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>技术文章</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/singlearticle/top.css">
<link rel="stylesheet" type="text/css"
	href="css/singlearticle/middle.css">
<link rel="stylesheet" type="text/css"
	href="css/singlearticle/bottem.css">
<link rel="stylesheet" type="text/css" href="css/index/top.css">
<link rel="stylesheet" href="extjs/resources/css/ext-all-gray.css"
	type="text/css"></link>
<link rel="stylesheet" type="text/css" href="css/index/blank.css">
<link rel="shortcut icon" href="img/index/logo.gif">
<script type="text/javascript" src="extjs/bootstrap.js"></script>
<script type="text/javascript" src="extjs/ext-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/index/logAndReg.js"></script>
<script type="text/javascript" src="js/livingGoods/nav.js"></script>
<script defer="defer">
function a(){
var view = document.getElementById("view");
var hide = document.getElementById("hide");
view.innerHTML =  hide.innerHTML;
}
window.onload=a;

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
			<div class="singlebody">
				<div class="singleleft">
					<div class="singleimg">
						<div class="singleimg1">
							<img src="<s:property value='aa.uimg'/>" />
						</div>
					</div>
					<div class="singletitle"><s:property value='aa.uname'/></div>
					<div class="singlename">
						<div class="singlename1">姓名:</div>
						<div class="singlename2"><s:property value='tt.trealname'/></div>
					</div>
					<s:if test="articleflag == null">
					<div class="singleidenty">
						<div class="singlename1">身份:</div>
						<div class="singlename2"><s:property value='tt.identy'/></div>
					</div>
					</s:if>
					
					<s:else>
					<div class="singleidenty">
					<div class="singlename1">身份:</div>
						<div class="singlename2">技术达人</div>
						</div>
					</s:else>
					
					<div class="singledirect">
						<div class="singlename2">
							<div class="singlename1">技术方向:</div>
							<s:property value='tt.aspect'/>
						</div>
					</div>
					<div class="singleprice">
						<div class="singlename1">预约价格:</div>
						<s:if test="articleflag == null">
						<div class="singlename2">
							<s:property value='tt.price'/>&nbsp&nbsp<input type="button" value="预约" onclick="checklogin1(<s:property value="tt.id" />);" />
						</div>
						</s:if>
						<s:else>
						<div class="singlename2">
							<s:property value='tt.price'/>
						</div>
						</s:else>
					</div>
					<div class="singlescore">
						<div class="singlename1">维修数量:</div>
						<div class="singlename2"><s:property value='tt.tcount'/></div>
					</div>
					<div class="singlescore">
						<div class="singlename1">评分:</div>
						<div class="singlename2"><s:property value='tt.score'/></div>
					</div>
					<div class="singleintro">
					<s:if test="articleflag == null">
						<div class="singlename2">
							<div class="singlename1">介绍:</div>
							<s:property value='tt.introduce'/>
						</div>
						</s:if>
						<s:else>
						<div class="singlename2">
							<div class="singlename1">介绍:</div><br>
							&nbsp&nbsp&nbsp他暂时不是维修达人
						</div>
						
						</s:else>
					</div>
					<div class="singleconclude">
						<div class="singleconclude1">钢铁是怎样炼成的</div>
					</div>
					<div class="singleconclude">
						<div class="singleconclude1">钢铁是怎样炼成的</div>
					</div>
					<div class="singleconclude">
						<div class="singleconclude1">钢铁是怎样炼成的</div>
					</div>
					<div class="singleconclude">
						<div class="singleconclude1">钢铁是怎样炼成的</div>
					</div>
					<div class="singleconclude">
						<div class="singleconclude1">钢铁是怎样炼成的</div>
					</div>
					<div class="singleconclude">
						<div class="singleconclude1">钢铁是怎样炼成的</div>
					</div>
					<div class="singleconclude">
						<div class="singleconclude1">钢铁是怎样炼成的</div>
					</div>
					<div class="singleconclude">
						<div class="singleconclude1">钢铁是怎样炼成的</div>
					</div>
				</div>
				<div class="singleright">
					<div class="singlerighttitle">
						<div class="singlerighttitle1">
							<div class="singlerighttitle2"><s:property value='aa.title'/></div>
						</div>
						<div class="singlerighttitle3">
						    <div>
						    <div style="width:580px;height:2px;float: left;"></div>
							<div style="float: left;">发表时间:</div>
							<div style="float: left;"><s:property value="aa.adate" /></div>
						    </div>
					</div>
					<div style="display: none;" id="hide">&nbsp&nbsp&nbsp<s:property value="aa.content" escape="false" /></div>
					<div class="singlerightbody" style="overflow:hidden;">
					  <div id="view" style="overflow:auto;width:773px;height:1000px;">
					  
					  </div>
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
</div>

</body>
</html>
