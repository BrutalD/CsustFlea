package com.csustflea.service.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.csustflea.dao.GoodsDao;
import com.csustflea.model.Article;
import com.csustflea.model.Collection;
import com.csustflea.model.Goods;
import com.csustflea.model.GoodsAndComment;
import com.csustflea.model.PGoods;
import com.csustflea.model.PageModel;
import com.csustflea.model.Technician;
import com.csustflea.model.User;
import com.csustflea.model.UserAndTec;
import com.csustflea.service.GoodsService;

@Component("goodsService")
public class GoodsServiceImpl implements GoodsService {
	private GoodsDao goodsDao;
	private SessionFactory sessionfactory;

	public SessionFactory getSessionfactory() {
		return sessionfactory;
	}

	@Resource(name = "sessionFactory")
	public void setSessionfactory(SessionFactory sessionfactory) {
		this.sessionfactory = sessionfactory;
	}

	public GoodsDao getGoodsDao() {
		return goodsDao;
	}

	@Resource
	public void setGoodsDao(GoodsDao goodsDao) {
		this.goodsDao = goodsDao;
	}

	public List<Goods> searchGoods(String key, PageModel pageModel) {
		List<Goods> allgoods = null;
		String hql = "from Goods where gname like '%" + key + "%'";
		int countAll = goodsDao.getAllGoodsNumber(hql);
		pageModel.setCountAll(countAll);
		int page = pageModel.getPage();
		int pageSize = pageModel.getPageSize();
		int pageCount = pageModel.getPageCount();

		if (pageSize > countAll) {
			pageSize = countAll;
		}

		if (page > pageCount) {
			page = pageCount;
			pageModel.setPage(page);
		}

		int startIndex = (int) ((page - 1) * pageSize);
		allgoods = goodsDao.getAllGoods(startIndex, pageSize, hql);
		return allgoods;
	}

	public List<Goods> getLivingGoods(PageModel pageModel, String key) {
		List<Goods> allgoods = null;
		String hql = "from Goods as thing where thing.gtype= ?";
		Session session = this.sessionfactory.openSession();
		Query query = session.createQuery(hql);
		query.setParameter(0, key);
		int countAll = query.list().size();
		pageModel.setCountAll(countAll);

		System.out.println(countAll);

		int page = pageModel.getPage();
		int pageSize = pageModel.getPageSize();
		int pageCount = pageModel.getPageCount();

		if (pageSize > countAll) {
			pageSize = countAll;
		}

		if (page > pageCount) {
			page = pageCount;
		}

		int startIndex = (int) ((page - 1) * pageSize);
		allgoods = query.setFirstResult(startIndex).setMaxResults(pageSize)
				.list();
		session.close();
		return allgoods;
	}

	public void addGoods(Goods goods) {
		goodsDao.addGoods(goods);
	}

	public Goods getGoodsById(int id) {
		Goods goods = null;
		String hql = "from Goods as thing where thing.id=" + id;
		goods = goodsDao.getGoodsById(hql);
		return goods;
	}
	
	public String getUnameById(int id){
		Session session = this.sessionfactory.openSession();
		String hql = "from User u where u.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, id);
		List<User> user = query.list();
		return user.get(0).getUsername();
	}
	
	@Override
	public void CpGoodsInfo(Goods goods) {
		this.goodsDao.CpGoodsInfo(goods);
	}

	@Override
	public void CpGoodsPic(Goods goods) {
		Goods g = this.goodsDao.CpGoodsPic(goods);
		g.setGpic(goods.getGpic());
		g.setGpic2(goods.getGpic2());
		g.setGpic3(goods.getGpic3());
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session1 = request.getSession();
		session1.setAttribute("listgoodsinfo", g);
		Session session = sessionfactory.openSession();
		session.beginTransaction();
		session.update(g);
		session.beginTransaction().commit();
		session.close();
	}

