package com.env.service;

import com.env.entity.EntYearMonitorReport;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 年度企业自行监测报告
 *
 * @author hbj403
 */
public interface IEntYearMonitorReportManager {

    public void addEntYearMonitorReport(EntYearMonitorReport entYearMonitorReport);

    public List<EntYearMonitorReport> getAllEntYearMonitorReport();

    public boolean delEntYearMonitorReport(String entUserId);

    public EntYearMonitorReport getEntYearMonitorReport(String entUserId);

    public boolean updateEntYearMonitorReport(EntYearMonitorReport entYearMonitorReport);

    public JSONObject getJSON(String entUserId) throws JSONException;
}
