package com.csustflea.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.csustflea.model.Collection;
import com.csustflea.model.Goods;
import com.csustflea.model.User;
import com.csustflea.service.GoodsService;
import com.csustflea.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

@Component
@Scope("prototype")
public class MyMarketAction extends ActionSupport {

	private String username;
	private int goodscount;
	private int ijoinedcount;
	private int remindmecount;
	private int articlecount;
	private GoodsService goodsService;
	private String img;
	private UserService userService;
	private Goods collection;
	private Goods mygoods;

	public Goods getCollection() {
		return collection;
	}

	public void setCollection(Goods collection) {
		this.collection = collection;
	}

	public Goods getMygoods() {
		return mygoods;
	}

	public void setMygoods(Goods mygoods) {
		this.mygoods = mygoods;
	}

	public UserService getUserService() {
		return userService;
	}

	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public GoodsService getGoodsService() {
		return goodsService;
	}
	
    @Resource
	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getGoodscount() {
		return goodscount;
	}

	public void setGoodscount(int goodscount) {
		this.goodscount = goodscount;
	}

	public int getIjoinedcount() {
		return ijoinedcount;
	}

	public void setIjoinedcount(int ijoinedcount) {
		this.ijoinedcount = ijoinedcount;
	}

	public int getRemindmecount() {
		return remindmecount;
	}

	public void setRemindmecount(int remindmecount) {
		this.remindmecount = remindmecount;
	}

	public int getArticlecount() {
		return articlecount;
	}

	public void setArticlecount(int articlecount) {
		this.articlecount = articlecount;
	}
	
	
	public int getGoodsCount(int uid){
		String hql = "from Goods g where g.uid = ?";
		int count =  goodsService.getMyMarketCount(hql, uid);
		return count;
	}
	
	
	public int getArticleCount(int uid){
		String hql = "from Article a where a.uid = ?";
		int count =  goodsService.getMyMarketCount(hql, uid);
		return count;
	}
	
	
	public int getRemindMeCount(String guname){
		String hql = "from GoodsAndComment gac where gac.guname = ? and gac.countflag = "+0+"";
		int count =  goodsService.getIJoinedCount(hql, guname);    /*这里也是调用的这个方法，得到我参与的这个数字*/
		return count;
	}

	public int getIJoinedCount(String username){
		String hql = "from GoodsAndComment gac where gac.uname = ? and gac.ijoinedflag = "+0+"";
		int count =  goodsService.getIJoinedCount(hql,username);
		return count;
	}
	
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("logUserTemp");
		img = userService.getImg(u.getId());
		System.out.println();
		username = u.getUsername();
		goodscount = this.getGoodsCount(u.getId());
		articlecount = this.getArticleCount(u.getId());
        remindmecount = this.getRemindMeCount(u.getUsername());
        ijoinedcount = this.getIJoinedCount(username);
        collection = goodsService.getMymarketCollection(u.getId());
        mygoods = goodsService.getMymarketMyGoods(u.getId());
        if(collection.getGname() != null){
        if(collection.getGname().length() > 4){
        	String gname = collection.getGname().substring(0, 4);
        	collection.setGname(gname);
        }}
        if(mygoods.getGname() != null){
        if(mygoods.getGname().length() > 4){
        	String gname = mygoods.getGname().substring(0, 4);
        	mygoods.setGname(gname);
        }}
		return "success";
	}
	
	
}
