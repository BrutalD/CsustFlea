package com.csustflea.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.csustflea.model.Article;
import com.csustflea.model.User;
import com.csustflea.service.GoodsService;
import com.opensymphony.xwork2.ActionSupport;

@Component
@Scope("prototype")
public class TechnicArticle extends ActionSupport {

	private String title;
	private String content;
	private int uid;
	private String pic;
	private String flag;
	private int id;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	private GoodsService goodService;
    private List<Article> article;
	
	
	public List<Article> getArticle() {
		return article;
	}

	public void setArticle(List<Article> article) {
		this.article = article;
	}

	public GoodsService getGoodService() {
		return goodService;
	}

	@Resource
	public void setGoodService(GoodsService goodService) {
		this.goodService = goodService;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("flag1",title);
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("flag2", content);
		this.content = content;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String post() throws Exception {
		System.out.println(content);
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User u  = new User();
		u = (User)session.getAttribute("logUserTemp");
        uid = u.getId();
        goodService.technicarticle(uid, title, content);
		return "post";
	}

	public String list() {
		article = goodService.looktechnicarticle();
		return "list";
	}
	
	public String examin(){
		String hql = "update Article a set a.flag = ? where a.id = ? ";
		goodService.setArticleFlag(id,hql);
		return "examin";
	}
	
	public String delete(){
		String hql = "delete from Article a where a.id = ?";
		goodService.delArticle(id,hql);
		return "delete";
	}

}
