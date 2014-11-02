<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>手机客户端</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="shortcut icon" href="img/index/logo.gif">

<link rel="stylesheet" type="text/css" href="css/phoneWeb/phoneWeb.css">

<link rel="stylesheet" type="text/css" href="css/phoneWeb/top.css">


<link rel="stylesheet" type="text/css" href="css/phoneWeb/middle.css">

<link rel="stylesheet" type="text/css" href="css/phoneWeb/bottom.css">

<link rel="stylesheet" type="text/css" href="css/phoneWeb/changePic.css">

<link rel="stylesheet" href="extjs/resources/css/ext-all-gray.css"
	type="text/css"></link>

<script type="text/javascript" src="extjs/bootstrap.js"></script>
<script type="text/javascript" src="extjs/ext-lang-zh_CN.js"></script>


<script type="text/javascript" src="js/phoneWeb/jquery-1.4.2.min.js"></script>

<script type="text/javascript" src="js/phoneWeb/changePic.js"></script>


<script type="text/javascript" src="js/phoneWeb/selected.js"></script>

<script type="text/javascript">
  
  function tips(){
       
    Ext.Msg.alert('温馨提示','安卓客户端正在开发中，敬请期待...');
  
  }



</script>

</head>

<body>
	<!-- 页面总体布局，用于布局的DIV使用LAYOUT属性 -->
	<div id="layout">
		<!-- LAYOUT1为顶部的总DIV -->
		<div id="layout1">
			<div class="topLeft"></div>
			<div class="topRight">
				<div class="topBlank"></div>
				<ul class="topChoose">
					<li class="selected" onmouseover="change(this,'a')" id="c1"><a
						href="index.jsp">市场首頁</a>
					</li>
					<li class="noselected" onmouseover="change(this,'b')" id="c2"><a
						href="#">网络更新</a>
					</li>
					<li class="noselected" onmouseover="change(this,'c')" id="c3"><a
						href="#">友情提示</a>
					</li>
				</ul>
			</div>
		</div>
		<div id="layout2">
			<div class="middleBlank"></div>
			<div class="middleTop"></div>
			<div class="middleMain">
				<div class="DandP">

					<!-- DandP为中间软件下载以及右侧图片轮换的总DIV -->


					<!-- download为中间的软件下载部分 -->
					<div class="download">

						<!-- 用于软件下载部分的表格部分 -->

						<div class="DLtable">
							<div class="needBorder" style="height:29px ;line-height: 29px;font-size: 16px;font-family: '黑体';">软件下载</div>
							<div class="needBorder" style="height:197px; text-align: center;">
								<div style="height: 35%; weight:215px;">
									<a href="javascript:void(0)" onclick="tips()"><img src="img/phoneWeb/androidLogo.gif">
									</a>
									<div>v4.4.0.0更新时间：2013-06-07</div>
								</div>
								<div style="height: 65%; weight:215px;">
									<a href="javascript:void(0)" onclick="tips()"><img src="img/phoneWeb/APPLogo.gif"> </a>
									<div>v4.4.0.0更新时间：2013-06-07</div>
								</div>
							</div>
						</div>

						<!-- 用于软件下载部分的二维码部分 -->

						<div class="TDC">
							<ul>
								<li class="TDCli1"><img src="img/phoneWeb/androidTDC.gif">
								</li>
								<li class="TDCli2"><img src="img/phoneWeb/phoneTDC.gif">
								</li>
							</ul>
						</div>
					</div>
					<div class="changeBlank">
					</div>
					<!-- download为中间的图片轮换部分 -->
					<div class="changePic">


						<div class="player">
							<div id="icon_left"></div>
							<div id="icon_right"> </div>
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
				</div>
				<div class="CandP">
					<div class="connTable">
						<div class="needBorder" style="height:46px; line-height: 46px;font-size: 16px;font-family: '黑体';">联系方式</div>
						<div class="needBorder" style="height:117px;">
							<ul>
								<li><a href="#"><img src="img/phoneWeb/connPic1.gif">
								</a>
								</li>
								<li><a href="#"><img src="img/phoneWeb/connPic2.gif">
								</a>
								</li>
								<li><a href="#"><img src="img/phoneWeb/connPic3.gif">
								</a>
								</li>
								<li><a href="#"><img src="img/phoneWeb/connPic4.gif">
								</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="parter">
						<div class="parterWord">爪机用户直接访问:http://m.DreamStation.com</div>
						<div class="parterPic">
							<div style="margin-left:20px; margin-top:5px;font-size: 16px;font-family: '黑体';">合作伙伴</div>
							<div>
								<ul>
									<li><a href="#"><img src="img/phoneWeb/parterPic1.gif">
									</a>
									</li>
									<li><a href="#"><img src="img/phoneWeb/parterPic1.gif">
									</a>
									</li>
									<li><a href="#"><img src="img/phoneWeb/parterPic1.gif">
									</a>
									</li>
									<li><a href="#"><img src="img/phoneWeb/parterPic1.gif">
									</a>
									</li>
									<li><a href="#"><img src="img/phoneWeb/parterPic1.gif">
									</a>
									</li>
									<li><a href="#"><img src="img/phoneWeb/parterPic1.gif">
									</a>
									</li>
									<li><a href="#"><img src="img/phoneWeb/parterPic1.gif">
									</a>
									</li>
									<li><a href="#"><img src="img/phoneWeb/parterPic1.gif">
									</a>
									</li>
								</ul>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="layout3">
			<div class="bottom1">
				<div class="bottomBlank"></div>
				<div class="bottomMain">
					<div style="font-size: 16px;font-family: '黑体';">友情链接</div><br /> <br />
					<ul>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="#">安卓市场</a>&nbsp;</li>
						<li><a href="#">掌上应用汇</a>&nbsp;</li>
						<li><a href="#">长沙理工大学</a>&nbsp;</li>
						<li><a href="#">梦之站</a>&nbsp;</li>
						<li><a href="#">中兴汇天地</a>&nbsp;</li>
						<li><a href="#">中关村在线</a>&nbsp;</li>
						<li><a href="#">58同城</a>&nbsp;</li>
						<li><a href="#">安卓网</a>&nbsp;</li>
						<li><a href="#">安机市场</a>
						</li>
					</ul>

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
