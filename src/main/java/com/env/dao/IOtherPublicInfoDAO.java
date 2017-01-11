package com.env.dao;

import java.util.List;

import com.env.entity.OtherPublicInfo;

/**
 * 其他应当公开环境信息
 * @author hbj403
 */
public interface IOtherPublicInfoDAO {

	public void addOtherPublicInfo(OtherPublicInfo otherPublicInfo);
	
	public List<OtherPublicInfo> getAllOtherPublicInfo(String entUserId);
	
	public boolean delOtherPublicInfo(String entUserId);
	
	public OtherPublicInfo getOtherPublicInfo(String entUserId);
	
	public boolean updateOtherPublicInfo(OtherPublicInfo otherPublicInfo);
}
