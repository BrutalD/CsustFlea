package com.csustflea.dao.impl;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public abstract class DaoSupport extends HibernateDaoSupport{
	
	 @Resource(name = "sessionFactory")  
	  public void setSuperSessionFactory(SessionFactory sessionFactory) {  
	        super.setSessionFactory(sessionFactory);  
	  }  
}
