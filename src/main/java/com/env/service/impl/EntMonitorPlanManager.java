package com.env.service.impl;

import com.env.dao.IEntMonitorPlanDAO;
import com.env.entity.EntMonitorPlan;
import com.env.service.IEntMonitorPlanManager;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 企业自行监测方案
 *
 * @author hbj403
 */
public class EntMonitorPlanManager implements IEntMonitorPlanManager {
    private IEntMonitorPlanDAO entMonitorPlanDao;

    public void setEntMonitorPlanDao(IEntMonitorPlanDAO entMonitorPlanDao) {
        this.entMonitorPlanDao = entMonitorPlanDao;
    }


    public void addEntMonitorPlan(EntMonitorPlan entMonitorPlan) {
        entMonitorPlanDao.addEntMonitorPlan(entMonitorPlan);
    }


    public List<EntMonitorPlan> getAllEntMonitorPlan() {
        return entMonitorPlanDao.getAllEntMonitorPlan();
    }


    public boolean delEntMonitorPlan(String entUserId) {
        return entMonitorPlanDao.delEntMonitorPlan(entUserId);
    }


    public EntMonitorPlan getEntMonitorPlan(String entUserId) {
        return entMonitorPlanDao.getEntMonitorPlan(entUserId);
    }


    public boolean updateEntMonitorPlan(EntMonitorPlan entMonitorPlan) {
        return entMonitorPlanDao.updateEntMonitorPlan(entMonitorPlan);
    }


    public JSONObject getJSON(String entUserId) throws JSONException {
        return null;
    }

}
