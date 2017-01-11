package com.env.service.impl;

import com.env.dao.IConstructRunSituationDAO;
import com.env.entity.ConstructRunSituation;
import com.env.service.IConstructRunSituationManager;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 防治污染设施的建设和运行情况
 *
 * @author hbj403
 */
public class ConstructRunSituationManager implements IConstructRunSituationManager {

    private IConstructRunSituationDAO constructRunSituationDao;

    public void setConstructRunSituationDao(IConstructRunSituationDAO constructRunSituationDao) {
        this.constructRunSituationDao = constructRunSituationDao;
    }


    public void addConstructRunSituation(ConstructRunSituation constructRunSituation) {
        constructRunSituationDao.addConstructRunSituation(constructRunSituation);
    }


    public List<ConstructRunSituation> getAllConstructRunSituation(String entUserId) {
        return constructRunSituationDao.getAllConstructRunSituation(entUserId);
    }

    public boolean delConstructRunSituation(String crunSid) {
        return constructRunSituationDao.delConstructRunSituation(crunSid);
    }


    public boolean updateConstructRunSituation(ConstructRunSituation constructRunSituation) {
        return constructRunSituationDao.updateConstructRunSituation(constructRunSituation);
    }


    public JSONObject getJSON(String entUserId) throws JSONException {
        List<ConstructRunSituation> constructRunSituationList = constructRunSituationDao.getAllConstructRunSituation(entUserId);
        JSONArray members = new JSONArray();
        long total = 0;
        if (constructRunSituationList != null) {
            for (int i = 0; i < constructRunSituationList.size(); i++) {
                JSONObject member = new JSONObject();
                ConstructRunSituation constructRunSituation = constructRunSituationList.get(i);
                member.put("crunSid", constructRunSituation.getCrunSid());
                member.put("entUserId", constructRunSituation.getEntUserId());
                member.put("facilityClass", constructRunSituation.getFacilityClass());
                member.put("facilityName", constructRunSituation.getFacilityName());
                member.put("runTime", constructRunSituation.getRunTime());
                member.put("handleAbulity", constructRunSituation.getHandleAbulity());
                member.put("operatorUnit", constructRunSituation.getOperatorUnit());
                member.put("runStation", constructRunSituation.getRunStation());

                members.put(member);
            }
            total = constructRunSituationList.size();
        }
        JSONObject datas = new JSONObject();
        datas.put("Rows", members);
        datas.put("Total", total);
        return datas;
    }

    public ConstructRunSituation getConstructRunSituationByCrun(String crunSid) {
        return constructRunSituationDao.getConstructRunSituationBycrunSid(crunSid);
    }

}
