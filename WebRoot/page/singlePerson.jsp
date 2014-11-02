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
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>技术达人</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="css/singlePerson/singleperson.css">
	<link rel="shortcut icon" href="img/index/logo.gif">
<link rel="stylesheet" type="text/css" href="css/index/top.css">
<link rel="stylesheet" type="text/css" href="css/index/blank.css">
<link rel="stylesheet" href="extjs/resources/css/ext-all-gray.css"
	type="text/css"></link>
<link rel="stylesheet" type="text/css" href="css/singlePerson/bottem.css">

<script type="text/javascript" src="extjs/bootstrap.js"></script>
<script type="text/javascript" src="extjs/ext-lang-zh_CN.js"></script>

<script type="text/javascript" src="js/index/nav.js"></script>
<script type="text/javascript" src="js/index/logAndReg.js"></script>
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
		<div class="singlepstop">
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


		</div>
		<div class="singlepsmiddle">
		<s:if test="flag == null">
		   <div class="singlemiddletitle"><div class="singlemiddletitle1"><s:property value="tec.tname" /></div></div>
		   </s:if>
		   <s:else>
		   <div class="singlemiddletitle"><div class="singlemiddletitle1">他暂时不是维修达人</div></div>
		   </s:else>
		   <div class="singlemiddle1">
		     <div class="singlemiddlename">
		       <div class="singlename1"><div class="singlecolor1">维修数量:</div><div class="singlecolor2">&nbsp&nbsp<s:property value="tec.tcount" /></div></div>
		       <s:if test="flag == null">
		       <div class="singlename1"><div style="padding-top: 10px;"><div class="singlecolor3">身份:</div><div class="singlecolor2">&nbsp技术达人&nbsp维修达人</div></div></div>
		       </s:if>
		       <s:else>
		       <div class="singlename1"><div style="padding-top: 10px;"><div class="singlecolor3">身份:</div><div class="singlecolor2">&nbsp技术达人</div></div></div>
		       </s:else>
		       <div class="singlename1"><div style="padding-top: 15px;"><div class="singlecolor4">评分:</div><div class="singlecolor5">&nbsp<s:property value="tec.score" /></div></div></div>
		     </div>
		     <div class="singlemiddleimg"><div style="padding-left: 20px;"><img src="<s:property value="#dd.timg" />" /></div></div>
		     <div style="float: left;width:298px;height:200px;">
		       <div class="singledirect"><div class="singlecolor7"><div class="singlecolor6">技术方向:</div>&nbsp<s:property value="tec.aspect" /></div></div>
		      <div class="singleprice"><div style="padding-top:40px;"><div class="singlecolor6">预约价格:</div><div class="singlecolor7">&nbsp&nbsp<s:property value="tec.price" /></div></div></div>
		       
		    </div>
		   </div>
		    <div class="singlemiddleintro">
		      <div style="padding-left: 150px;"><div class="singlecolor6">介绍:</div><div class="singlecolor7">&nbsp&nbsp<s:property value="tec.introduce" /></div></div>
		    
		    </div>
		    <div class="singlemiddleapp" ">
		    <s:if test="flag == null">
              <div class="singlemiddleappfont"><a href="javascript:void(0)" onclick="checklogin1(<s:property value="tec.id" />);">预约</a></div>		
              </s:if>
              <s:else>
              <div class="singlemiddleappfont"><a href="javascript:void(0)">预约</a></div>	
              </s:else> 
		    </div>
		
		
		
		</div>
		<div id="layout4">
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
