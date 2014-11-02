package com.csustflea.service;


import java.sql.Date;
import java.util.List;

import com.csustflea.model.Article;
import com.csustflea.model.Collection;
import com.csustflea.model.Goods;
import com.csustflea.model.GoodsAndComment;
import com.csustflea.model.PGoods;
import com.csustflea.model.PageModel;
import com.csustflea.model.Technician;
import com.csustflea.model.User;
import com.csustflea.model.UserAndTec;

public interface GoodsService {

	public List<Goods> searchGoods(String key, PageModel pageModel);

	public List<Goods> getLivingGoods(PageModel pageModel , String key);

	public void addGoods(Goods goods);
	
	public Goods getGoodsById(int id);
	
	public String getUnameById(int id);
	
	public void CpGoodsInfo(Goods goods);
	
	public void CpGoodsPic(Goods goods);
	
	public List<Goods> ListGoodsMan(PageModel pagemodel,int uid);
	
    public void ListGoodsManDel(int id);
    
    public void SavePGoods(PGoods pgoods);
    
    public List<PGoods> ListPGoods(PageModel pagemodel,int uid);
    
    public void DelPGoods(int id);
    
    public List<Goods> ListCollection(PageModel pagemodel,int uid);
    
    public void SaveCGoods(Collection c);
    
    public void DelCGoods(int id);
    
    public List<PGoods> ListIndexPGoods(PageModel pagemodel);
    
    public List<User>  ListIndexPGoodsUser(int uid);
    
    public List<PGoods> ListIndexsearch(String key, PageModel pageModel);
    
    public PGoods listsinglepgoods(int id);
    
    public void technicarticle(int uid,String title,String content);
    
    public List<Article> looktechnicarticle();
    
    public void setArticleFlag(int id , String hql);
    
    public void delArticle(int id , String hql);
    
    public boolean[] checkarticle(int uid, int price,  String aspect, String introduce, String application);
    
    public List<Article> listrepairarticle(PageModel pagemodel);
    
    public List<Technician> listrepairman(PageModel tpagemodel);
    
    public Article listsarticle(int id);
    
    public Technician listtechnician(int uid);
    
    public Technician singleperson(int uid);
    
    public User pleasegoodsuser(int uid);
    
    public void saveUserAndTec(int uid,int tid); 
    
    public boolean checkPhonenumber(int uid);
    
    public List<UserAndTec> listTecscore(int uid , PageModel pagemodel);
    
    public List<UserAndTec> listUpdateTecscore(int uid);
    
    public void updateScore(int id , int score);
    
    public int getTecId(int uid);
    
    public List<UserAndTec> checkAppointment(int tid , PageModel pagemodel);
    
    public boolean checkTecFlag(int uid);
    
    public boolean checkAppFlag(int tid);
    
    public void postGoodsComments(int gid , String gname , String ucomment , Date gdate , String gtype , double gprice );
    
    public List<List<GoodsAndComment>> listComments(int gid);
    
    public List<List<GoodsAndComment>> listCommentsInIJoined(int uid);
    
    public List<List<GoodsAndComment>> listCommentsInRemindMe(String guname);
    
    public void updateComments(int id, String gucomment);
    
    public List<Technician> checkTechnician();
    
    public List<Goods> getBillBoardGoods();
    
    public List<Article> getBillBoardArticles();
    
    public void saveTecnicianCom(int id,String comment);
    
    public double getTecScore(int id);
    
    public int getTecAmount(int id);
    
    public int getTecidByUid(int uid);
    
    public int getMyMarketCount(String hql,int uid);
    
    public int getIJoinedCount(String hql, String username);  
    
    public void updateCount(String hql ,String username);   /*更新    我参与的   和    提到我的   各个数字*/
    
    public Goods getMymarketCollection(int uid);
    
    public Goods getMymarketMyGoods(int uid);
    
    public String getAppName(int tid);
    
}
