package com.csustflea.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.csustflea.model.Goods;
import com.csustflea.model.PageModel;
import com.csustflea.model.User;
import com.csustflea.service.GoodsService;
import com.opensymphony.xwork2.ActionSupport;

@Component
@Scope("prototype")
public class ListGoodsManAction extends ActionSupport {

	private GoodsService goodsservice;
    private List<Goods> ListGoodsManTemp;
    private int[] things;
    private PageModel pagemodel;
    private int page = 1;
    private int pagesize = 16;
    
	public int[] getThings() {
		return things;
	}

	public void setThings(int[] things) {
		this.things = things;
	}

	public List<Goods> getListGoodsManTemp() {
		return ListGoodsManTemp;
	}

	public void setListGoodsManTemp(List<Goods> listGoodsManTemp) {
		ListGoodsManTemp = listGoodsManTemp;
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


	public GoodsService getGoodsservice() {
		return goodsservice;
	}

	@Resource
	public void setGoodsservice(GoodsService goodsservice) {
		this.goodsservice = goodsservice;
	}

	public String list() throws Exception {
		HttpServletRequest request  = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User  u = (User)session.getAttribute("logUserTemp");
		int uid = u.getId();
		pagemodel.setPage(page);
		pagemodel.setPageSize(pagesize);
		List<Goods> ListGoodsMan  = this.goodsservice.ListGoodsMan(pagemodel, uid);
		page = pagemodel.getPage();
		
		for(int i=0;i<ListGoodsMan.size();i++)                                /*Iterator<Goods> it = (Iterator)ListGoodsManTemp.iterator(); while(it.hasNext()){System.out.println(it.next().getGname());*/
		{
			String gname = ListGoodsMan.get(i).getGname();
			String gname1 = null;
			if(gname.length()>10){
				gname1=gname.substring(0, 9)+"...";
			}
			else{gname1 = gname;}
			Goods g = ListGoodsMan.get(i);
			g.setGname(gname1);
		}
        		
		ListGoodsManTemp = ListGoodsMan;
		return "list";
	}
	
	
	public String delete(){
		for(int i=0;i<things.length;i++)
		{
			this.goodsservice.ListGoodsManDel(things[i]);
		}
		return "delete";
	}
	
}
