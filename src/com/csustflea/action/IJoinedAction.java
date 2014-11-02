package com.csustflea.action;

import java.sql.Date;
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
public class IJoinedAction extends ActionSupport {
	private GoodsService goodsService;
	private List<List<GoodsAndComment>> gac;
	private int gid;
	private String gname;
	private String gtype;
	private Date gdate;
	private double gprice;
	private String ucomment1;
	
	public String getUcomment1() {
		return ucomment1;
	}

	public void setUcomment1(String ucomment1) {
		this.ucomment1 = ucomment1;
	}

	public String getGtype() {
		return gtype;
	}

	public void setGtype(String gtype) {
		this.gtype = gtype;
	}

	public Date getGdate() {
		return gdate;
	}

	public void setGdate(Date gdate) {
		this.gdate = gdate;
	}

	public double getGprice() {
		return gprice;
	}

	public void setGprice(double gprice) {
		this.gprice = gprice;
	}

	public int getGid() {
		return gid;
	}

	public void setGid(int gid) {
		this.gid = gid;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public List<List<GoodsAndComment>> getGac() {
		return gac;
	}

	public void setGac(List<List<GoodsAndComment>> gac) {
		this.gac = gac;
	}

	public GoodsService getGoodsService() {
		return goodsService;
	}

	@Resource
	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}

	public String list() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("logUserTemp");
		int uid = u.getId();
		gac = goodsService.listCommentsInIJoined(uid);
		return "list";
	}
	
	public String save(){
		goodsService.postGoodsComments(gid, gname, ucomment1, gdate, gtype, gprice);
		return "save";
	}
	
	public String listAndUpdate(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("logUserTemp");
		int uid = u.getId();
		gac = goodsService.listCommentsInIJoined(uid);
		String hql = "update GoodsAndComment gac set gac.ijoinedflag = "+1+" where gac.uname = ? ";
		goodsService.updateCount(hql, u.getUsername());
		return "list";
	}
	
	
}
