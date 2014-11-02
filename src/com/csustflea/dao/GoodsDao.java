package com.csustflea.dao;

import java.util.List;

import com.csustflea.model.Article;
import com.csustflea.model.Collection;
import com.csustflea.model.Goods;
import com.csustflea.model.GoodsAndComment;
import com.csustflea.model.PGoods;
import com.csustflea.model.Technician;
import com.csustflea.model.UserAndTec;

public interface GoodsDao {
	public int getAllGoodsNumber(String hql);

	public List<Goods> getAllGoods(int startIndex, int pageSize, String hql);

	public void addGoods(Goods goods);
	
	public Goods getGoodsById(String hql);
	
	public void CpGoodsInfo(Goods goods);
	
	public Goods CpGoodsPic(Goods goods);
	
	public List<Goods> ListGoodsMan(int pagesize,int pageindex,int uid);
	
	public List<Goods> ListPGoods(int pagesize,int pageindex,int uid);
	
	public List<Collection> ListCollection(int pagesize,int pageindex,int uid);
	
	public List<PGoods> ListIndexPGoods(int pagesize,int pageindex);
	
	public List<PGoods> ListIndexsearch(int startIndex, int pageSize, String hql);
	
	public void checkarticle(int uid, int price,  String aspect, String introduce, String application);
	
	public List<Article> listrepairearticle(int pagesize , int pageindex);
	
	public List<Technician> listrepairman(int pagesize , int pageindex);
	
	public void saveUserAndTec(UserAndTec ut);  
	
	public List<UserAndTec> listTecscore(int pagesize,int pageindex,int uid ,String hql);
	
	public List<UserAndTec> checkAppointment(int pagesize,int pageindex,int tid ,String hql);
	
	public String findGname(int gid);
	
	public void saveGoodsComments(GoodsAndComment gac);
	
	public Goods getMymarketCollection(int id);
}
