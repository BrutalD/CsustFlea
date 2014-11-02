package com.csustflea.dao.impl;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.csustflea.dao.UserDao;
import com.csustflea.model.User;

@Component("userdao")
public class UserDaoImpl implements UserDao {
	private SessionFactory sessionfactory;
	private HttpServletRequest request;
	private HibernateTemplate hibernatetemplate;

	public HibernateTemplate getHibernatetemplate() {
		return hibernatetemplate;
	}

	@Resource(name = "hibernateTemplate")
	public void setHibernatetemplate(HibernateTemplate hibernatetemplate) {
		this.hibernatetemplate = hibernatetemplate;
	}

	public SessionFactory getSessionfactory() {
		return sessionfactory;
	}

	@Resource(name = "sessionFactory")
	public void setSessionfactory(SessionFactory sessionfactory) {
		this.sessionfactory = sessionfactory;
	}

	public void saveUser(User user) {
		Session session = sessionfactory.openSession();
		session.beginTransaction();
		session.save(user);
		session.beginTransaction().commit();
		session.close();
	};

	public boolean logUser(User user) {
		Session session = sessionfactory.openSession();
		String hql = "from User u where u.username = ? and u.password = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, user.getUsername());
		query.setParameter(1, user.getPassword());
		List<User> user1 = (List) query.list();

		/*
		 * ArrayList<User> list=new ArrayList<User>();
		 * 
		 * User[] u = new User[user1.size()];
		 * 
		 * user1.toArray(u);
		 * 
		 * System.out.println(u[1].getId());
		 */
        
		session.close();
		
		if (user1.size() > 0) {
			User u = user1.get(0);
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session1 = request.getSession();
			session1.setAttribute("logUserTemp", u);
			return true;
		} 
		else {
			return false;
		}
	}

	@Override
	public boolean regPUser(User user) {
		Session session = sessionfactory.openSession();
		String hql = "from User u where u.username = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, user.getUsername());
		List<User> user1 = query.list();
		session.close();
		System.out.println(user1.size());
		if (user1.size() > 0) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public User CpUser(User user,int id) {
		Session session = sessionfactory.openSession();
		String hql = "from User u where u.id = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, id);
		List<User> u = query.list();
		session.close();
		return(u.get(0));
	}

	@Override
	public User listUserInfo(int idTemp) {
		User user = (User) this.hibernatetemplate.get(User.class, idTemp);
		return user;
	}

	@Override
	public boolean checkPwd(String newpwd,String usernameTemp) {
		Session session = sessionfactory.openSession();
		String hql = "from User u where u.password = ? and u.username = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, newpwd);
		query.setParameter(1, usernameTemp);
		List<User> users = query.list();
		session.close();
		if(users.size()>0){
           return true;			
		}
		else{
			return false;
		}
		
	}

	@Override
	public void updatePwd(int id,String password) {
        Session session =  sessionfactory.openSession();
		session.beginTransaction();
		String hql = "update User u set u.password = ? where u.id = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, password);
		query.setParameter(1, id);
		query.executeUpdate();
		session.beginTransaction().commit();
		session.close();
	}
	
}
