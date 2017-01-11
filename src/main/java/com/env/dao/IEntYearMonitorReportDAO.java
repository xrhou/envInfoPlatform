package com.env.dao;

import java.util.List;

import com.env.entity.EntYearMonitorReport;
/**
 * 年度企业自行监测报告
 * @author hbj403
 */
public interface IEntYearMonitorReportDAO {

	public void addEntYearMonitorReport(EntYearMonitorReport entYearMonitorReport);
	
	public List<EntYearMonitorReport> getAllEntYearMonitorReport();
	
	public boolean delEntYearMonitorReport(String entUserId);
	
	public EntYearMonitorReport getEntYearMonitorReport(String entUserId);
	
	public boolean updateEntYearMonitorReport(EntYearMonitorReport entYearMonitorReport);
}
