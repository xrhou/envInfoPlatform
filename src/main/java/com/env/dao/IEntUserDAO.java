package com.env.dao;

import java.util.List;

import com.env.entity.EntUser;

/**
 * 企业用户登陆信息
 * @author hbj403
 */
public interface IEntUserDAO {

	public void addEntUser(EntUser entUser);
	
	public List<EntUser> getAllEntUser();
	
	public boolean delEntUser(String entUserId);
	
	public EntUser getEntUser(String entUserId);
	
	public boolean updateEntUser(EntUser entUser);
	
	public boolean updateEntUserPWD(String entUserId, String userpassword);
	
	public EntUser entUserlogin(String username, String userpassword);
}
