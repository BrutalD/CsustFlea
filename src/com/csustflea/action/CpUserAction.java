package com.csustflea.action;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.csustflea.model.User;
import com.csustflea.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

@Component
@Scope("prototype")
public class CpUserAction extends ActionSupport {
	private User user;
	private File doc;
	private String docFileName;
	private String docContentType;
	private int id;
	private User listUserTemp;
	public int getId() {
		return id;
	}

	public void setId() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session1 = request.getSession();
	 	User u = (User)session1.getAttribute("logUserTemp");
		this.id = u.getId();
	}

	public User getListUserTemp() {
		return listUserTemp;
	}

	public void setListUserTemp(User listUserTemp) {
		this.listUserTemp = listUserTemp;
	}

	public File getDoc() {
		return doc;
	}

	public void setDoc(File doc) {
		this.doc = doc;
	}

	public String getDocFileName() {
		return docFileName;
	}

	public void setDocFileName(String docFileName) {
		this.docFileName = docFileName;
	}

	public String getDocContentType() {
		return docContentType;
	}

	public void setDocContentType(String docContentType) {
		this.docContentType = docContentType;
	}

	private UserService userservice;

	public UserService getUserservice() {
		return userservice;
	}

	@Resource
	public void setUserservice(UserService userservice) {
		this.userservice = userservice;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
	public String generaterFileName(String filename){
		DateFormat format = new SimpleDateFormat("yyMMddHHmmss");                                /* 这里是为了重新命名上传的文件的名字, */
		String date = format.format(new Date());
		int random = new Random().nextInt(10000);              /*这里是取得最后一个点的位置在哪 */
		int position = filename.lastIndexOf(".");           
		String extention = filename.substring(position);          /*取后缀名 */
		String targetfilename = date + random  + extention;
		return targetfilename;
	}

	public String list(){
		setId();
	    listUserTemp = (User)this.userservice.listUserInfo(getId());
		return "list";
	}
	
	public String updateuserifo() {
		setId();
		
		if(user.getPhonenumber().equals("")){
			user.setPhonenumber(null);
		}
		
    	this.userservice.CpUser(user,getId());
		return "relist";
	}

	
	public String updateuserpic(){
		setId();
		String targetfilepos = ServletActionContext.getRequest().getRealPath("/goodspic");  
		String targetfilename = generaterFileName(docFileName);                                      /*上传的位置，在该项目类 */
    	File file = new File(targetfilepos, targetfilename);
    	try {
			FileUtils.copyFile(doc, file);                                                           /*将文件拷贝过去 */
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	User usertemp = new User();
    	usertemp.setImage("../CsustFlea/goodspic/"+targetfilename);
    	this.userservice.CpUserPic(usertemp, getId());
		return "relist";
	}
}
