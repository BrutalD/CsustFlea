package com.csustflea.action;

import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.csustflea.model.Collection;
import com.csustflea.model.Goods;
import com.csustflea.model.PageModel;
import com.csustflea.model.User;
import com.csustflea.service.GoodsService;
import com.opensymphony.xwork2.ActionSupport;

@Component
@Scope("prototype")
public class ListCollectionAction extends ActionSupport {

	private int uid;

	private static List<Goods> Goods;

	public static List<Goods> getGoods() {
		return Goods;
	}

	public static void setGoods(List<Goods> goods) {
		Goods = goods;
	}

	private Collection collection;

	private int[] things;

	private PageModel pagemodel;

	private int page;

	private int pagesize = 5;

	private List<Goods> listcollection;

	public List<Goods> getListcollection() {
		return listcollection;
	}

	public void setListcollection(List<Goods> listcollection) {
		this.listcollection = listcollection;
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

	public int[] getThings() {
		return things;
	}

	public void setThings(int[] things) {
		this.things = things;
	}

	public Collection getCollection() {
		return collection;
	}

	public void setCollection(Collection collection) {
		this.collection = collection;
	}

	private GoodsService goodservice;

	public GoodsService getGoodservice() {
		return goodservice;
	}

	@Resource
	public void setGoodservice(GoodsService goodservice) {
		this.goodservice = goodservice;
	}

	

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String list(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User u =(User)session.getAttribute("logUserTemp");
		uid = u.getId();
		pagemodel.setPage(page);
		pagemodel.setPageSize(pagesize);
		List<Goods> ListCol = this.goodservice.ListCollection(pagemodel, uid);
		page = pagemodel.getPage();
		
		
		for(int i=0;i<ListCol.size();i++)                                /*Iterator<Goods> it = (Iterator)ListGoodsManTemp.iterator(); while(it.hasNext()){System.out.println(it.next().getGname());*/
		{
			String gname = ListCol.get(i).getGname();
			String gname1 = null;
			if(gname.length()>9){
				gname1=gname.substring(0, 8)+"...";
			}
			else{gname1 = gname;}
			System.out.println(gname1);
			Goods g = ListCol.get(i);
			g.setGname(gname1);
		} 
		
		listcollection = ListCol;
		
		return "list";
	}

	public String SaveCGoods() {
		Date date = new Date(System.currentTimeMillis());
		collection.setCtime(date);
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("logUserTemp");
		int idtemp = u.getId();
		collection.setUid(idtemp);
		this.goodservice.SaveCGoods(collection);
		return "savecgoods";
	}

	public String DelCGoods() {
		for (int i = 0; i < things.length; i++) {
			this.goodservice.DelCGoods(things[i]);
		}
		return "delcgoods";
	}
	
}
