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
import com.csustflea.model.Util;
import com.csustflea.service.GoodsService;
import com.opensymphony.xwork2.ActionSupport;

@Component
@Scope("prototype")
public class SearchAction extends ActionSupport {
	private String key;
	private int page = 1;
	private int pageSize = 14;
	private int pageCount;
	private long countAll;
	private List searchlist;
	private static List searchtemp;
	
	public static List getSearchtemp() {
		return searchtemp;
	}
	public static void setSearchtemp(List searchtemp) {
		SearchAction.searchtemp = searchtemp;
	}
	public List getSearchlist() {
		return searchlist;
	}
	public void setSearchlist(List searchlist) {
		this.searchlist = searchlist;
	}
	
	public long getCountAll() {
		return countAll;
	}
	public void setCountAll(long countAll) {
		this.countAll = countAll;
	}

	private PageModel pageModel;
	private GoodsService goodsService;

	
	public GoodsService getGoodsService() {
		return goodsService;
	}
	
	@Resource
	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}

	public String getKey() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Util util =  (Util)session.getAttribute("u");
		key = util.getKeys();
		return key;
	}

	public void setKey(String key) {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Util u = new Util();
		u.setKeys(key);
		session.setAttribute("u", u);
		this.key = key;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public PageModel getPageModel() {
		return pageModel;
	}
	
	@Resource
	public void setPageModel(PageModel pageModel) {
		this.pageModel = pageModel;
	}
	
	
	public String limit(){
		pageModel.setPage(page);
		pageModel.setPageSize(pageSize);
		List<Goods> searchList = goodsService.searchGoods(getKey(), pageModel);
		pageCount = pageModel.getPageCount();
		page = pageModel.getPage();
		countAll = pageModel.getCountAll();
		searchtemp = searchList;
        List<Goods> ListGoodsSearch = getSearchtemp();
		
		for(int i=0;i<ListGoodsSearch.size();i++)                                /*Iterator<Goods> it = (Iterator)ListGoodsManTemp.iterator(); while(it.hasNext()){System.out.println(it.next().getGname());*/
		{
			String gname = ListGoodsSearch.get(i).getGname();
			String gname1 = null;
			if(gname.length()>7){
				gname1=gname.substring(0, 6)+"...";
			}
			else{gname1 = gname;}
			Goods g = ListGoodsSearch.get(i);
			g.setGname(gname1);
		} 
		
		for(int i=0;i<ListGoodsSearch.size();i++)                                /*Iterator<Goods> it = (Iterator)ListGoodsManTemp.iterator(); while(it.hasNext()){System.out.println(it.next().getGname());*/
		{
			String gdescb = ListGoodsSearch.get(i).getGdescb();
			String gdescb1 = null;
			if(gdescb.length()>25){
				gdescb1=gdescb.substring(0, 24)+"...";
			}
			else{gdescb1 = gdescb;}
			System.out.println(gdescb1);
			Goods g = ListGoodsSearch.get(i);
			g.setGdescb(gdescb1);
		} 
		searchlist = ListGoodsSearch;
		return "limit";
	}

}
