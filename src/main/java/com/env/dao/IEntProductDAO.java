package com.env.dao;

import java.util.List;

import com.env.entity.EntProduct;
/**
 * 企业主要生产产品
 * @author hbj403
 */
public interface IEntProductDAO {

	public void addEntProduct(EntProduct entProduct);
	
	public List<EntProduct> getAllEntProduct();
	
	public boolean delEntProduct(String entUserId);
	
	public EntProduct getEntProduct(String entUserId);
	
	public boolean updateEntProduct(EntProduct entProduct);
}
