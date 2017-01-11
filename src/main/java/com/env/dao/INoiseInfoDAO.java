package com.env.dao;

import java.util.List;

import com.env.entity.NoiseInfo;
/**
 * 噪声污染物
 * @author hbj403
 */
public interface INoiseInfoDAO {

	public void addNoiseInfo(NoiseInfo noiseInfo);
	
	public List<NoiseInfo> getAllNoiseInfo(String entUserId);
	
	public boolean delNoiseInfoByNoiseInfoId(String noiseInfoId);
	
	public NoiseInfo getNoiseInfoByNoiseInfoId(String noiseInfoId);
	
	public boolean updateNoiseInfoByNoiseInfoId(NoiseInfo noiseInfo);
}
