<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
	href="css/myMarket/iframe/mainPage.css">
	
	<script type="text/javascript">
	window.onload=function(){
	  var gprice1 = "<s:property value="mygoods.gprice" />";   /* 对价格的长度进行剪切 */
	  if(gprice1.length > 5){
	  document.getElementById("price1").innerHTML=gprice1.substr(0,4);
	  }
	  else{
         document.getElementById("price1").innerHTML=gprice1.split(".")[0];	  
	  }
	  var gprice2 = "<s:property value="collection.gprice" />";
	  if(gprice2 != 0.0){
	  if(gprice2.length > 5){
	  document.getElementById("gprice2").innerHTML=gprice2.substr(0,4);
	  }
	  else{
         document.getElementById("gprice2").innerHTML=gprice2.split(".")[0];	  
	  }}
	};
	</script>

</head>

<body>
	<div class="mainPageLayout">
		<div class="mainPageTop">
			<div class="mainPageImg">
				<img src="<s:property value='img' />">
			</div>
			<div class="mainPageMessage">
				<div class="mainPageShowMessage">
					用户名:&nbsp&nbsp<span style="font-size:16px;color: red;"><a
						href="CpUser_list.action"><s:property value="username" />
					</a>
					</span><br /> <img src="img/myMarket/line.gif"> <br />
					<div style="float:left; font-size: 14px;">您的商品总数:</div>
					<div class="showPoint">
						<a href="ListGoodsMan_list.action"><s:property
								value="goodscount" />
						</a>
					</div>
					<br />
					<br />
					<div style="float:left; font-size: 14px; ">
						提到我的(<a href="RemindMe_listandupdate.action"><s:property
								value="remindmecount" /></a>)&nbsp;&nbsp;我参与的(<a href="IJoined_listAndUpdate.action"><s:property
								value="ijoinedcount" /></a>)&nbsp;&nbsp;技术文章(<a href="technicarticle.action"><s:property
								value="articlecount" /></a>)
					</div>
				</div>
			</div>
		</div>
		<div class="mainPageMiddle">
			我的发布<br />
			<div style="background-color: #EAE6E6; width:440px ;height: 126px;">
			<div class="goodsinfo">
			  <div class="goodsimg">
			  <img src="<s:property value="mygoods.gpic1" />" />
			  </div>
			  <div class="goodsname"><s:property value="mygoods.gname" /></div>
			</div>
			<div class="goodsinfos">
			 <div class="goodstypeandprice">
			 <div class="goodsmain">
			  <div class="goodsformat1">商品类型:&nbsp</div>
			  <div class="goodsformat2"><s:property value="mygoods.gtype" />&nbsp</div>
			  <div class="goodsformat1">商品价格:&nbsp</div>
			  <div class="goodsformat2" id="price1"></div>
			 </div>
			 </div>
			 <div class="goodsdate"><div style="margin-left: 190px;font-size: 14px;color:#318ACC;"><s:property value="mygoods.gdate" /></div></div>
			</div>
			</div>
		</div>
		<div class="mainPageDown">
			我的收藏<br />
			<div style="background-color: #EAE6E6; width: 440px;height:126px;">
			<div class="goodsinfo">
			  <div class="goodsimg">
			  <img src="<s:property value="collection.gpic1" />" />
			  </div>
			  <div class="goodsname"><s:property value="collection.gname" /></div>
			</div>
			<div class="goodsinfos">
			 <div class="goodstypeandprice">
			 <div class="goodsmain">
			  <div class="goodsformat1">商品类型:&nbsp</div>
			  <div class="goodsformat2"><s:property value="collection.gtype" />&nbsp</div>
			  <div class="goodsformat1">商品价格:&nbsp</div>
			  <div class="goodsformat2" id="gprice2"></div>
			 </div>
			 </div>
			 <div class="goodsdate"><div style="margin-left: 190px;font-size: 14px;color:#318ACC;"><s:property value="collection.gdate" /></div></div>
			</div>
			</div>
		</div>
	</div>
</body>
</html>
