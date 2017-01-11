package com.env.service.impl;

import com.env.service.IOtherPublicInfoManager;
import com.env.dao.IOtherPublicInfoDAO;
import com.env.entity.OtherPublicInfo;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 其他应当公开环境信息
 *
 * @author hbj403
 */
public class OtherPublicInfoManager implements IOtherPublicInfoManager {

    private IOtherPublicInfoDAO otherPublicInfoDao;

    public void setOtherPublicInfoDao(IOtherPublicInfoDAO otherPublicInfoDao) {
        this.otherPublicInfoDao = otherPublicInfoDao;
    }


    public void addOtherPublicInfo(OtherPublicInfo otherPublicInfo) {
        otherPublicInfoDao.addOtherPublicInfo(otherPublicInfo);
    }


    public List<OtherPublicInfo> getAllOtherPublicInfo(String entUserId) {
        return otherPublicInfoDao.getAllOtherPublicInfo(entUserId);
    }


    public boolean delOtherPublicInfo(String OtherInfoId) {
        return otherPublicInfoDao.delOtherPublicInfo(OtherInfoId);
    }


    public OtherPublicInfo getOtherPublicInfo(String OtherInfoId) {
        return otherPublicInfoDao.getOtherPublicInfo(OtherInfoId);
    }


    public boolean updateOtherPublicInfo(OtherPublicInfo otherPublicInfo) {
        return otherPublicInfoDao.updateOtherPublicInfo(otherPublicInfo);
    }


    public JSONObject getJSON(String entUserId) throws JSONException {
        List<OtherPublicInfo> otherPublicInfoList = otherPublicInfoDao.getAllOtherPublicInfo(entUserId);
        JSONArray members = new JSONArray();
        long total = 0;
        if (otherPublicInfoList != null) {
            for (int i = 0; i < otherPublicInfoList.size(); i++) {
                JSONObject member = new JSONObject();
                OtherPublicInfo otherPublicInfo = otherPublicInfoList.get(i);
                member.put("otherInfoId", otherPublicInfo.getOtherInfoId());
                member.put("entUserId", otherPublicInfo.getEntUserId());
                member.put("otherPollutionName", otherPublicInfo.getOtherPollutionName());
                member.put("otherTime", otherPublicInfo.getOtherTime());
                member.put("otherPollutionDetail", otherPublicInfo.getOtherPollutionDetail());
                members.put(member);
            }
            total = otherPublicInfoList.size();
        }
        System.out.println("====" + members);
        JSONObject datas = new JSONObject();
        datas.put("Total", total);
        datas.put("Rows", members);
        return datas;
    }

}
