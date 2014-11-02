<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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

<title>My JSP 'uppic.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="test.css">

</head>

<body>
  <s:iterator value="#request.article" id="dd">
  <div style="border: solid red 1px;margin-top: 20px;">
  <div><s:property value="#dd.title" /><s:property value="#dd.adate" /></div>
  <div><s:property value="#dd.content" escape="false" /></div>
  <div><s:a href="TechnicArticleAction_examin.action?id=%{#dd.id}">审核通过</s:a></div><br>
  <div><s:a href="TechnicArticleAction_delete.action?id=%{#dd.id}">删除文章</s:a></div>
  </div>
  </s:iterator> 
  
</body>
</html>
