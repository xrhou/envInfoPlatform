package com.env.service.impl;

import com.env.service.IEmergencyPlanManager;
import com.env.dao.IEmergencyPlanDAO;
import com.env.entity.EmergencyPlan;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

public class EmergencyPlanManager implements IEmergencyPlanManager {

    private IEmergencyPlanDAO emergencyPlanDao;

    public void setEmergencyPlanDao(IEmergencyPlanDAO emergencyPlanDao) {
        this.emergencyPlanDao = emergencyPlanDao;
    }


    public void addEmergencyPlan(EmergencyPlan emergencyPlan) {
        emergencyPlanDao.addEmergencyPlan(emergencyPlan);
    }


    public List<EmergencyPlan> getAllEmergencyPlan(String entUserId) {
        return emergencyPlanDao.getAllEmergencyPlan(entUserId);
    }


    public boolean delEmergencyPlan(String emergencyPlanId) {
        return emergencyPlanDao.delEmergencyPlan(emergencyPlanId);
    }


    public EmergencyPlan getEmergencyPlan(String entUserId) {
        return emergencyPlanDao.getEmergencyPlan(entUserId);
    }


    public boolean updateEmergencyPlan(EmergencyPlan emergencyPlan) {
        return emergencyPlanDao.updateEmergencyPlan(emergencyPlan);
    }


    public EmergencyPlan getEmergencyPlanId(String EmergencyPlanId) {
        return emergencyPlanDao.getEmergencyPlanId(EmergencyPlanId);
    }


    public JSONObject getJSONByentUserId(String entUserId) throws JSONException {
        List<EmergencyPlan> emergencyPlanList = emergencyPlanDao.getAllEmergencyPlan(entUserId);
        JSONArray members = new JSONArray();
        long total = 0;
        if (emergencyPlanList != null) {
            for (int i = 0; i < emergencyPlanList.size(); i++) {
                JSONObject member = new JSONObject();
                EmergencyPlan emergencyPlan = emergencyPlanList.get(i);
                member.put("EmergencyPlanId", emergencyPlan.getEmergencyPlanId());
                member.put("entUserId", emergencyPlan.getEntUserId());
                member.put("planDept", emergencyPlan.getPlanDept());
                member.put("planTime", emergencyPlan.getPlanTime());
                member.put("EmergencyPlanName", emergencyPlan.getEmergencyPlanName());
                member.put("planContent", emergencyPlan.getPlanContent());
                member.put("planPath", emergencyPlan.getPlanPath());
                members.put(member);
            }
            total = emergencyPlanList.size();
        }
        JSONObject datas = new JSONObject();
        datas.put("Total", total);
        datas.put("Rows", members);
        return datas;
    }
}
