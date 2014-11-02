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

<title>My JSP 'technicistScore.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/myMarket/iframe/technicistScore.css"
	type="text/css"></link>
	<link rel="stylesheet" href="extjs/resources/css/ext-all-gray.css"
	type="text/css"></link>

<script type="text/javascript" src="extjs/bootstrap.js"></script>
<script type="text/javascript" src="extjs/ext-lang-zh_CN.js"></script>

<script type="text/javascript">

	function postComments(i) {
	if(document.getElementById("util").firstChild == null){
        var input = document.createElement("input");
        input.setAttribute("name", "score");
        input.setAttribute("value", document.getElementById("select"+i).value);	
		document.getElementById("util").appendChild(input);
		document.getElementById("util").appendChild(document.getElementById("id"));
		document.getElementById("util").appendChild(document.getElementById("tid"));
		document.getElementById("text").focus();
		
		}
		else{
		document.getElementById("util").removeChild(document.getElementById("util").firstChild);
		var input = document.createElement("input");
		input.setAttribute("name", "score");
        input.setAttribute("value", document.getElementById("select"+i).value);	
		document.getElementById("util").appendChild(input);
		document.getElementById("util").appendChild(document.getElementById("id"));
		document.getElementById("util").appendChild(document.getElementById("tid"));
		document.getElementById("text").focus();
		
		}
	}
	function post(){
	if(document.getElementById("util").firstChild != null){
	document.getElementById("myform").submit();}
	else{
	 Ext.Msg.alert('温馨提示','请先点击上方的‘编辑评论’');
	}
	}
</script>
</head>

<body>
	<div class="mainPageLayout">
		<div
			style="color: #18528C;width:100px;height:25px;padding-top: 10px;padding-left: 10px;font-size: 18px;">未评分预约</div>
        <%int i=0; %>
		<s:iterator value="uat" id="dd">
			<s:form >
				<!-- form要写在iterator的里面,否则就会出错  -->
				<div
					style="width:489px;height:134px;background-image: url('img/myMarket/technicaScore_bg1.gif');margin-left: 12px;font-size: 20px;">
					<div style="width:489px;height:48px;float: left;padding-top: 8px;">
						<div style="float: left;color: #18528C;font-size: 20px;font-family: '黑体'">
							&nbsp
							<s:property value="#dd.utdate" />
							&nbsp预约
						</div>
						<div style="float: left;margin-left: 6px;width:180px;font-size: 20px;font-family: '黑体'">
							&nbsp&nbsp
							<s:property value="#dd.appname" />
						</div>
						<div style="float: left;margin-left: 10px;color:red;">完成</div>
					</div>
					<div style="margin-top: 3px;width:489px;height:40px;clear: both;">
						<div
							style="float:left;color: #18528C;padding-left: 12px;margin-top: 4px;">给</div>
						<div style="float:left;margin-top: 4px;width:180px;">
							&nbsp&nbsp
							<s:property value="#dd.appname" />
						</div>
						<div style="float:left;color: #18528C;margin-top: 4px;">评分:</div>
						<div style="display: none;">
							<input type="text" value='<s:property value="#dd.id" />'
								name="id" id="id"/>
								<input type="text" value='<s:property value="#dd.tid" />'
								name="tid" id="tid"/>
						</div>
						<div style="float:left;">
							<select name="score" id="select<%=i %>">
								<option>10</option>
								<option>9</option>
								<option>8</option>
								<option>7</option>
								<option>6</option>
								<option>5</option>
							</select>
						</div>
						
					</div>
					<div
						style="padding-left: 203px;clear: both;font-size: 16px;font-family: '黑体'">
						<a href="javascript:void(0)" style="color:red"
							onclick="postComments(<%=i %>)">编辑评论</a>
					</div>
                  <%i++; %>
				</div>

			</s:form>
		</s:iterator>
		
		<div style="margin-left: 22px;">
		<s:form id="myform" action="TechnicistScore_postscore.action" method="post">
			<textarea
				style="resize: none; border:0px;background-color: #FFFFFF;  overflow-x:hidden; overflow-y:hidden;height:75px; width:390px;" id="text" name="TecComment"></textarea>
			&nbsp<input type="button" value="提交评论" onclick="post()" />
			<div id="util" style="display: none;"></div>
		</s:form>
		</div>

		<div
			style="color: #18528C;width:150px;height:25px;padding-top: 10px;margin-left: 10px;font-size: 18px;clear: both;">已评分预约</div>
		<s:iterator value="uat1" id="dd">
			<div
				style="width:489px;height:3px;margin-left: 10px;background-image: url('img/myMarket/technicaScore_bg2.gif');"></div>
			<div
				style="height:62px;font-size: 20px;margin-left: 12px;margin-top: 5px;">
				<div style="float: left;color: #18528C;font-size: 20px;font-family: '黑体'">
					&nbsp
					<s:property value="#dd.utdate" />
					&nbsp预约
				</div>
				<div style="float: left;margin-left: 6px;width:180px;font-size: 20px;font-family: '黑体'">
					&nbsp&nbsp
					<s:property value="#dd.appname" />
				</div>
				<div style="float: left;margin-left: 10px;color:red;">完成</div>
				<div style="clear:both;">
					<div
						style="float:left;color: #18528C;padding-left: 12px;padding-top: 10px;font-size: 20px;font-family: '黑体'">给</div>
					<div style="float:left;padding-top: 10px;font-size: 20px;font-family: '黑体'">
						&nbsp&nbsp
						<s:property value="#dd.appname" />
						&nbsp&nbsp
					</div>
					<div style="float:left;color: #18528C;padding-top: 10px;">
						评分:
						<s:property value="#dd.tscore" />
					</div>
				</div>
			</div>
		</s:iterator>

		<div
			style="width:489px;height:3px;margin-left: 10px;background-image: url('img/myMarket/technicaScore_bg2.gif');"></div>
		<div style="margin-left:170px;margin-top: 20px;font-size: 16px;font-family: '黑体' ">
			<s:a href="TechnicistScore_list.action?page=%{page-1}"
				style="color:black;">上一页</s:a>
			&nbsp&nbsp&nbsp
			<s:a href="TechnicistScore_list.action?page=%{page+1}"
				style="color:black;">下一页</s:a>
		</div>

	</div>
</body>
</html>
