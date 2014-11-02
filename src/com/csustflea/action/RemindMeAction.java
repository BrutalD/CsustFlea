package com.csustflea.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.csustflea.model.GoodsAndComment;
import com.csustflea.model.User;
import com.csustflea.service.GoodsService;
import com.opensymphony.xwork2.ActionSupport;

@Component
@Scope("prototype")
public class RemindMeAction extends ActionSupport {

	private List<List<GoodsAndComment>> gac;
	private int comid;
	private String gucomment;
	public int getComid() {
		return comid;
	}

	public void setComid(int comid) {
		this.comid = comid;
	}

	public String getGucomment() {
		return gucomment;
	}

	public void setGucomment(String gucomment) {
		gucomment = gucomment.trim();
		this.gucomment = gucomment;
	}

	public List<List<GoodsAndComment>> getGac() {
		return gac;
	}

	public void setGac(List<List<GoodsAndComment>> gac) {
		this.gac = gac;
	}

	private GoodsService goodsService;
	
	public GoodsService getGoodsService() {
		return goodsService;
	}

	@Resource
	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}

	public String listandupdate(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("logUserTemp");
		String guname = u.getUsername();
		gac = goodsService.listCommentsInRemindMe(guname);
		String hql = "update GoodsAndComment gac set gac.countflag = "+1+" where gac.guname = ?";
		goodsService.updateCount(hql, u.getUsername());
        return "list";
	}
	
	public String list(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("logUserTemp");
		String guname = u.getUsername();
		gac = goodsService.listCommentsInRemindMe(guname);
		return "list";
	}
	
	
	public String save(){
		goodsService.updateComments(comid, gucomment);
		return "save";
	}
	
}
