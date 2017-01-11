package com.env.dao;

import java.util.List;

import com.env.entity.EntControlType;
/**
 * 企业控制属性
 * @author hbj403
 */
public interface IEntControlTypeDAO {

	public void addEntControlType(EntControlType entControlType);
	
	public List<EntControlType> getAllEntControlType();
	
	public boolean delEntControlType(String entUserId);
	
	public EntControlType getEntControlType(String entUserId);
	
	public boolean updateEntControlType(EntControlType entControlType);
}
