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
	href="css/myMarket/iframe/remindMe.css">
	<link rel="stylesheet" href="extjs/resources/css/ext-all-gray.css"
	type="text/css"></link>

<script type="text/javascript" src="extjs/bootstrap.js"></script>
<script type="text/javascript" src="extjs/ext-lang-zh_CN.js"></script>
<script type="text/javascript">
function postid(j){
  if(document.getElementById("div"+j).lastChild == null){
  Ext.Msg.alert('温馨提示','请先点击上面的回复链接');
  }
  else{
  document.getElementById("form"+j).submit();}
}

function appendchild(j,value){
 if(document.getElementById("div"+j).lastChild == null){
 var myInput = document.createElement("input");
 myInput.setAttribute("name", "comid");
 myInput.setAttribute("value", value);
 document.getElementById("text"+j).focus();
 document.getElementById("div"+j).appendChild(myInput);
 }
 else{
 document.getElementById("div"+j).removeChild(document.getElementsByName("comid")[0]);
 var myInput = document.createElement("input");
 myInput.setAttribute("name", "comid");
 myInput.setAttribute("value", value);
 document.getElementById("text"+j).focus();
 document.getElementById("div"+j).appendChild(myInput);   
 } 

}


function s(e,a)
{
	 if ( e && e.preventDefault )
            e.preventDefault();
	else {
	window.event.returnValue=false;
		a.focus();
		}
}

</script>
</head>

<body>
	<div class="mainPageLayout">

		<div class="goodsDiv">商品</div>
		<%
			int j = 0;
		%>
		<s:iterator value="gac" id="dd">
			<s:iterator value="dd" id="aa" status="st">
				<s:if test="#st.First">
					<div class="goodsMain">
						<div style="clear: both;">
							<div class="goodsMainLeft" style="width:210px;">
								<s:property value="#aa.gname" />
							</div>
							<div style="float: left;margin-top: 10px;width:260px;">
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

				<s:iterator value="dd" id="aa" status="st">
					<s:if test="#aa.gucomment == null">
						<span class="lMessageMe" style="font-size: 16px;font-family: '黑体'">&nbsp&nbsp&nbsp<s:property
								value="#aa.uname"  />:</span>
						<span class="lMessageCon"><s:property value="#aa.ucomment" />&nbsp&nbsp&nbsp<a
							href="javascript:void(0)" style="color:red"
							onclick="appendchild(<%=j%>,<s:property value='#aa.id' />)">回复</a>
						</span>
						<%-- <input type="text" id="<%=i %>"  value="<s:property value='#aa.id' />" />
						<% i++; %> --%>
					</s:if>
					<s:else>
						<span class="lMessageMe" style="font-size: 16px;font-family: '黑体'">&nbsp&nbsp&nbsp<s:property
								value="#aa.uname" />:</span>
						<span class="lMessageCon"><s:property value="#aa.ucomment" />
						</span>
					</s:else>
					<s:if test="#aa.gucomment != null">
						<!-- 判断评论是否为空，为空的话就不显示出来 -->
						<br>
						<span style="font-size: 16px;font-family: '黑体'">&nbsp&nbsp&nbsp&nbsp&nbsp我</span>
						<span class="lMessageAns" style="font-size: 16px;font-family: '黑体'">&nbsp回复&nbsp</span>
						<span class="lMessageCon"><s:property value="#aa.gucomment" />
						</span>
					</s:if>
					<br>
				</s:iterator>
				<form action="RemindMe_save.action" method="post" id="form<%=j%>" >
					<div style="margin-left: 15px;margin-top: 10px;">
						<span> <textarea id="text<%=j%>" onmousedown="s(event,this)"
								style="resize: none; border:0px;background-color: #FFFFFF;  overflow-x:hidden; overflow-y:hidden;height:100px; width:400px;"
								name="gucomment" > 
							</textarea> </span> <span> <input type="button" value="提交"
							onclick="postid(<%=j%>)" />
							 </span>
							 <span id="div<%=j%>" style="display: none;"></span>
					</div>
				</form>
				<%
					j++;
				%>
			</div>
		</s:iterator>
	</div>
</body>
</html>
