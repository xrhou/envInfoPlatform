package com.env.dao;

import java.util.List;

import com.env.entity.EntMonitorReport;
/**
 * 企业自行监测报告
 * @author hbj403
 */
public interface IEntMonitorReportDAO {

	public void addEntMonitorReport(EntMonitorReport entMonitorReport);
	
	public List<EntMonitorReport> getAllEntMonitorReport();
	
	public boolean delEntMonitorReport(String reportId);
	
	public EntMonitorReport getEntMonitorReport(String entUserId);
	
	public boolean updateEntMonitorReport(EntMonitorReport entMonitorReport);

	public List<EntMonitorReport> getAllByEntUserId(String entUserId);

	public EntMonitorReport getEntMonitorReportByReportId(String reportId);

}
