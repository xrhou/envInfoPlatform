package com.env.dao;

import java.util.List;

import com.env.entity.Entprise;
/**
 * 监测企业 基本信息
 * @author hbj403
 *
 */
public interface IEntpriseDAO {

	public void addEntpriser(Entprise entprise);
	
	public List<Entprise> getAllEntprise(String flag, String entName);
	
	public boolean delEntprise(String entUserId);
	
	public Entprise getEntprise(String entUserId);
	
	public boolean updateEntprise(Entprise entprise);
}
