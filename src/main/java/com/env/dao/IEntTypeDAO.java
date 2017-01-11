package com.env.dao;

import java.util.List;

import com.env.entity.EntType;

public interface IEntTypeDAO {

	public void addEntType(EntType entType);
	
	public List<EntType> getAllEntType();
	
	public boolean delEntType(String entUserId);
	
	public EntType getEntType(String entUserId);
	
	public boolean updateEntType(EntType entType);
}
