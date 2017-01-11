package com.env.service.impl;

import com.env.dao.INoiseInfoDAO;
import com.env.entity.NoiseInfo;
import com.env.service.INoiseInfoManager;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 噪声污染物
 *
 * @author hbj403
 */
public class NoiseInfoManager implements INoiseInfoManager {

    private INoiseInfoDAO noiseInfoDao;

    public void setNoiseInfoDao(INoiseInfoDAO noiseInfoDao) {
        this.noiseInfoDao = noiseInfoDao;
    }


    public void addNoiseInfo(NoiseInfo noiseInfo) {
        noiseInfoDao.addNoiseInfo(noiseInfo);
    }


    public List<NoiseInfo> getAllNoiseInfo(String entUserId) {
        return noiseInfoDao.getAllNoiseInfo(entUserId);
    }


    public boolean delNoiseInfoByNoiseInfoId(String noiseInfoId) {
        return noiseInfoDao.delNoiseInfoByNoiseInfoId(noiseInfoId);
    }


    public NoiseInfo getNoiseInfoByNoiseInfoId(String noiseInfoId) {
        return noiseInfoDao.getNoiseInfoByNoiseInfoId(noiseInfoId);
    }


    public boolean updateNoiseInfoByNoiseInfoId(NoiseInfo noiseInfo) {
        return noiseInfoDao.updateNoiseInfoByNoiseInfoId(noiseInfo);
    }


    public JSONObject getJSON(String entUserId) throws JSONException {
        List<NoiseInfo> noiseInfoList = noiseInfoDao.getAllNoiseInfo(entUserId);
        JSONArray members = new JSONArray();
        long total = 0;
        if (noiseInfoList != null) {
            for (int i = 0; i < noiseInfoList.size(); i++) {
                JSONObject member = new JSONObject();
                NoiseInfo noiseInfo = noiseInfoList.get(i);
                member.put("noiseInfoId", noiseInfo.getNoiseInfoId());
                member.put("entUserId", noiseInfo.getEntUserId());
                member.put("location", noiseInfo.getLocation());
                member.put("noiseValueDay", noiseInfo.getNoiseValueDay());
                member.put("noiseValueNight", noiseInfo.getNoiseValueNight());
                member.put("dBValueDay", noiseInfo.getdBValueDay());
                member.put("dBValueNight", noiseInfo.getdBValueNight());
                member.put("overSituation", noiseInfo.getOverSituation());

                members.put(member);
            }
            total = noiseInfoList.size();
        }
        JSONObject datas = new JSONObject();
        datas.put("Rows", members);
        datas.put("Total", total);
        return datas;
    }

}
