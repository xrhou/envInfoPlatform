package com.env.service;

import com.env.entity.EntMonitorPlan;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 企业自行监测方案
 *
 * @author hbj403
 */
public interface IEntMonitorPlanManager {

    public void addEntMonitorPlan(EntMonitorPlan entMonitorPlan);

    public List<EntMonitorPlan> getAllEntMonitorPlan();

    public boolean delEntMonitorPlan(String entUserId);

    public EntMonitorPlan getEntMonitorPlan(String entUserId);

    public boolean updateEntMonitorPlan(EntMonitorPlan entMonitorPlan);

    public JSONObject getJSON(String entUserId) throws JSONException;
}