	@Override
	public List<Goods> ListGoodsMan(PageModel pagemodel, int uid) {
		Session session = this.sessionfactory.openSession();
		String hql = "from Goods g where g.uid=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, uid);
		int countall = query.list().size();
		pagemodel.setCountAll(countall);
		session.close();
		int page = pagemodel.getPage();
		int pagesize = pagemodel.getPageSize();
		int pagecount = pagemodel.getPageCount();
		if (page > pagecount) {
			page = pagecount;
			pagemodel.setPage(page); /*
									 * 这里是为了将page
									 * set回去，当传到页面的时候就不会出现page=10之类的东西
									 */
		}
		;
		if (pagesize > countall) {
			pagesize = countall;
		}
		;
		int pageindex = (page - 1) * pagesize;
		System.out.println(pagecount + "a");
		return ((List) this.goodsDao.ListGoodsMan(pagesize, pageindex, uid));
	}

	@Override
	public void ListGoodsManDel(int id) {
		Session session = this.sessionfactory.openSession();
		session.beginTransaction();
		String hql = "delete from Goods g where g.id = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, id);
		query.executeUpdate();
		session.beginTransaction().commit();
		session.close();
	}

	@Override
	public void SavePGoods(PGoods pgoods) {
		Session session = this.sessionfactory.openSession();
		session.beginTransaction();
		session.save(pgoods);
		session.beginTransaction().commit();
		session.close();
	}

	@Override
	public List<PGoods> ListPGoods(PageModel pagemodel, int uid) {
		Session session = this.sessionfactory.openSession();
		String hql = "from PGoods pg where pg.uid=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, uid);
		int countall = query.list().size();
		pagemodel.setCountAll(countall);
		session.close();
		int page = pagemodel.getPage();
		int pagesize = pagemodel.getPageSize();
		int pagecount = pagemodel.getPageCount();
		if (page > pagecount) {
			page = pagecount;
			pagemodel.setPage(page); /*
									 * 这里是为了将page
									 * set回去，当传到页面的时候就不会出现page=10之类的东西
									 */
		}
		;
		if (pagesize > countall) {
			pagesize = countall;
		}
		;
		int pageindex = (page - 1) * pagesize;
		return (List) this.goodsDao.ListPGoods(pagesize, pageindex, uid);
	}

	@Override
	public void DelPGoods(int id) {
		Session session = this.sessionfactory.openSession();
		session.beginTransaction();
		String hql = "delete from PGoods pg where pg.id = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, id);
		query.executeUpdate();
		session.beginTransaction().commit();
		session.close();
	}

	@Override
	public List<Goods> ListCollection(PageModel pagemodel, int uid) {
		Session session = this.sessionfactory.openSession();
		String hql = "from Collection c where c.uid=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, uid);
		int countall = query.list().size();
		pagemodel.setCountAll(countall);
		session.close();
		int page = pagemodel.getPage();
		int pagesize = pagemodel.getPageSize();
		int pagecount = pagemodel.getPageCount();
		if (page > pagecount) {
			page = pagecount;
			pagemodel.setPage(page); /*
									 * 这里是为了将page
									 * set回去，当传到页面的时候就不会出现page=10之类的东西
									 */
		}
		;
		if (pagesize > countall) {
			pagesize = countall;
		}
		;
		int pageindex = (page - 1) * pagesize;
		System.out.println(countall + "b");

		List<Collection> collection = (List) this.goodsDao.ListCollection(
				pagesize, pageindex, uid);

		List<Goods> arraygoods = new ArrayList<Goods>();
		for (int i = 0; i < collection.size(); i++) {
			List<Goods> listgoods = new ArrayList<Goods>();
			Goods good = new Goods();
			Session session1 = this.sessionfactory.openSession();
			String hql1 = "from Goods g where g.id = ?";
			Query query1 = session1.createQuery(hql1);
			int gid = collection.get(i).getGid();
			query1.setParameter(0, gid);
			listgoods = (List) query1.list();
			good = listgoods.get(0);
			arraygoods.add(i, good);
			session1.close();
		}
		return arraygoods;
	}

	@Override
	public void SaveCGoods(Collection c) {
		Session session = this.sessionfactory.openSession();
		session.beginTransaction();
		session.save(c);
		session.beginTransaction().commit();
		session.close();
	}

	@Override
	public void DelCGoods(int id) {
		Session session = this.sessionfactory.openSession();
		session.beginTransaction();
		String hql = "delete from Collection c where c.gid = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, id);
		query.executeUpdate();
		session.beginTransaction().commit();
		session.close();
	}

