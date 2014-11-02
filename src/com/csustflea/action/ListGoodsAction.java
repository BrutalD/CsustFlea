package com.csustflea.action;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.csustflea.model.Article;
import com.csustflea.model.Goods;
import com.csustflea.model.GoodsAndComment;
import com.csustflea.model.PageModel;
import com.csustflea.model.Util;
import com.csustflea.service.GoodsService;
import com.opensymphony.xwork2.ActionSupport;

@Component
@Scope("prototype")
/* 这里使用多例的话，就会避免出现了setpage的问题，但是即使是成员变量也会出现空指针的异常,尽量少使用redirect */
public class ListGoodsAction extends ActionSupport {

	private GoodsService goodsService;
	private int page = 1;
	private int pageSize = 16;
	private PageModel pageModel;
	private int pageCount;
	private List<Goods> livingtemp = null;

	private List<Goods> livinggoods;
	private String key;
	private String flag;
	private String uname;
    private List<Goods> billboardGoods;
    private List<Article> billboardArticles;
	
	public List<Article> getBillboardArticles() {
		return billboardArticles;
	}

	public void setBillboardArticles(List<Article> billboardArticles) {
		this.billboardArticles = billboardArticles;
	}

	public List<Goods> getBillboardGoods() {
		return billboardGoods;
	}

	public void setBillboardGoods(List<Goods> billboardGoods) {
		this.billboardGoods = billboardGoods;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getFlag() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Util util = (Util) session.getAttribute("u");
		flag = util.getFl();
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Util u = new Util();
		u.setFl(flag);
		session.setAttribute("u", u);
	}

	public String getKey() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Util util = (Util) session.getAttribute("uu");
		key = util.getKey();
		return key;
	}

	public void setKey(String key) throws UnsupportedEncodingException {
		this.key = new String(key.getBytes("ISO8859_1"), "UTF8"); /* 对jsp页面传过来的中文进行解码 */
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Util uu = new Util();
		uu.setKey(this.key);
		session.setAttribute("uu", uu);
	}

	public List<Goods> getLivingtemp() {
		return livingtemp;
	}

	public void setLivingtemp(List<Goods> livingtemp) {
		this.livingtemp = livingtemp;
	}

	public List<Goods> getLivinggoods() {
		return livinggoods;
	}

	public void setLivinggoods(List<Goods> livinggoods) {
		this.livinggoods = livinggoods;
	}

	private int goodsId;
	private Goods singleGoods;

	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	public Goods getSingleGoods() {
		return singleGoods;
	}

	public void setSingleGoods(Goods singleGoods) {
		this.singleGoods = singleGoods;
	}

	public PageModel getPageModel() {
		return pageModel;
	}

	@Resource
	public void setPageModel(PageModel pageModel) {
		this.pageModel = pageModel;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
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

	public GoodsService getGoodsService() {
		return goodsService;
	}

	@Resource
	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}

	public String execute() {
		flag = getFlag();
		key = getKey();
		System.out.println(key);
		pageModel.setPage(page);
		pageModel.setPageSize(pageSize);
		List<Goods> allgoods = goodsService.getLivingGoods(pageModel, key);
		pageCount = pageModel.getPageCount();
		page = pageModel.getPage();
		if (page > pageCount)
			page = pageCount;

		livingtemp = allgoods;


		List<Goods> ListGoodsLiving = null;
		ListGoodsLiving = livingtemp;

		for (int i = 0; i < ListGoodsLiving.size(); i++) 
		{
			String gname = ListGoodsLiving.get(i).getGname();
			String gname1 = null;
			if (gname.length() > 6) {
				gname1 = gname.substring(0, 5) + "..";
			} else {
				gname1 = gname;
			}
			Goods g = ListGoodsLiving.get(i);
			g.setGname(gname1);
		}

		for (int i = 0; i < ListGoodsLiving.size(); i++) 
		{
			String gprice = String.valueOf(ListGoodsLiving.get(i).getGprice()); /* 将doubel转化为String类型 */
			String gprice1 = null;
			if (gprice.length() > 6) {
				gprice1 = gprice.substring(0, 5);
			} else {
				gprice1 = gprice;
			}
			Goods g = ListGoodsLiving.get(i);
			Double d = Double.valueOf(gprice1).doubleValue();
			g.setGprice(d);
		}
		livinggoods = ListGoodsLiving;
		billboardGoods = goodsService.getBillBoardGoods();
		for (int i = 0; i < billboardGoods.size(); i++) 
		{
			String gname = billboardGoods.get(i).getGname();
			String gname1 = null;
			if (gname.length() > 8) {
				gname1 = gname.substring(0, 7) + "..";
			} else {
				gname1 = gname;
			}
			Goods g = billboardGoods.get(i);
			g.setGname(gname1);
		}
		billboardArticles = goodsService.getBillBoardArticles();
		for (int i = 0; i < billboardArticles.size(); i++) 
		{
			String title = billboardArticles.get(i).getTitle();
			String title1 = null;
			if (title.length() > 9) {
				title1 = title.substring(0, 8) + "..";
			} else {
				title1 = title;
			}
			Article a = billboardArticles.get(i);
			a.setTitle(title1);
		}
		return flag;
	}

	public String getGoodsById() {
		singleGoods = new Goods();
		singleGoods = goodsService.getGoodsById(goodsId);
		return "getone";
	}

}
