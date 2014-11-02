package com.csustflea.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.csustflea.model.User;
import com.csustflea.service.GoodsService;
import com.opensymphony.xwork2.ActionSupport;

@Component
@Scope("prototype")
public class PostTecScore extends ActionSupport {

	private int tid;
	private boolean flag;
	private GoodsService goodsService;
	
	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	@JSON(serialize = false)
	public GoodsService getGoodsService() {
		return goodsService;
	}
	
	@Resource
	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}
	@JSON(serialize = false)
	public int getTid() {
		return tid;
	}
	
	public void setTid(int tid) {
		this.tid = tid;
	}
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("logUserTemp");
		int uid = u.getId();
		flag = goodsService.checkPhonenumber(uid);
		if(flag){
		goodsService.saveUserAndTec(uid, tid);}
		return "success";
	}
}
