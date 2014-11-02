package com.csustflea.action;

import java.io.UnsupportedEncodingException;
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
import com.csustflea.model.Util;
import com.csustflea.service.GoodsService;
import com.opensymphony.xwork2.ActionSupport;

@Component
@Scope("prototype")
public class ListIndexPGoodsAction extends ActionSupport {

	private int page = 1;
	private int pageSize = 19;
	private long countAll;
	private int pageCount;
	private PageModel pagemodel;
	private GoodsService goodservice;
	private List<PGoods> listtemp;
	private String key;
	private String flag;

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	private List<PGoods> listsearch;

	public List<PGoods> getListsearch() {
		return listsearch;
	}

	public void setListsearch(List<PGoods> listsearch) {
		this.listsearch = listsearch;
	}

	public String getKey() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Util util = (Util) session.getAttribute("u");
		key = util.getKey();
		return key;
	}

	public void setKey(String key) throws UnsupportedEncodingException {
		this.key = new String(key.getBytes("ISO8859_1"), "UTF8");
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Util u = new Util();
		u.setKey(this.key);
		session.setAttribute("u", u);
		session.setAttribute("flag2", key);
		this.key = key;
	}

	public List<PGoods> getListtemp() {
		return listtemp;
	}

	public void setListtemp(List<PGoods> listtemp) {
		this.listtemp = listtemp;
	}

	public GoodsService getGoodservice() {
		return goodservice;
	}

	@Resource
	public void setGoodservice(GoodsService goodservice) {
		this.goodservice = goodservice;
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

	public long getCountAll() {
		return countAll;
	}

	public void setCountAll(long countAll) {
		this.countAll = countAll;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public PageModel getPagemodel() {
		return pagemodel;
	}

	@Resource
	public void setPagemodel(PageModel pagemodel) {
		this.pagemodel = pagemodel;
	}

	public String limit() {
		pagemodel.setPage(page);
		pagemodel.setPageSize(pageSize);
		List<PGoods> list = this.goodservice.ListIndexPGoods(pagemodel);
		pageCount = pagemodel.getPageCount();
		page = pagemodel.getPage();
		countAll = pagemodel.getCountAll();

		for (int i = 0; i < list.size(); i++) {
			User u = (User) this.goodservice.ListIndexPGoodsUser(
					list.get(i).getUid()).get(0);
			String address = u.getAddress();
			String phonenumber = u.getPhonenumber();
			list.get(i).setPaddress(address);
			list.get(i).setPphonenumber(phonenumber);
		}

		List<PGoods> ListCol = list;
		for (int i = 0; i < ListCol.size(); i++) 
		{
			String gname = ListCol.get(i).getPgname();
			String gname1 = null;
			if (gname.length() > 23) {
				gname1 = gname.substring(0, 23) + "..";
			} else {
				gname1 = gname;
			}
			ListCol.get(i).setPgname(gname1);
		}


		for (int i = 0; i < ListCol.size(); i++) 
		{
			String gadd = ListCol.get(i).getPaddress();
			String gadd1 = null;
			if (gadd.length() > 5) {
				gadd1 = gadd.substring(0, 4) + "..";
			} else {
				gadd1 = gadd;
			}
			ListCol.get(i).setPaddress(gadd1);
		}

		listtemp = ListCol;
		return "limit";
	}

	public String Search() throws UnsupportedEncodingException {
		System.out.println(getKey());
		String flag1 = null;
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		flag1 = (String) session.getAttribute("flag2");
		setKey(flag1);
		setFlag("flag");
		pagemodel.setPage(page);
		pagemodel.setPageSize(pageSize);
		List<PGoods> list = this.goodservice.ListIndexsearch(getKey(),
				pagemodel);
		pageCount = pagemodel.getPageCount();
		page = pagemodel.getPage();
		countAll = pagemodel.getCountAll();

		for (int i = 0; i < list.size(); i++) {
			User u = (User) this.goodservice.ListIndexPGoodsUser(
					list.get(i).getUid()).get(0);
			String address = u.getAddress();
			String phonenumber = u.getPhonenumber();
			list.get(i).setPaddress(address);
			list.get(i).setPphonenumber(phonenumber);
		}

		List<PGoods> ListCol = list;
		for (int i = 0; i < ListCol.size(); i++) 
		{
			String gname = ListCol.get(i).getPgname();
			String gname1 = null;
			if (gname.length() > 6) {
				gname1 = gname.substring(0, 5) + "...";
			} else {
				gname1 = gname;
			}
			ListCol.get(i).setPgname(gname1);
		}

		for (int i = 0; i < ListCol.size(); i++) 
		{
			String gdescb = ListCol.get(i).getPdescb();
			String gdescb1 = null;
			if (gdescb.length() > 18) {
				gdescb1 = gdescb.substring(0, 17) + "...";
			} else {
				gdescb1 = gdescb;
			}
			ListCol.get(i).setPdescb(gdescb1);
		}

		for (int i = 0; i < ListCol.size(); i++) 
		{
			String gadd = ListCol.get(i).getPaddress();
			String gadd1 = null;
			if (gadd.length() > 5) {
				gadd1 = gadd.substring(0, 4) + ".";
			} else {
				gadd1 = gadd;
			}
			ListCol.get(i).setPaddress(gadd1);
		}

		listtemp = ListCol;

		return "search";
	}

}
