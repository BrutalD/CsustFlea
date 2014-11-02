package com.csustflea.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Component;

import com.csustflea.dao.GoodsDao;
import com.csustflea.model.Article;
import com.csustflea.model.Collection;
import com.csustflea.model.Goods;
import com.csustflea.model.GoodsAndComment;
import com.csustflea.model.PGoods;
import com.csustflea.model.Technician;
import com.csustflea.model.User;
import com.csustflea.model.UserAndTec;

@Component("goodsDao")
public class GoodsDaoImpl extends DaoSupport implements GoodsDao {

	public int getAllGoodsNumber(String hql) {
		Session session = this.getSession();
		int countAll = 0;
		try {
			countAll = session.createQuery(hql).list().size();
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return countAll;
	}

	public List<Goods> getAllGoods(int startIndex, int pageSize, String hql) {
		Session session = this.getSession();
		List<Goods> allGoods = null;
		try {
			allGoods = session.createQuery(hql).setFirstResult(startIndex)
					.setMaxResults(pageSize).list();
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		} finally {
			if (session != null)
				session.close();
		}
		return allGoods;
	}

	public void addGoods(Goods goods) {
		Session session = this.getSession();
		try {
			session.save(goods);
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		} finally {
			if (session != null)
				session.close();
		}
	}

	public Goods getGoodsById(String hql) {
		Goods goods = null;
		Session session = this.getSession();
		try {
			goods = (Goods) session.createQuery(hql).list().iterator().next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return goods;
	}

	@Override
	public void CpGoodsInfo(Goods goods) {
		Session session = this.getSession();
		session.beginTransaction();
		session.save(goods);
		session.beginTransaction().commit();
		String hql = "from Goods g where g.gname = ?  and g.gprice = ? and g.gdescb = ? and g.gtype = ? and g.uid = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, goods.getGname());
		query.setParameter(1, goods.getGprice());
		query.setParameter(2, goods.getGdescb());
		query.setParameter(3, goods.getGtype());
		query.setParameter(4, goods.getUid());
		List<Goods> listgoods = query.list();
		Goods goodstemp = listgoods.get(0);
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session1 = request.getSession();
		session1.setAttribute("listgoodsinfo", goodstemp);
		session.close();
	}

	@Override
	public Goods CpGoodsPic(Goods goods) {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session1 = request.getSession();
		Goods g=   (Goods) session1.getAttribute("listgoodsinfo");
		return g;
	}

	@Override
	public List<Goods> ListGoodsMan(int pagesize,int pageindex,int uid) {
		Session session = this.getSession();
		String hql = "from Goods g where g.uid = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, uid);
		List<Goods> g = query.setFirstResult(pageindex).setMaxResults(pagesize).list();
		session.close();
		return g;
	}
	
	@Override
	public List<Goods> ListPGoods(int pagesize,int pageindex,int uid) {
		Session session = this.getSession();
		String hql = "from PGoods pg where pg.uid = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, uid);
		List<Goods> g = query.setFirstResult(pageindex).setMaxResults(pagesize).list();
		session.close();
		return g;
	}

	@Override
	public List<Collection> ListCollection(int pagesize,int pageindex,int uid) {
		Session session = this.getSession();
		String hql = "from Collection c where c.uid = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, uid);
		List<Collection> collection = query.setFirstResult(pageindex).setMaxResults(pagesize).list();
		session.close();
		return collection;
	}

	@Override
	public List<PGoods> ListIndexPGoods(int pagesize, int pageindex) {
		Session session = this.getSession();
		String hql = "from PGoods";
		List<PGoods> pg = null;
		try {
			Query query = session.createQuery(hql);
			 pg = query.setFirstResult(pageindex).setMaxResults(pagesize).list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return pg;
	}
	
	
	public List<PGoods> ListIndexsearch(int startIndex, int pageSize, String hql) {
		Session session = this.getSession();
		List<PGoods> allGoods = null;
		try {
			allGoods = session.createQuery(hql).setFirstResult(startIndex)
					.setMaxResults(pageSize).list();
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		} finally {
			if (session != null)
				session.close();
		}
		return allGoods;
	}

	@Override
	public void checkarticle(int uid, int price, String aspect,
	    String introduce, String application) {
		Technician t = new Technician();
		t.setUid(uid);
		t.setAspect(aspect);
		t.setIntroduce(introduce);
		t.setPrice(price);
		t.setApplication(application);
		t.setIdenty("技术达人 维修达人");
		t.setFlag("0");
		t.setTcount(0);
		Session session1 = this.getSession();
		session1.beginTransaction();
		session1.save(t);
		session1.beginTransaction().commit();
		session1.close();
	}

	@Override
	public List<Article> listrepairearticle(int pagesize, int pageindex) {
		Session session = this.getSession();
		String hql = "from Article a where a.flag = ? order by id desc";
		Query query = session.createQuery(hql);
		query.setParameter(0, "1");
		List<Article> a = query.setFirstResult(pageindex).setMaxResults(pagesize).list();
		List<Article> temp = new ArrayList();
		
		for(int i = 0;i<a.size();i++){
			Article article = a.get(i);
			int uid = article.getUid();
			String hql1 = "from User u where u.id = ?";
			Query query1 = session.createQuery(hql1);
			query1.setInteger(0, uid);
			List<User> user1 = query1.list();
			User u =  user1.get(0);
			String name = u.getUsername();
			String img = u.getImage();
			session.beginTransaction();
			String hql2 = "update Article a set a.uname = ? , a.uimg = ?  where a.uid = ?";
			Query query2 = session.createQuery(hql2);
			query2.setParameter(0, name);
			query2.setString(1, img);
			query2.setParameter(2, uid);
			query2.executeUpdate();
			session.beginTransaction().commit();
		}
		session.close();
		return a;
	}

	@Override
	public List<Technician> listrepairman(int pagesize, int pageindex) {
		Session session = this.getSession();
		String hql = "from Technician t where t.flag = "+1+" ";
		Query query = session.createQuery(hql);
		List<Technician> t = query.setFirstResult(pageindex).setMaxResults(pagesize).list();
		
		for(int i=0;i<t.size();i++){
			Technician technician = t.get(i);
			int uid = technician.getUid();
			String hql1 = "from User u where u.id = ?";
			Query query1 = session.createQuery(hql1);
			query1.setInteger(0, uid);
			List<User> user1 = query1.list();
			User u =  user1.get(0);
			String name = u.getUsername();
			String img = u.getImage();
			String realname = u.getRealname();
			session.beginTransaction();
			String hql2 = "update Technician a set a.tname = ? , a.timg = ? , a.trealname = ? where a.uid = ?";
			Query query2 = session.createQuery(hql2);
			query2.setParameter(0, name);
			query2.setString(1, img);
			query2.setParameter(2 , realname);
			query2.setParameter(3, uid);
			query2.executeUpdate();
			session.beginTransaction().commit();
		}
		session.close();
		return t;
	}

	@Override
	public void saveUserAndTec(UserAndTec ut) {
		Session session = this.getSession();
		session.beginTransaction();
		session.save(ut);
		session.beginTransaction().commit();
		session.close();
	}

	@Override
	public List<UserAndTec> listTecscore(int pagesize, int pageindex, int uid , String hql ) {
		Session session = this.getSession();
		Query query = session.createQuery(hql);
		query.setParameter(0, uid);
		query.setParameter(1, 0);
		List<UserAndTec> uat = query.setFirstResult(pageindex).setMaxResults(pagesize).list();
		session.close();
		return uat;
	}

	@Override
	public List<UserAndTec> checkAppointment(int pagesize, int pageindex,
			int tid, String hql) {
		Session session = this.getSession();
		Query query = session.createQuery(hql);
		query.setParameter(0, tid);
		List<UserAndTec> uat = query.setFirstResult(pageindex).setMaxResults(pagesize).list();
		session.close();
		return uat;
	}

	@Override
	public String findGname(int gid) {
		System.out.println(gid+"qwe");
		Session session = this.getSession();
		String hql = "from Goods g where g.id = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, gid);
		List<Goods> goods = query.list();
		Goods good = goods.get(0);
		int uid = good.getUid();
		String hql1 = "from User u where u.id ="+uid;
		Query query1 = session.createQuery(hql1);
		List<User> u = query1.list();
		User user = u.get(0);
		String gname = user.getUsername();
		System.out.println(gname);
		session.close();
		return gname;
	}
	
	public void saveGoodsComments(GoodsAndComment gac){
		Session session = this.getSession();
		session.beginTransaction();
		session.save(gac);
        session.beginTransaction().commit();
        session.close();
	}

	@Override
	public Goods getMymarketCollection(int id) {
		Session session = this.getSession();
		String hql = "from Goods g where g.id = "+id+"";
		Query query = session.createQuery(hql);
		List<Goods> goods = query.list();
		session.close();
		return goods.get(0);
	}
	
}
