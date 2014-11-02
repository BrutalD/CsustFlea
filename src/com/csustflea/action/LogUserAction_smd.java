package com.csustflea.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.csustflea.model.User;
import com.opensymphony.xwork2.ActionSupport;

@Component
@Scope("prototype")
public class LogUserAction_smd extends ActionSupport {

	private User user;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String execute() throws Exception {
		System.out.println("aa");
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("smdUser", user);
		return "success";
	}
}
