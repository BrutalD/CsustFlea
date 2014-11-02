package com.csustflea.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.csustflea.model.Technician;
import com.opensymphony.xwork2.ActionSupport;

@Component
@Scope("prototype")
public class BeTechnicistActionSmd extends ActionSupport {

	private String introduce;
	private String application;
	private String aspect;
	private int price;
	
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getApplication() {
		return application;
	}

	public void setApplication(String application) {
		this.application = application;
	}

	public String getAspect() {
		return aspect;
	}

	public void setAspect(String aspect) {
		this.aspect = aspect;
	}

	

	@Override
	public String execute() throws Exception{
		System.out.println(aspect);
		Technician t = new Technician();
		t.setTcount(0);
		t.setAspect(aspect);
		t.setApplication(application);
		t.setIntroduce(introduce);
		t.setPrice(price);
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("t", t);	
		return "success";
	}
	
}
