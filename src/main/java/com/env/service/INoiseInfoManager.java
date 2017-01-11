package com.env.service;

import com.env.entity.NoiseInfo;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 噪声污染物
 *
 * @author hbj403
 */
public interface INoiseInfoManager {

    public void addNoiseInfo(NoiseInfo noiseInfo);

    public List<NoiseInfo> getAllNoiseInfo(String entUserId);

    public boolean delNoiseInfoByNoiseInfoId(String noiseInfoId);

    public NoiseInfo getNoiseInfoByNoiseInfoId(String noiseInfoId);

    public boolean updateNoiseInfoByNoiseInfoId(NoiseInfo noiseInfo);

    public JSONObject getJSON(String entUserId) throws JSONException;
}
