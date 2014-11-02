<%@page import="org.apache.commons.fileupload.util.Streams"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="org.apache.commons.fileupload.FileItemStream"%>
<%@page import="org.apache.commons.fileupload.FileItemIterator"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="java.io.File"%>
<%@page import="java.util.UUID"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%
    System.out.println("a");
	String path = request.getContextPath() + "/";                             //得到项目的名称
	if (ServletFileUpload.isMultipartContent(request)) {                      //确保这个请求的确是一个正确的上传文件
		String type = "";
		if (request.getParameter("type") != null)//获取文件分类
			type = request.getParameter("type").toLowerCase() + "/";         //得到image
		String callback = request.getParameter("CKEditorFuncNum");           //获取回调JS的函数Num，显示到浏览图片的链接
		DiskFileItemFactory factory = new DiskFileItemFactory();             //创建磁盘工厂
		ServletFileUpload Upload = new ServletFileUpload(factory);           //创建处理工具       
		Upload.setHeaderEncoding("UTF-8");                                   //解决文件名乱码的问题                                                                                 
		FileItemIterator fii = Upload.getItemIterator(request);
		while (fii.hasNext()) {
			FileItemStream fis = fii.next();
			if (!fis.isFormField()) {                                        //判断是否为表单域，如果是表单域就可以直接读取表单的值，不是表单域就可以直接存到数据库
				String fileName = fis.getName();
				fileName = "file" + System.currentTimeMillis()               //距离当前系统的时间毫秒数
						+ fileName.substring(fileName.lastIndexOf("."));
				//定义文件路径，根据你的文件夹结构，可能需要做修改
				String clientPath = "ckeditor/uploader/upload/" + type
						+ fileName;
				//保存文件到服务器上
				File file = new File(request.getSession()
						.getServletContext().getRealPath(clientPath));
				if (!file.getParentFile().exists()) {                        //file.getParentFile()得到目录，所以当第一次创建了目录的时候，这个为假，而不是指file
					file.getParentFile().mkdirs();                           //创建父目录的文件夹，创建一次
				}
				while(file.exists()){
					fileName = "file" + System.currentTimeMillis()
						+ fileName.substring(fileName.lastIndexOf("."));
					file = new File(request.getSession()
						.getServletContext().getRealPath(clientPath));       // 获得物理路径
				}
				BufferedInputStream bis = new BufferedInputStream(fis.openStream());
				FileOutputStream fos = new FileOutputStream(file);
				Streams.copy(bis, fos,true);     //将接收到的文件copy到创建的文件中去
				//打印一段JS，调用parent页面的CKEditor的函数，传递函数编号和上传后文件的路径；这句很重要，成败在此一句
				out.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
						+ callback
						+ ",'"
						+ path
						+ clientPath
						+ "')</script>");
						System.out.println("ok");
				break;
			}
		}
	}
%>



<%-- <%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="java.io.File"%>
<%@page import="java.util.UUID"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%
String path = request.getContextPath() + "/";
if(ServletFileUpload.isMultipartContent(request)){
	String type = "";
	if(request.getParameter("type") != null)//获取文件分类
		type = request.getParameter("type").toLowerCase() + "/";
	String callback = request.getParameter("CKEditorFuncNum");//获取回调JS的函数Num
	FileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload Upload = new ServletFileUpload(factory);
	Upload.setHeaderEncoding("UTF-8");//解决文件名乱码的问题
	List<FileItem> items =  Upload.parseRequest(request);
	Iterator itr = items.iterator();
	 while(itr.hasNext()){
	   FileItem fi = (FileItem) itr.next();
	   if (!fi.isFormField()) {
			String fileName = fi.getName();
			fileName = "file" + System.currentTimeMillis() + fileName.substring(fileName.lastIndexOf("."));
			//定义文件路径，根据你的文件夹结构，可能需要做修改
			String clientPath = "ckeditor/uploader/upload/" + type + fileName;
			//保存文件到服务器上
			File file = new File(request.getSession().getServletContext().getRealPath(clientPath));
			if (!file.getParentFile().exists()) {
				file.getParentFile().mkdirs();
			}
			while(file.exists()){
					fileName = "file" + System.currentTimeMillis()
						+ fileName.substring(fileName.lastIndexOf("."));
					file = new File(request.getSession()
						.getServletContext().getRealPath(clientPath));       // 获得物理路径
				}
			fi.write(file);
			//打印一段JS，调用parent页面的CKEditor的函数，传递函数编号和上传后文件的路径；这句很重要，成败在此一句
			out.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("+callback+",'"+path+clientPath+"')</script>");
			break;
		}
	 }
	
}
 %> --%>
