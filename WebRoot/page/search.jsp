<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
{ flag = "a";}
else{flag = "b";}
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>搜索列表</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="shortcut icon" href="img/index/logo.gif">
<link rel="stylesheet" type="text/css" href="css/search.css">
<link rel="stylesheet" type="text/css" href="css/index/top.css">
<link rel="shortcut icon" href="img/index/logo.gif">
<link rel="stylesheet" href="extjs/resources/css/ext-all-gray.css"
	type="text/css"></link>
<link rel="stylesheet" type="text/css" href="css/index/blank.css">
<script type="text/javascript" src="extjs/bootstrap.js"></script>
<script type="text/javascript" src="extjs/ext-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/index/logAndReg.js"></script>


<script type="text/javascript" language="javascript">
	$(document).ready(function() {
		$('.box_skitter_large').skitter({
			theme : 'clean',
			numbers_align : 'center',
			progressbar : true,
			dots : true,
			preview : true
		});
	});
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
		<div class="layout2">

			<div style="padding-top: 5px;">
				<div>
					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"<s:property value="key" />"搜索结果 (共<a style="color:blue;"><s:property value="countAll" /></a>条)
					:
				</div>
                 <div style="margin-top: 5px;"></div>
                 <s:iterator value="#request.searchlist" id="dd">
                 <ul>
                 <li>
				<div>
					<div style="float: left;width:24px; height:79px "></div>
					<div style="width:957px; height:79px ; float:left;"
						class="listgoods">
						<div style="float:left;width: 10px;height:79px;"></div>
							<img style="width:75px;height:75px;margin-top: 3px;float:left;" src="<s:property value="#dd.gpic2"/>" />
						<div style="float:left;width: 20px;height:79px;"></div>
						<div style="float: left;width:550px;height:79px;">
							<div style="line-height: 40px;">
								<div style="float: left;font-size: 24px;font-family: '黑体';width:190px;"><a href="getGoods_getGoodsById.action?goodsId=<s:property value='#dd.id' />" style="color:black;"><s:property value="#dd.gname" /></a></div>
								<div
									style="float: left;margin-top:5px;color:#5478A1;font-family: '黑体'"><s:property value="#dd.gtype" /></div>
							</div>
							<div class="clear" style="color:#8A8A8A"><s:property value="#dd.gdescb" /></div>
						</div>
						<div style="float: left;margin-top: 40px;width:190px;margin-left: 16px;color:red"><s:property value="#dd.gprice" /></div>
                        <div style="float: left;margin-top: 40px;color:#5478A1;"><s:property value="#dd.gdate" /></div>
					</div>
				</div>
				</li>
				</ul>
				</s:iterator>
			</div>

			<div style="float: left;margin-top: 25px;margin-left: 300px;" class="hrefcolor"><s:a href="searchGoods_limit.action?page=%{page-1}">上一页</s:a>&nbsp&nbsp&nbsp<s:a href="searchGoods_limit.action?page=1">首页</s:a>&nbsp&nbsp<s:a href="searchGoods_limit.action?page=1">1</s:a>&nbsp&nbsp<s:a href="searchGoods_limit.action?page=2">2</s:a>&nbsp&nbsp<s:a href="searchGoods_limit.action?page=3">3</s:a>&nbsp&nbsp<s:a href="searchGoods_limit.action?page=4">4</s:a>&nbsp&nbsp<s:a href="searchGoods_limit.action?page=5">5</s:a>&nbsp&nbsp<s:a href="searchGoods_limit.action?page=6">6</s:a>...&nbsp&nbsp<s:a href="">尾页</s:a>&nbsp&nbsp&nbsp<s:a href="searchGoods_limit.action?page=%{page+1}">下一页</s:a></div>

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
