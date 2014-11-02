package com.csustflea.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.Validate;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.csustflea.model.User;
import com.csustflea.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

@Component
@Scope("prototype")
public class RegUserAction extends ActionSupport {
	private User user;
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

	private UserService userservice;

	@JSON(serialize = false)
	public UserService getUserservice() {
		return userservice;
	}

	@Resource(name="userservice")
	public void setUserservice(UserService userservice) {
		this.userservice = userservice;
	}

	@Override
	public String execute() throws Exception {
		  HttpServletRequest request = ServletActionContext.getRequest();
		  HttpSession session = request.getSession();
		  user = (User)session.getAttribute("smdRUser");
		  flag = this.userservice.regPUser(user);
		  return "success";
	}
	 
}
