package com.csustflea.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.csustflea.model.Article;
import com.csustflea.model.PageModel;
import com.csustflea.model.Technician;
import com.csustflea.service.GoodsService;
import com.opensymphony.xwork2.ActionSupport;

@Component
@Scope("prototype")
public class RepairPrefectureAction extends ActionSupport {

	private int page =1;
	
	private int pageSize = 3;
	private long countAll;
	private int pageCount;
	private PageModel pagemodel;
    private int tpage =1;
    private int tpageSize = 5;
	private long tcountAll;
	private int tpageCount;
	private PageModel tpagemodel;
	
	private List<Article> article;
	
	private List<Technician> technician; 
	
	private int articleid;
	
	private Technician tt; 
	
	private Article aa;
	
	private int uid;
	
	private int singleuid;
	
	private Technician tec;
	
	private String flag;  //这是flag是为了标记写这篇文章的用户是否为维修达人
	
	private String articleflag;  //这是flag是为了标记   在技术文章页面   写这篇文章的用户是否为维修达人
	
	public String getArticleflag() {
		return articleflag;
	}

	public void setArticleflag(String articleflag) {
		this.articleflag = articleflag;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public Technician getTec() {
		return tec;
	}

	public void setTec(Technician tec) {
		this.tec = tec;
	}

	public int getSingleuid() {
		return singleuid;
	}

	public void setSingleuid(int singleuid) {
		this.singleuid = singleuid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public Article getAa() {
		return aa;
	}

	public void setAa(Article aa) {
		this.aa = aa;
	}

	public Technician getTt() {
		return tt;
	}

	public void setTt(Technician tt) {
		this.tt = tt;
	}

	public int getArticleid() {
		return articleid;
	}

	public void setArticleid(int articleid) {
		this.articleid = articleid;
	}

	public List<Technician> getTechnician() {
		return technician;
	}

	public void setTechnician(List<Technician> technician) {
		this.technician = technician;
	}


	private GoodsService goodservice;
	
	public int getTpage() {
		return tpage;
	}

	public void setTpage(int tpage) {
		this.tpage = tpage;
	}

	public int getTpageSize() {
		return tpageSize;
	}

	public void setTpageSize(int tpageSize) {
		this.tpageSize = tpageSize;
	}

	public long getTcountAll() {
		return tcountAll;
	}

	public void setTcountAll(long tcountAll) {
		this.tcountAll = tcountAll;
	}

	public int getTpageCount() {
		return tpageCount;
	}

	public void setTpageCount(int tpageCount) {
		this.tpageCount = tpageCount;
	}

	public PageModel getTpagemodel() {
		return tpagemodel;
	}

	@Resource
	public void setTpagemodel(PageModel tpagemodel) {
		this.tpagemodel = tpagemodel;
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


	
	public GoodsService getGoodservice() {
		return goodservice;
	}

	@Resource
	public void setGoodservice(GoodsService goodservice) {
		this.goodservice = goodservice;
	}


	public List<Article> getArticle() {
		return article;
	}


	public void setArticle(List<Article> article) {
		this.article = article;
	}


	public String list(){
		pagemodel.setPage(page);
		pagemodel.setPageSize(pageSize);
		article = goodservice.listrepairarticle(pagemodel);
		pageCount = pagemodel.getPageCount();
		page = pagemodel.getPage();
		countAll = pagemodel.getCountAll();
		
		for(int i = 0;i<article.size();i++){
			Article a = article.get(i);
			String content = a.getContent();
			content=content.replaceAll("</?[^>]+>","");
			if(content.length() > 318){
				content = content.substring(0, 317) + "...";
			}
			
			
			String title = a.getTitle();
			
			if(title.length() > 16){
				title = title.substring(0 , 15) + "...";
			}
			
			String uname = a.getUname();
			
			if(uname.length() > 6){
				uname = uname.substring(0 , 5) + "...";
			}
			a.setContent(content);
			a.setTitle(title);
		    a.setUname(uname);	
			article.set(i, a);
		}
		
		tpagemodel.setPage(tpage);
		tpagemodel.setPageSize(tpageSize);
		technician = goodservice.listrepairman(tpagemodel);
		tpageCount = tpagemodel.getPageCount();
		tpage = tpagemodel.getPage();
		tcountAll = tpagemodel.getCountAll();
		
		for(int i = 0;i<technician.size();i++){
			Technician t = new Technician();
            t = technician.get(i);			
			String tname = t.getTname();
            
			if(tname.length() > 9){
				tname = tname.substring(0, 8);
			}
			int price = t.getPrice();
			String pr = price + "";
			if(pr.length() > 4 ){
				pr = pr.substring(0, 4);
				price = Integer.parseInt(pr);
			}
			String comment = t.getComment();
			if(comment.length()>77){
				comment = comment.substring(0,76);
			}
            t.setTname(tname);
            t.setPrice(price);
            t.setComment(comment);
            System.out.println(t.getUid()+"aaa");
            t.setScore(goodservice.getTecScore(t.getId()));
            t.setTcount(goodservice.getTecAmount(t.getId()));
            technician.set(i, t);
		} 
		return "list";
	}
	
	public String sarticle(){
		aa = goodservice.listsarticle(articleid);
		tt = goodservice.listtechnician(uid);
		if(tt.getTname() != null){
		int id = goodservice.getTecidByUid(uid);
		tt.setScore(goodservice.getTecScore(id));
        tt.setTcount(goodservice.getTecAmount(id));
		}
		else{
			articleflag = "flag" ;
		}
		return "sarticle";
	}
	
	public String singleperson(){
		tec = goodservice.singleperson(singleuid);
		if(tec.getTname() != null){
		int id = goodservice.getTecidByUid(singleuid);
		tec.setTcount(goodservice.getTecAmount(id));
		tec.setScore(goodservice.getTecScore(id));
		}
		else{
			flag = "flag";   //flag为1代表这个用户不是维修达人
		}
		System.out.println(flag);
		return "singleperson";
	}
	
}
