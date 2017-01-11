package com.env.dao;

import java.util.List;

import com.env.entity.EntZone;

public interface IEntZoneDAO {

	public void addEntZone(EntZone entZone);
	
	public List<EntZone> getAllEntZone();
	
	public boolean delEntZone(String entUserId);
	
	public EntZone getEntZone(String entUserId);
	
	public boolean updateEntZone(EntZone entZone);
}
