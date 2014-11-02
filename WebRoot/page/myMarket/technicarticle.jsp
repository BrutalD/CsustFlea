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

<title>My JSP 'technicarticle.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="css/myMarket/iframe/technicarticle.css"
	type="text/css"></link>
<link rel="stylesheet" href="extjs/resources/css/ext-all-gray.css"
	type="text/css"></link>

<script type="text/javascript" src="extjs/bootstrap.js"></script>
<script type="text/javascript" src="extjs/ext-lang-zh_CN.js"></script>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="ckeditor/config.js"></script>
<script type="text/javascript">
//ajax异步提交，不跳转页面
Ext.onReady(function(){                             
	Ext.get("submit").on("click",function(){
	   //console.log(editor.document.getBody().getHtml()); 
		  var requestConfig = {
			url :'TechnicArticleAction_post.action',//请求的服务器地址
			//form : 'fm',//指定要提交的表单id
			params : {
			'title' : document.getElementById("title").value,     
			'content' : editor.document.getBody().getHtml(),      //获取编辑器的内容
			},
			callback : function(options,success,response){//回调函数
				               //var msg = ["请求是否成功：" ,success,"\n",
					           //"服务器返回值：",response.responseText];
				               //alert(msg.join(''));
				 if(success){
				Ext.Msg.alert('温馨提示','文章已提交，等待管理员审核');
				}
				else{
				Ext.Msg.alert('温馨提示','文章提交失败,请重新提交');
				}
			}
		};
		Ext.Ajax.request(requestConfig);//发送请求  
	});
});
</script>
</head>

<body>
	<div class="mainPageLayout">
		<form id="fm">
		    <br>
			<div>
				<div style="margin-left: 10px;">标题:<input type="text" name="title" style="width:250px;" id="title" /></div>
			</div><br>
			<div>
				<textarea cols="80" id="editor1" name="content" rows="10">
      在此添加内容
     </textarea>
				<script type="text/javascript">
					var editor = CKEDITOR.replace('editor1', {
						skin : 'kama',
						language : 'zh-cn',
						width : '508' ,
						height: '420',
					});
				</script>
			</div>
			<div style="margin-top: 20px;margin-left: 210px;"><input type="button" value="提交文章" id="submit" /></div>
		</form>
	</div>
</body>
</html>
