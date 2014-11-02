package com.csustflea.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.csustflea.dao.UserDao;
import com.csustflea.model.User;
import com.csustflea.service.UserService;

@Component("userservice")
public class UserServiceImpl implements UserService {
	private UserDao userdao;
	private SessionFactory sessionfactory;

	public SessionFactory getSessionfactory() {
		return sessionfactory;
	}

	@Resource(name = "sessionFactory")
	public void setSessionfactory(SessionFactory sessionfactory) {
		this.sessionfactory = sessionfactory;
	}

	public UserDao getUserdao() {
		return userdao;
	}

	@Resource(name = "userdao")
	public void setUserdao(UserDao userdao) {
		this.userdao = userdao;
	}

	public void saveUser(User user) {
		this.userdao.saveUser(user);
	}

	@Override
	public boolean logUser(User user) {
		return (this.userdao.logUser(user));
	}

	@Override
	public boolean regPUser(User user) {
		boolean flag = this.userdao.regPUser(user);
		if(flag){
			this.userdao.saveUser(user);
		}
		
		return flag;
	}

	@Override
	public void CpUser(User user, int id) {
		user.setId(id);
		Session session = sessionfactory.openSession();
		session.beginTransaction();
		session.update(user);
		session.beginTransaction().commit();
		session.close();
	}
	
	public String getImg(int uid){
		Session session = sessionfactory.openSession();
		String hql = "from User u where u.id = "+uid+"";
		Query query = session.createQuery(hql);
		List<User> u = query.list();
		session.close();
		return u.get(0).getImage();
	}

	@Override
	public User listUserInfo(int idTemp) {
		return (this.userdao.listUserInfo(idTemp));
	}

	@Override
	public boolean checkPwd(String newpwd, String usernameTemp) {
		return (this.userdao.checkPwd(newpwd, usernameTemp));
	}

	@Override
	public void updatePwd(int id,String password) {
		this.userdao.updatePwd(id,password);
	}

	@Override
	public void CpUserPic(User user, int id) {
		User u = this.userdao.CpUser(user, id);
		u.setImage(user.getImage());
		Session session = sessionfactory.openSession();
		session.beginTransaction();
		session.update(u);
		session.beginTransaction().commit();
		session.close();
	}

}
