package com.env.dao;

import java.util.List;

import com.env.entity.EmergencyPlan;
/**
 * 突发环境应急预案
 * @author hbj403
 */
public interface IEmergencyPlanDAO {

	public void addEmergencyPlan(EmergencyPlan emergencyPlan);
	
	public List<EmergencyPlan> getAllEmergencyPlan(String entUserId);
	
	public boolean delEmergencyPlan(String emergencyPlanId);
	
	public EmergencyPlan getEmergencyPlan(String entUserId);
	
	public boolean updateEmergencyPlan(EmergencyPlan emergencyPlan);

	public EmergencyPlan getEmergencyPlanId(String emergencyPlanId);
}
