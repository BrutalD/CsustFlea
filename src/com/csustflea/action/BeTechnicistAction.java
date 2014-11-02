package com.csustflea.action;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;
import org.apache.struts2.json.annotations.SMDMethod;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.csustflea.model.Technician;
import com.csustflea.model.User;
import com.csustflea.service.GoodsService;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

@Component
@Scope("prototype")
public class BeTechnicistAction extends ActionSupport {

	private GoodsService goodsservice;
	private boolean flag;
	private boolean[] array;
	private boolean flag1;
	
	public boolean isFlag1() {
		return flag1;
	}

	public void setFlag1(boolean flag1) {
		this.flag1 = flag1;
	}

	@JSON(serialize = false)
	public boolean[] getArray() {
		return array;
	}

	public void setArray(boolean[] array) {
		this.array = array;
	}

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}


	private String introduce;
	private String application;
	
	

	@JSON(serialize = false)
	public String getApplication() {
		return application;
	}

	public void setApplication(String application) {
		this.application = application;
	}

	@JSON(serialize = false)
	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	@JSON(serialize = false)
	public String getAspect() {
		return aspect;
	}

	public void setAspect(String aspect) {
		this.aspect = aspect;
	}

	

	private String aspect;
	private int price; 

	@JSON(serialize = false)
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	
	

	

	@JSON(serialize = false)
	/* 只需要序列化你要传的东西 */
	public GoodsService getGoodsservice() {
		return goodsservice;
	}

	@Resource
	public void setGoodsservice(GoodsService goodsservice) {
		this.goodsservice = goodsservice;
	}

	@Override
	public String execute() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Technician t =  (Technician) session.getAttribute("t");
		aspect = t.getAspect();
		price = t.getPrice();
		introduce = t.getIntroduce();
		application = t.getApplication();
		User u = (User) session.getAttribute("logUserTemp");
		int uid = u.getId();
		array = goodsservice.checkarticle(uid, price, aspect, introduce, application);
		flag = array[0];
		flag1 = array[1];
		return SUCCESS;
	}
}
