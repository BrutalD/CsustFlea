package com.csustflea.action;

import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.csustflea.model.PGoods;
import com.csustflea.model.PageModel;
import com.csustflea.model.User;
import com.csustflea.service.GoodsService;
import com.opensymphony.xwork2.ActionSupport;

@Component
@Scope("prototype")
public class ListPGoodsAction extends ActionSupport {
	private PGoods pgoods;
	private GoodsService goodsservice;
	public List<PGoods> ListGoodsManTemp;
	public int[] things;
	private int id;
	private PGoods pg;
	private int uid;
	private PageModel pagemodel;
	private int page = 1;
	private int pagesize = 8;
	
	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	private User user;
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public PGoods getPg() {
		return pg;
	}

	public void setPg(PGoods pg) {
		this.pg = pg;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int[] getThings() {
		return things;
	}

	public void setThings(int[] things) {
		this.things = things;
	}
	
	public List<PGoods> getListGoodsManTemp() {
		return ListGoodsManTemp;
	}

	public void setListGoodsManTemp(List<PGoods> listGoodsManTemp) {
		ListGoodsManTemp = listGoodsManTemp;
	}

	public GoodsService getGoodsservice() {
		return goodsservice;
	}
    
	@Resource
	public void setGoodsservice(GoodsService goodsservice) {
		this.goodsservice = goodsservice;
	}

	public PageModel getPagemodel() {
		return pagemodel;
	}
    
	@Resource
	public void setPagemodel(PageModel pagemodel) {
		this.pagemodel = pagemodel;
	}


	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

	
	public PGoods getPgoods() {
		return pgoods;
	}
	
	@Resource
	public void setPgoods(PGoods pgoods) {
		this.pgoods = pgoods;
	}
	
	public String savepgoods(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("logUserTemp");
		int uid = u.getId();
		pgoods.setUid(uid);
		Date date = new Date(System.currentTimeMillis());
		pgoods.setPgtime(date);
		this.goodsservice.SavePGoods(pgoods);
		return "savepgoods";
	}
	
	public String listpgoods(){
		HttpServletRequest request  = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User  u = (User)session.getAttribute("logUserTemp");
		int uid = u.getId();
		pagemodel.setPage(page);
		System.out.println(page);
		pagemodel.setPageSize(pagesize);
		List<PGoods> ListGoodsMan = this.goodsservice.ListPGoods(pagemodel, uid);
		page = pagemodel.getPage();
		System.out.println(page+"qwer");

		
		
		for(int i=0;i<ListGoodsMan.size();i++)                                /*Iterator<Goods> it = (Iterator)ListGoodsManTemp.iterator(); while(it.hasNext()){System.out.println(it.next().getGname());*/
		{
			String gname = ListGoodsMan.get(i).getPgname();
			String gname1 = null;
			if(gname.length()>7){
				gname1=gname.substring(0, 7)+"...";
			}
			else{gname1 = gname;}
			PGoods g = ListGoodsMan.get(i);
			g.setPgname(gname1);
		}
		
		for(int i=0;i<ListGoodsMan.size();i++)                                /*Iterator<Goods> it = (Iterator)ListGoodsManTemp.iterator(); while(it.hasNext()){System.out.println(it.next().getGname());*/
		{
			String gdescb = ListGoodsMan.get(i).getPdescb();
			String gdescb1 = null;
			if(gdescb.length()>7){
				gdescb1=gdescb.substring(0, 7)+"...";
			}
			else{gdescb1 = gdescb;}
			PGoods g = ListGoodsMan.get(i);
			g.setPdescb(gdescb1);
		} 
		ListGoodsManTemp = ListGoodsMan;
		System.out.println(ListGoodsManTemp.size()+"aaaaaaaa");
		return "listpgoods";
	}
	
	public String deletepgoods(){
		for(int i=0;i<things.length;i++)
		{
			this.goodsservice.DelPGoods(things[i]);
		}
		return "deletepgoods";
	}
	
	
	public String listsinglepgoods(){
		pg = goodsservice.listsinglepgoods(id);
		user = goodsservice.pleasegoodsuser(uid);
		return "listsinglepgoods";
	}
	
}