	@Override
	public List<PGoods> ListIndexPGoods(PageModel pagemodel) {
		Session session = this.sessionfactory.openSession();
		String hql = "from PGoods";
		Query query = session.createQuery(hql);
		int countall = query.list().size();
		pagemodel.setCountAll(countall);
		session.close();
		int page = pagemodel.getPage();
		int pagesize = pagemodel.getPageSize();
		int pagecount = pagemodel.getPageCount();
		if (page > pagecount) {
			page = pagecount;
			pagemodel.setPage(page); /*
									 * 这里是为了将page
									 * set回去，当传到页面的时候就不会出现page=10之类的东西
									 */
		}
		;
		if (pagesize > countall) {
			pagesize = countall;
		}
		;
		int pageindex = (page - 1) * pagesize;
		return (List) this.goodsDao.ListIndexPGoods(pagesize, pageindex);
	}

	public List<PGoods> ListIndexsearch(String key, PageModel pageModel) {

		List<PGoods> allgoods = null;
		String hql = "from PGoods where pgname like '%" + key + "%'";
		int countAll = goodsDao.getAllGoodsNumber(hql);
		pageModel.setCountAll(countAll);
		int page = pageModel.getPage();
		int pageSize = pageModel.getPageSize();
		int pageCount = pageModel.getPageCount();
		System.out.println(countAll);
		System.out.println(page);
		System.out.println(pageSize);
		System.out.println(pageCount);

		if (pageSize > countAll) {
			pageSize = countAll;
		}

		if (page > pageCount) {
			page = pageCount;
			pageModel.setPage(page);
		}

		int startIndex = (int) ((page - 1) * pageSize);
		allgoods = goodsDao.ListIndexsearch(startIndex, pageSize, hql);
		return allgoods;
	}

	@Override
	public List<User> ListIndexPGoodsUser(int uid) {
		Session session = this.sessionfactory.openSession();
		String hql = "from User u where u.id = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, uid);
		List<User> u = query.list();
		session.close();
		return u;
	}

	@Override
	public void technicarticle(int uid, String title, String content) {
		Session session = this.sessionfactory.openSession();
		session.beginTransaction();
		Article a = new Article();
		a.setUid(uid);
		a.setContent(content);
		a.setTitle(title);
		a.setFlag("0");
		a.setAidenty("技术达人");
		Date adate = new Date(System.currentTimeMillis());
		a.setAdate(adate);
		session.save(a);
		session.beginTransaction().commit();
		session.close();
	}

	@Override
	public List<Article> looktechnicarticle() {
		Session session = this.sessionfactory.openSession();
		String hql = "from Article a where a.flag = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, "0");
		List<Article> a = query.list();
		session.close();
		return a;
	}

	@Override
	public void setArticleFlag(int id ,String hql) {
		Session session = this.sessionfactory.openSession();
		session.beginTransaction();
		Query query = session.createQuery(hql);
		query.setParameter(0, "1");
		query.setParameter(1, id);
		query.executeUpdate();
		session.beginTransaction().commit();
		session.close();
	}

	@Override
	public void delArticle(int id , String hql) {
		Session session = this.sessionfactory.openSession();
		session.beginTransaction();
		Query query = session.createQuery(hql);
		query.setParameter(0, id);
		query.executeUpdate();
		session.beginTransaction().commit();
		session.close();
	}

	@Override
	public boolean[] checkarticle(int uid, int price, String aspect,
			String introduce, String application) {
		Session session = this.sessionfactory.openSession();
		String hql = "from Article a where a.uid = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, uid);
		List<Article> a = query.list();

		String hql1 = "from Technician t where t.uid = ?";
		Query query1 = session.createQuery(hql1);
		query1.setParameter(0, uid);
		List<Technician> t = query1.list();
		session.close();
		boolean article = a.isEmpty();
		boolean technician = t.isEmpty();
		boolean[] all = new boolean[2];
		if (!article && technician) {
			goodsDao.checkarticle(uid, price, aspect, introduce, application);
			all[0] = article;
			all[1] = technician;
			return all;
		} else {
			all[0] = article;
			all[1] = technician;
			return all;
		}
	}

