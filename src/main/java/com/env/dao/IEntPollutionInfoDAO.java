package com.env.dao;

import java.util.List;

import com.env.entity.EntPollutionInfo;
/**
 * 企业排污信息表
 * @author hbj403
 */
public interface IEntPollutionInfoDAO {

	public void addEntPollutionInfo(EntPollutionInfo entPollutionInfo);
	
	public List<EntPollutionInfo> getAllEntPollutionInfo(String entUserId, String gasOrWater);
	
	public boolean delEntPollutionInfo(String entUserId);
	
	public EntPollutionInfo getEntPollutionInfoByPollutionInfoId(String pollutionInfoId);
	
	public boolean updateEntPollutionInfo(EntPollutionInfo entPollutionInfo);
	
}
