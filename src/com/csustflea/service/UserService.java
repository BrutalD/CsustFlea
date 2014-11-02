package com.csustflea.service;

import com.csustflea.model.Goods;
import com.csustflea.model.User;

public interface UserService {
    
	public boolean regPUser(User user);
	
	public void saveUser(User user);
	
	public boolean logUser(User user); 
	
	public void CpUser(User user,int id);
	
	public String getImg(int uid);
	
	public void CpUserPic(User user,int id);
	
	public User listUserInfo(int idTemp);
	
	public boolean checkPwd(String newpwd,String usernameTemp);
	
	public void updatePwd(int id,String password);
	
}
