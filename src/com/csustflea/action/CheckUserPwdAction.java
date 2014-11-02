package com.csustflea.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.csustflea.model.User;
import com.csustflea.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

@Component
@Scope("prototype")
public class CheckUserPwdAction extends ActionSupport {
	private User user;
	private String newpassword;
	private UserService userservice;
    private boolean flag;
	
	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	@JSON(serialize = false)
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@JSON(serialize = false)
	public UserService getUserservice() {
		return userservice;
	}

	@Resource
	public void setUserservice(UserService userservice) {
		this.userservice = userservice;
	}

	@JSON(serialize = false)
	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}

	@Override
	public String execute() throws Exception {
		
		System.out.println(newpassword);

		HttpServletRequest request = ServletActionContext.getRequest();

		HttpSession session1 = request.getSession();

		User user1 = (User) session1.getAttribute("logUserTemp");
		
		int id = user1.getId();
		
		String usernameTemp = user1.getUsername();
		
		System.out.println(usernameTemp);

		flag = this.userservice.checkPwd(newpassword, usernameTemp);
		
		if(flag){
			userservice.updatePwd(id, user.getPassword());
		}
		
		return "success";
	}

}
