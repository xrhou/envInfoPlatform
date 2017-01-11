package com.env.service.impl;

import com.env.dao.IEntPollutionInfoDAO;
import com.env.entity.EntPollutionInfo;
import com.env.service.IEntPollutionInfoManager;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 企业排污信息
 *
 * @author hbj403
 */
public class EntPollutionInfoManager implements IEntPollutionInfoManager {

    private IEntPollutionInfoDAO entPollutionInfoDao;

    public void setEntPollutionInfoDao(IEntPollutionInfoDAO entPollutionInfoDao) {
        this.entPollutionInfoDao = entPollutionInfoDao;
    }


    public void addEntPollutionInfo(EntPollutionInfo entPollutionInfo) {
        entPollutionInfoDao.addEntPollutionInfo(entPollutionInfo);
    }


    public List<EntPollutionInfo> getAllEntPollutionInfo(String entUserId, String gasOrWater) {
        return entPollutionInfoDao.getAllEntPollutionInfo(entUserId, gasOrWater);
    }


    public boolean delEntPollutionInfo(String pollutionInfoId) {
        return entPollutionInfoDao.delEntPollutionInfo(pollutionInfoId);
    }


    public EntPollutionInfo getEntPollutionInfoByPollutionInfoId(String pollutionInfoId) {
        return entPollutionInfoDao.getEntPollutionInfoByPollutionInfoId(pollutionInfoId);
    }


    public boolean updateEntPollutionInfo(EntPollutionInfo entPollutionInfo) {
        return entPollutionInfoDao.updateEntPollutionInfo(entPollutionInfo);
    }


    public JSONObject getJSON(String entUserId, String gasOrWater) throws JSONException {
        List<EntPollutionInfo> entPollutionInfoList = entPollutionInfoDao.getAllEntPollutionInfo(entUserId, gasOrWater);
        JSONArray members = new JSONArray();
        long total = 0;
        if (entPollutionInfoList != null) {
            for (int i = 0; i < entPollutionInfoList.size(); i++) {
                JSONObject member = new JSONObject();
                EntPollutionInfo entPollutionInfo = entPollutionInfoList.get(i);
                member.put("pollutionInfoId", entPollutionInfo.getPollutionInfoId());
                member.put("entUserId", entPollutionInfo.getEntUserId());
                member.put("pMouth", entPollutionInfo.getpMouth());
                member.put("pLocation", entPollutionInfo.getpLocation());
                member.put("pMethod", entPollutionInfo.getpMethod());
                member.put("pName", entPollutionInfo.getpName());
                member.put("mgL", entPollutionInfo.getMgL());
                member.put("monitorMothod", entPollutionInfo.getMonitorMothod());
                member.put("monitorDate", entPollutionInfo.getMonitorDate());
                member.put("totalEmission", entPollutionInfo.getTotalEmission());
                member.put("accountTotalEmission", entPollutionInfo.getAccountTotalEmission());
                member.put("standartMGL", entPollutionInfo.getStandartMGL());
                member.put("over", entPollutionInfo.getOver());
                member.put("gasOrWater", entPollutionInfo.getGasOrWater());

                members.put(member);
            }
            total = entPollutionInfoList.size();
        }
        JSONObject datas = new JSONObject();
        datas.put("Rows", members);
        datas.put("Total", total);
        return datas;
    }

}
