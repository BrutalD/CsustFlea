package com.csustflea.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.csustflea.model.Goods;
import com.csustflea.model.GoodsAndComment;
import com.csustflea.service.GoodsService;
import com.opensymphony.xwork2.ActionSupport;

@Component
@Scope("prototype")
public class GetgoodsByIdAction extends ActionSupport {

	private int goodsId;

	private Goods singleGoods;

	private GoodsService goodsService;

	private String uname;

	private List<List<GoodsAndComment>> gac;

	public List<List<GoodsAndComment>> getGac() {
		return gac;
	}

	public void setGac(List<List<GoodsAndComment>> gac) {
		this.gac = gac;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public GoodsService getGoodsService() {
		return goodsService;
	}

	@Resource
	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}

	public Goods getSingleGoods() {
		return singleGoods;
	}

	public void setSingleGoods(Goods singleGoods) {
		this.singleGoods = singleGoods;
	}

	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	@Override
	public String execute() throws Exception {
		singleGoods = new Goods();
		singleGoods = goodsService.getGoodsById(goodsId);
		gac = goodsService.listComments(goodsId);
		int uid = singleGoods.getUid();
		uname = goodsService.getUnameById(uid);
		return "getone";
	}
}
