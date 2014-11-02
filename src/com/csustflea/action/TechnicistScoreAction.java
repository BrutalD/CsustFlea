package com.csustflea.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.csustflea.model.PageModel;
import com.csustflea.model.User;
import com.csustflea.model.UserAndTec;
import com.csustflea.service.GoodsService;
import com.opensymphony.xwork2.ActionSupport;

@Component
@Scope("prototype")
public class TechnicistScoreAction extends ActionSupport {

	private List<UserAndTec> uat;
	private GoodsService goodsService;
	private int score;
	private int id;
	private List<UserAndTec> uat1;
	
	private int page = 1;
	private int pageSize = 2;
	private int pageCount;
	private long countAll;
	private PageModel pagemodel;
	private String TecComment;
	private int tid;
	
	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public String getTecComment() {
		return TecComment;
	}

	public void setTecComment(String tecComment) {
		TecComment = tecComment;
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

	public long getCountAll() {
		return countAll;
	}

	public void setCountAll(long countAll) {
		this.countAll = countAll;
	}

	public List<UserAndTec> getUat1() {
		return uat1;
	}

	public void setUat1(List<UserAndTec> uat1) {
		this.uat1 = uat1;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public GoodsService getGoodsService() {
		return goodsService;
	}

	@Resource
	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}

	public List<UserAndTec> getUat() {
		return uat;
	}

	public void setUat(List<UserAndTec> uat) {
		this.uat = uat;
	}

	public String list() throws Exception {
		System.out.println(page);
		pagemodel.setPage(page);
		pagemodel.setPageSize(pageSize);
		HttpServletRequest request =  ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("logUserTemp");
		int uid = u.getId();
		uat =  goodsService.listTecscore(uid , pagemodel);
		for(int i = 0;i<uat.size();i++){
          String appname = goodsService.getAppName(uat.get(i).getTid());
          uat.get(i).setAppname(appname);
		}		
		uat1 = goodsService.listUpdateTecscore(uid);
		for(int i = 0;i<uat1.size();i++){
	          String appname = goodsService.getAppName(uat1.get(i).getTid());
	          uat1.get(i).setAppname(appname);
			}	
		pageCount = pagemodel.getPageCount();
		page = pagemodel.getPage();
		countAll = pagemodel.getCountAll();
		return "list";
	}
	
	public String postscore() throws Exception{ 
        goodsService.updateScore(id, score);
        goodsService.saveTecnicianCom(tid, TecComment);
		return "postscore";
	}
}
