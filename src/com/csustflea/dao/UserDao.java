package com.csustflea.dao;

import com.csustflea.model.User;

public interface UserDao {

	public void saveUser(User user);
	
	public boolean logUser(User user);
	
	public boolean regPUser(User user);
	
	public User CpUser(User user,int id);
	
	public User listUserInfo(int idTemp);
	
	public boolean checkPwd(String newpwd,String usernameTemp);
	
	public void updatePwd(int id,String passwords);
}
