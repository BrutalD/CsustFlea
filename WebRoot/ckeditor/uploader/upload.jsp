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
	String path = request.getContextPath() + "/";                             //�õ���Ŀ������
	if (ServletFileUpload.isMultipartContent(request)) {                      //ȷ����������ȷ��һ����ȷ���ϴ��ļ�
		String type = "";
		if (request.getParameter("type") != null)//��ȡ�ļ�����
			type = request.getParameter("type").toLowerCase() + "/";         //�õ�image
		String callback = request.getParameter("CKEditorFuncNum");           //��ȡ�ص�JS�ĺ���Num����ʾ�����ͼƬ������
		DiskFileItemFactory factory = new DiskFileItemFactory();             //�������̹���
		ServletFileUpload Upload = new ServletFileUpload(factory);           //����������       
		Upload.setHeaderEncoding("UTF-8");                                   //����ļ������������                                                                                 
		FileItemIterator fii = Upload.getItemIterator(request);
		while (fii.hasNext()) {
			FileItemStream fis = fii.next();
			if (!fis.isFormField()) {                                        //�ж��Ƿ�Ϊ��������Ǳ���Ϳ���ֱ�Ӷ�ȡ����ֵ�����Ǳ���Ϳ���ֱ�Ӵ浽���ݿ�
				String fileName = fis.getName();
				fileName = "file" + System.currentTimeMillis()               //���뵱ǰϵͳ��ʱ�������
						+ fileName.substring(fileName.lastIndexOf("."));
				//�����ļ�·������������ļ��нṹ��������Ҫ���޸�
				String clientPath = "ckeditor/uploader/upload/" + type
						+ fileName;
				//�����ļ�����������
				File file = new File(request.getSession()
						.getServletContext().getRealPath(clientPath));
				if (!file.getParentFile().exists()) {                        //file.getParentFile()�õ�Ŀ¼�����Ե���һ�δ�����Ŀ¼��ʱ�����Ϊ�٣�������ָfile
					file.getParentFile().mkdirs();                           //������Ŀ¼���ļ��У�����һ��
				}
				while(file.exists()){
					fileName = "file" + System.currentTimeMillis()
						+ fileName.substring(fileName.lastIndexOf("."));
					file = new File(request.getSession()
						.getServletContext().getRealPath(clientPath));       // �������·��
				}
				BufferedInputStream bis = new BufferedInputStream(fis.openStream());
				FileOutputStream fos = new FileOutputStream(file);
				Streams.copy(bis, fos,true);     //�����յ����ļ�copy���������ļ���ȥ
				//��ӡһ��JS������parentҳ���CKEditor�ĺ��������ݺ�����ź��ϴ����ļ���·����������Ҫ���ɰ��ڴ�һ��
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
	if(request.getParameter("type") != null)//��ȡ�ļ�����
		type = request.getParameter("type").toLowerCase() + "/";
	String callback = request.getParameter("CKEditorFuncNum");//��ȡ�ص�JS�ĺ���Num
	FileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload Upload = new ServletFileUpload(factory);
	Upload.setHeaderEncoding("UTF-8");//����ļ������������
	List<FileItem> items =  Upload.parseRequest(request);
	Iterator itr = items.iterator();
	 while(itr.hasNext()){
	   FileItem fi = (FileItem) itr.next();
	   if (!fi.isFormField()) {
			String fileName = fi.getName();
			fileName = "file" + System.currentTimeMillis() + fileName.substring(fileName.lastIndexOf("."));
			//�����ļ�·������������ļ��нṹ��������Ҫ���޸�
			String clientPath = "ckeditor/uploader/upload/" + type + fileName;
			//�����ļ�����������
			File file = new File(request.getSession().getServletContext().getRealPath(clientPath));
			if (!file.getParentFile().exists()) {
				file.getParentFile().mkdirs();
			}
			while(file.exists()){
					fileName = "file" + System.currentTimeMillis()
						+ fileName.substring(fileName.lastIndexOf("."));
					file = new File(request.getSession()
						.getServletContext().getRealPath(clientPath));       // �������·��
				}
			fi.write(file);
			//��ӡһ��JS������parentҳ���CKEditor�ĺ��������ݺ�����ź��ϴ����ļ���·����������Ҫ���ɰ��ڴ�һ��
			out.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("+callback+",'"+path+clientPath+"')</script>");
			break;
		}
	 }
	
}
 %> --%>
