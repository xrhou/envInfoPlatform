package com.env.dao;

import java.util.List;

import com.env.entity.EntMonitorPlan;
/**
 * 企业自行监测方案
 * @author hbj403
 */
public interface IEntMonitorPlanDAO {

	public void addEntMonitorPlan(EntMonitorPlan entMonitorPlan);
	
	public List<EntMonitorPlan> getAllEntMonitorPlan();
	
	public boolean delEntMonitorPlan(String entUserId);
	
	public EntMonitorPlan getEntMonitorPlan(String entUserId);
	
	public boolean updateEntMonitorPlan(EntMonitorPlan entMonitorPlan);
}
