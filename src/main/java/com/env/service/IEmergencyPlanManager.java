package com.env.service;

import com.env.entity.EmergencyPlan;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 突发环境应急预案
 *
 * @author hbj403
 */
public interface IEmergencyPlanManager {

    public void addEmergencyPlan(EmergencyPlan emergencyPlan);

    public List<EmergencyPlan> getAllEmergencyPlan(String entUserId);

    public boolean delEmergencyPlan(String emergencyPlanId);

    public EmergencyPlan getEmergencyPlan(String entUserId);

    public EmergencyPlan getEmergencyPlanId(String emergencyPlanId);

    public boolean updateEmergencyPlan(EmergencyPlan emergencyPlan);

    public JSONObject getJSONByentUserId(String entUserId) throws JSONException;
}