	@Override
	public List<Article> listrepairarticle(PageModel pagemodel) {
		Session session = this.sessionfactory.openSession();
		String hql = "from Article";
		Query query = session.createQuery(hql);
		int countall = query.list().size();
		pagemodel.setCountAll(countall);
		session.close();
		int page = pagemodel.getPage();
		int pagesize = pagemodel.getPageSize();
		int pagecount = pagemodel.getPageCount();
		if (page > pagecount) {
			page = pagecount;
			pagemodel.setPage(page); /*
									 * 这里是为了将page
									 * set回去，当传到页面的时候就不会出现page=10之类的东西
									 */
		}
		;
		if (pagesize > countall) {
			pagesize = countall;
		}
		;
		int pageindex = (page - 1) * pagesize;

		List<Article> a = goodsDao.listrepairearticle(pagesize, pageindex);
		return a;
	}

	@Override
	public List<Technician> listrepairman(PageModel tpagemodel) {
		Session session = this.sessionfactory.openSession();
		String hql = "from Technician";
		Query query = session.createQuery(hql);
		int countall = query.list().size();
		tpagemodel.setCountAll(countall);
		session.close();
		int page = tpagemodel.getPage();
		int pagesize = tpagemodel.getPageSize();
		int pagecount = tpagemodel.getPageCount();
		if (page > pagecount) {
			page = pagecount;
			tpagemodel.setPage(page); /*
									 * 这里是为了将page
									 * set回去，当传到页面的时候就不会出现page=10之类的东西
									 */
		}
		;
		if (pagesize > countall) {
			pagesize = countall;
		}
		;
		int pageindex = (page - 1) * pagesize;

		List<Technician> t = goodsDao.listrepairman(pagesize, pageindex);
		return t;
	}

	@Override
	public Article listsarticle(int id) {
		Session session = this.sessionfactory.openSession();
		String hql = "from Article a where a.id = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, id);
		List<Article> a = query.list();
		Article article = a.get(0);
		session.close();
		return article;
	}

	@Override
	public Technician listtechnician(int uid) {
		Session session = this.sessionfactory.openSession();
		String hql = "from Technician t where t.uid = ? ";
		Query query = session.createQuery(hql);
		query.setParameter(0, uid);
		List<Technician> tt = query.list();
		Technician technician = new Technician();
		if(tt.size() > 0){
		 technician = tt.get(0);
		}
		session.close();
		return technician;
	}

	@Override
	public Technician singleperson(int uid) {
		Session session = this.sessionfactory.openSession();
		String hql = "from Technician t where t.uid = ? ";
		Query query = session.createQuery(hql);
		query.setParameter(0, uid);
		List<Technician> tt = query.list();
		Technician technician = new Technician();
		if(tt.size() > 0){
			technician = tt.get(0);
		}
		session.close();
		return technician;
	}

	@Override
	public PGoods listsinglepgoods(int id) {
		Session session = this.sessionfactory.openSession();
		String hql = "from PGoods p where p.id = ? ";
		Query query = session.createQuery(hql);
		query.setParameter(0, id);
		List<PGoods> pgoods = query.list();
		PGoods pg = pgoods.get(0);
		session.close();
		return pg;
	}

	@Override
	public User pleasegoodsuser(int uid) {
		Session session = this.sessionfactory.openSession();
		String hql = "from User u where u.id = ? ";
		Query query = session.createQuery(hql);
		query.setParameter(0, uid);
		List<User> user = query.list();
		User u = user.get(0);
		session.close();
		return u;
	}

	@Override
	public void saveUserAndTec(int uid, int tid) {
		Session session = this.sessionfactory.openSession();
		String hql = "from User u where u.id = ? ";
		Query query = session.createQuery(hql);
		query.setParameter(0, uid);
		List<User> user = query.list();
		User u = user.get(0);
		UserAndTec ut = new UserAndTec();
		ut.setUname(u.getUsername());
		ut.setTid(tid);
		ut.setUid(uid);
		ut.setTscore(0);
		ut.setUnumber(u.getPhonenumber());
		ut.setUtdate(new Date(System.currentTimeMillis()));
		goodsDao.saveUserAndTec(ut);
		session.close();
	}

