package com.csustflea.action;

import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.csustflea.model.GoodsAndComment;
import com.csustflea.service.GoodsService;
import com.opensymphony.xwork2.ActionSupport;

@Component
@Scope("prototype")
public class PostGoodsCommentsAction extends ActionSupport {
	private String gname;
	private int gid;
	private double gprice;
	private String gtype;
	private Date gdate; 
	private String ucomment;
	private GoodsService goodsService;
	private List<List<GoodsAndComment>> gac;
	
	public double getGprice() {
		return gprice;
	}

	public void setGprice(double gprice) {
		this.gprice = gprice;
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

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public int getGid() {
		return gid;
	}

	public void setGid(int gid) {
		this.gid = gid;
	}

	public String getUcomment() {
		return ucomment;
	}

	public void setUcomment(String ucomment) {
		this.ucomment = ucomment;
	}

	public String save() throws Exception {
		goodsService.postGoodsComments(gid, gname, ucomment,gdate,gtype,gprice);
		gac = goodsService.listComments(gid);
		return "save";
	}
	
}
