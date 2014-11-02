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
public class CheckAppointmentAction extends ActionSupport {

	private int page = 1;
	private int pageSize = 5;
	private int pageCount;
	private long countAll;
	private PageModel pagemodel;
	private GoodsService goodsService;
	private List<UserAndTec> uat;
	
	
	public List<UserAndTec> getUat() {
		return uat;
	}

	public void setUat(List<UserAndTec> uat) {
		this.uat = uat;
	}

	public GoodsService getGoodsService() {
		return goodsService;
	}

	@Resource
	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
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

	public PageModel getPagemodel() {
		return pagemodel;
	}

	@Resource
	public void setPagemodel(PageModel pagemodel) {
		this.pagemodel = pagemodel;
	}
	
	
	public String list(){
		System.out.println("aaa");
		pagemodel.setPage(page);
		pagemodel.setPageSize(pageSize);
		HttpServletRequest request =  ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("logUserTemp");
		int uid = u.getId();
		int tid = goodsService.getTecId(uid);
		uat = goodsService.checkAppointment(tid,pagemodel);
		pageCount = pagemodel.getPageCount();
		page = pagemodel.getPage();
		countAll = pagemodel.getCountAll();
		return "list";
	}
}