	@Override
	public boolean checkPhonenumber(int uid) {
		Session session = this.sessionfactory.openSession();
		String hql = "from User u where u.id = ? ";
		Query query = session.createQuery(hql);
		query.setParameter(0, uid);
		List<User> user = query.list();
		User u = user.get(0);
		session.close();
		if (u.getPhonenumber() != null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List<UserAndTec> listTecscore(int uid, PageModel pagemodel) {
		Session session = this.sessionfactory.openSession();
		String hql = "from UserAndTec uat where uat.uid = ? and uat.tscore = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, uid);
		query.setParameter(1, 0);
		int countall = query.list().size();
		pagemodel.setCountAll(countall);
		session.close();
		int page = pagemodel.getPage();
		int pagesize = pagemodel.getPageSize();
		int pagecount = pagemodel.getPageCount();
		if (page > pagecount) {
			page = pagecount;
			pagemodel.setPage(page); /*
									 * 这里是为了将page
									 * set回去，当传到页面的时候就不会出现page=10之类的东西
									 */
		};
		if (pagesize > countall) {
			pagesize = countall;
		};
		int pageindex = (page - 1) * pagesize;

		List<UserAndTec> uat = goodsDao.listTecscore(pagesize, pageindex, uid,
				hql);

		
		return uat;
	}

	@Override
	public void updateScore(int id, int score) {
		Session session = this.sessionfactory.openSession();
		session.beginTransaction();
		String hql = "update UserAndTec uat set uat.tscore = ? where uat.id = ? ";
		Query query = session.createQuery(hql);
		query.setParameter(0, score);
		query.setParameter(1, id);
		query.executeUpdate();
		session.beginTransaction().commit();
		session.close();
	}

	@Override
	public List<UserAndTec> listUpdateTecscore(int uid) {
		Session session = this.sessionfactory.openSession();
		String hql = "from UserAndTec uat where uat.uid = ? and uat.tscore != ? ORDER BY id desc ";
		Query query = session.createQuery(hql);
		query.setMaxResults(2);
		query.setParameter(0, uid);
		query.setParameter(1, 0);
		List<UserAndTec> uat = query.list();
		session.close();
		return uat;
	}

	@Override
	public int getTecId(int uid) {
		Session session = this.sessionfactory.openSession();
		String hql = "from Technician t where t.uid = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, uid);
		List<Technician> t = query.list();
		session.close();
		if(t.size() > 0){
			return t.get(0).getId();
		}
		else{
			return 0;
		}
	}

	@Override
	public List<UserAndTec> checkAppointment(int tid,PageModel pagemodel) {
		Session session = this.sessionfactory.openSession();
		String hql = "from UserAndTec uat where uat.tid = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, tid);
		int countall = query.list().size();
		pagemodel.setCountAll(countall);
		session.close();
		int page = pagemodel.getPage();
		int pagesize = pagemodel.getPageSize();
		int pagecount = pagemodel.getPageCount();
		if (page > pagecount) {
			page = pagecount;
			pagemodel.setPage(page); 
		}
		;
		if (pagesize > countall) {
			pagesize = countall;
		}
		;
		int pageindex = (page - 1) * pagesize;
		List<UserAndTec> uat = goodsDao.checkAppointment(pagesize, pageindex, tid,
				hql);
		return uat;
	}

	@Override
	public boolean checkTecFlag(int uid) {
		Session session = this.sessionfactory.openSession();
		String hql = "from Technician t where t.uid = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, uid);
		List<Technician> t = query.list();
		session.close();
		if(t.size() > 0){
			return true;
		}
		else{
			return false;
		}
	
	}

	@Override
	public boolean checkAppFlag(int tid) {
		Session session = this.sessionfactory.openSession();
		String hql = "from UserAndTec ut where ut.tid = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, tid);
		List<Technician> t = query.list();
		session.close();
		if(t.size() > 0){
			return true;
		}
		else{
			return false;
		}
	}

	@Override
	public void postGoodsComments(int gid , String gname , String ucomment, Date gdate , String gtype , double gprice ) {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("logUserTemp");
		int uid = u.getId();
		String uname = u.getUsername();
		String guname = goodsDao.findGname(gid);
		GoodsAndComment gac = new GoodsAndComment();
		gac.setGid(gid);
		gac.setGname(gname);
		gac.setGuname(guname);
		gac.setUcomment(ucomment);
		gac.setUid(uid);
		gac.setUname(uname);
		gac.setGprice(gprice);
		gac.setGtype(gtype);
		gac.setGdate(gdate);
		gac.setIjoinedflag(0);
		gac.setCountflag(0);
		goodsDao.saveGoodsComments(gac);
	}

	@Override
	public List<List<GoodsAndComment>> listComments(int gid) {
		List<GoodsAndComment> gac = new ArrayList<GoodsAndComment>();
		List<List<GoodsAndComment>> listCom = new ArrayList<List<GoodsAndComment>>();
		Session session = this.sessionfactory.openSession();
		String hql = "select distinct uid from GoodsAndComment g where g.gid = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, gid);
		List gg = query.list();
		for(int i=0;i<gg.size();i++){
			System.out.println(Integer.parseInt(gg.get(i).toString()));
			String hql1 = "from GoodsAndComment where uid ="+Integer.parseInt(gg.get(i).toString())+" and gid = "+gid+" ";
			Query query1 = session.createQuery(hql1);
			gac = query1.list();
			/*for(int j=0;j<gac.size();j++){
				System.out.println(gac.get(j).getUcomment());
			}
			System.out.println("---------------------");*/
			listCom.add(gac);
		}
		session.close();
		return listCom;
	}

	@Override
	public List<List<GoodsAndComment>> listCommentsInIJoined(int uid) {
		List<GoodsAndComment> gac = new ArrayList<GoodsAndComment>();
		List<List<GoodsAndComment>> listCom = new ArrayList<List<GoodsAndComment>>();
		Session session = this.sessionfactory.openSession();
		String hql = "select distinct gid from GoodsAndComment g where g.uid = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, uid);
		List gg = query.list();
		for(int i=0;i<gg.size();i++){
			String hql1 = "from GoodsAndComment where gid ="+Integer.parseInt(gg.get(i).toString())+" and uid = "+uid+" ";
			Query query1 = session.createQuery(hql1);
			gac = query1.list();
			for(int j=0;j<gac.size();j++){
				System.out.println(gac.get(j).getGname());
			}
			System.out.println("---------------------");
			listCom.add(gac);
		}
		session.close();
		return listCom;
	}

	@Override
	public List<List<GoodsAndComment>> listCommentsInRemindMe(String guname) {
		List<GoodsAndComment> gac = new ArrayList<GoodsAndComment>();
		List<List<GoodsAndComment>> listCom = new ArrayList<List<GoodsAndComment>>();
		Session session = this.sessionfactory.openSession();
		String hql = "select distinct gid from GoodsAndComment g where g.guname = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, guname);
		List gg = query.list();
		for(int i = 0;i<gg.size();i++){
			System.out.println(Integer.parseInt(gg.get(i).toString()));
			String hql1 = "from GoodsAndComment g where g.gid ="+Integer.parseInt(gg.get(i).toString())+" and g.guname = ? order by uid ,id";
			Query query1 = session.createQuery(hql1);
			query1.setParameter(0, guname);
			gac = query1.list();
			listCom.add(gac); 
		}
		session.close();
		return listCom;
	}

	@Override
	public void updateComments(int id, String gucomment) {
		Session session = this.sessionfactory.openSession();
		session.beginTransaction();
		String hql = "update GoodsAndComment g set g.gucomment = ? where g.id = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, gucomment);
		query.setParameter(1, id);
		query.executeUpdate();
		session.beginTransaction().commit();
		session.close();
	}

	@Override
	public List<Technician> checkTechnician() {
		Session session = this.sessionfactory.openSession();
		String hql = "from Technician t where t.flag = "+0+"";
		Query query = session.createQuery(hql);
		List<Technician> tec = query.list();
		session.close();
		return tec;
	}

	@Override
	public List<Goods> getBillBoardGoods() {
		List<Goods> billboardlist = new ArrayList<Goods>();
		Session session = this.sessionfactory.openSession();
		String hql = "SELECT gid FROM GoodsAndComment GROUP BY gid ORDER BY count(gid) desc";
		Query query = session.createQuery(hql);
		List uidlist = query.list();
		if(uidlist.size()<=7){
			for(int i=0;i<uidlist.size();i++){
				System.out.println(uidlist.get(i).toString());
			}
			
		}else{
			for(int i = 0;i<7;i++){
				String hql1 = "from Goods g where g.id="+Integer.parseInt(uidlist.get(i).toString())+"";
			    Query query1 = session.createQuery(hql1);
			    List<Goods> goods = query1.list();
			    billboardlist.add(goods.get(0));
			}
		}
		session.close();
		return billboardlist;
	}

	@Override
	public List<Article> getBillBoardArticles() {
		Session session = this.sessionfactory.openSession();
		String hql = "from Article  order by id desc";
		Query query = session.createQuery(hql);
		List<Article> billboardarticle = query.list();
		session.close();
		return billboardarticle;
	}

	@Override
	public void saveTecnicianCom(int id,String comment) {
		Session session = this.sessionfactory.openSession();
		String hql = "update Technician t set t.comment = ? where t.id = "+id+"";
		Query query = session.createQuery(hql);
		query.setParameter(0, comment);
		query.executeUpdate();
		session.close();
	}

	@Override
	public double getTecScore(int id) {
		Session session = this.sessionfactory.openSession();
		String hql = "select AVG(tscore) from UserAndTec WHERE tid ="+id+" and tscore != 0";
		Query query = session.createQuery(hql);
		double avg = 0.0;
		System.out.println(query.list().size()+"qwer");
		if(query.list().get(0) != null){
		avg = Double.parseDouble(query.list().get(0).toString());
		}
		session.close();
		return avg;
		
		/*Session session = this.sessionfactory.openSession();
		String hql = "from UserAndTec t where t.uid ="+id+"";
		Query query = session.createQuery(hql);
		List<UserAndTec> tt = query.list();
		double sum = 0.0;
		int count = 0;
		for(int i=0;i<tt.size();i++){
			sum=sum+tt.get(i).getTscore();
			count++;
		}
		System.out.println(sum);
		return (sum/count);*/
	}

	@Override
	public int getTecAmount(int id) {
		Session session = this.sessionfactory.openSession();
		String hql = "from UserAndTec t where t.tid ="+id+"";
		Query query = session.createQuery(hql);
		List<UserAndTec> tt = query.list();
		int count = tt.size();
		session.close();
		return count;
	}

	@Override
	public int getTecidByUid(int uid) {
		Session session = this.sessionfactory.openSession();
		String hql = "from Technician t where t.uid ="+uid+"";
		Query query = session.createQuery(hql);
		List<Technician> t = query.list();
		int id = t.get(0).getId();
		session.close();
		return id;
	}

	@Override
	public int getMyMarketCount(String hql, int uid) {
		Session session = this.sessionfactory.openSession();
		Query query = session.createQuery(hql);
		query.setParameter(0, uid);
		List list =  query.list();
		System.out.println(list.size());
		session.close();
		return list.size();
	}
	
	@Override
	public int getIJoinedCount(String hql, String username) {
		Session session = this.sessionfactory.openSession();
		Query query = session.createQuery(hql);
		query.setParameter(0, username);
		List list =  query.list();
		System.out.println(list.size());
		session.close();
		return list.size();
	}

	@Override
	public void updateCount(String hql,String username) {
		Session session = this.sessionfactory.openSession();
		session.beginTransaction();
		Query query = session.createQuery(hql);
		query.setParameter(0, username);
		query.executeUpdate();
		session.beginTransaction().commit();
		session.close();
	}

	@Override
	public Goods getMymarketCollection(int uid) {
		Session session = this.sessionfactory.openSession();
		String hql = "from Collection c where c.uid = "+uid+" order by id desc";
		Query query = session.createQuery(hql);
		List<Collection> c = query.list();
		Goods collection = new Goods();
		if(c.size() > 0){
		 collection = goodsDao.getMymarketCollection(c.get(0).getGid());
		}
		session.close();
		return collection;
	}

	@Override
	public Goods getMymarketMyGoods(int uid) {
		Session session = this.sessionfactory.openSession();
		String hql = "from Goods g where g.uid = "+uid+" order by id desc";
		Query query = session.createQuery(hql);
		List<Goods> goods = query.list();
		Goods g = new Goods();
		if(goods.size() > 0){
			g =  goods.get(0);
		}
		session.close();
		return g;
	}

	@Override
	public String getAppName(int tid) {
		Session session = this.sessionfactory.openSession();
		String hql = "from Technician t where t.id = "+tid+"";
		Query query = session.createQuery(hql);
		List<Technician> list = query.list();
		session.close();
		return list.get(0).getTname();
	}
	
}
