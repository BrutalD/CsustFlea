package com.csustflea.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.csustflea.model.Technician;
import com.csustflea.service.GoodsService;
import com.opensymphony.xwork2.ActionSupport;

@Component
@Scope("prototype")
public class TechnicistCheckAction extends ActionSupport {

	private List<Technician> technicist;
	private GoodsService goodsService;
	private int id;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public GoodsService getGoodsService() {
		return goodsService;
	}

	@Resource
	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}


	public List<Technician> getTechnicist() {
		return technicist;
	}


	public void setTechnicist(List<Technician> technicist) {
		this.technicist = technicist;
	}


	public String list(){
		technicist = goodsService.checkTechnician();
		return "list";
	}
	
	public String examin(){
		String hql = "update Technician tec set tec.flag = ? where tec.id = ? ";
		goodsService.setArticleFlag(id, hql);
		return "examin";
	}
	
	public String delete(){
		String hql = "delete from Technician t where t.id = ?";
		goodsService.delArticle(id, hql);
		return "delete";
	}
	
}
