<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
	href="css/myMarket/iframe/iJoined.css">


</head>

<body>
	<div class="mainPageLayout">

		<div class="goodsDiv">商品</div>
		<s:iterator value="gac" id="dd">

			<s:iterator value="dd" id="aa" status="st">
				<s:if test="#st.First">
					<!-- 只迭代第一个出来 -->
					<div class="goodsMain">
						<div style="clear: both;">
							<div class="goodsMainLeft" style="width:210px;">
								<s:property value="#aa.gname" />
							</div>
							<div style="float: left;padding-top: 10px;width:260px;">
								<div class="goodsMainType">商品类型:&nbsp</div>
								<div class="goodsContent">
									<s:property value="#aa.gtype" />
								</div>
								<div class="goodsMainPrice">商品价格:&nbsp</div>
								<div class="goodsContent">
									<s:property value="#aa.gprice" />
								</div>

							</div>
						</div>
						<div class="goodsTime">
							<s:property value="#aa.gdate" />
						</div>
					</div>
				</s:if>
			</s:iterator>

			<div class="lMessage">留言</div>

			<div class="lMessageMain">
				<s:iterator value="dd" id="aa">
					<span class="lMessageMe">&nbsp&nbsp&nbsp我:</span>
					<span class="lMessageCon"><s:property value="#aa.ucomment" />
					</span>
					<br>
					<span>&nbsp&nbsp&nbsp&nbsp&nbsp<s:property
							value="#aa.guname" /> </span>
					<span class="lMessageAns">&nbsp回复&nbsp</span>
					<span>我:</span>
					<span class="lMessageCon"><s:property value="#aa.gucomment" />
					</span>
					<br>
				</s:iterator>
				<form action="IJoined_save.action" method="post">
					<s:iterator value="dd" id="aa" status="st">
						<s:if test="#st.First">
							<input type="text" id="gid" name="gid"
								value="<s:property value="#aa.gid"/>" style="display: none;" />
							<input type="text" id="gname" name="gname"
								value="<s:property value="#aa.gname"/>" style="display: none;" />
							<input type="text" id="gdate" name="gdate"
								value="<s:property value="#aa.gdate"/>" style="display: none;" />
							<input type="text" id="gtype" name="gtype"
								value="<s:property value="#aa.gtype"/>" style="display: none;" />
							<input type="text" id="gprice" name="gprice"
								value="<s:property value="#aa.gprice"/>" style="display: none;" />
							<div style="margin-left: 15px;margin-top: 10px;">
								<span> <s:textarea
										style="resize: none; border:0px;background-color: #FFFFFF;  overflow-x:hidden; overflow-y:hidden;height:100px; width:400px;" name="ucomment1">

									</s:textarea> </span> <span> <input type="submit" value="提交" /> </span>
							</div>
						</s:if>
					</s:iterator>
				</form>

			</div>
		</s:iterator>


	</div>
</body>
</html>
