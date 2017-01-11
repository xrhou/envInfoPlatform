package com.env.service;

import com.env.entity.EntMonitorReport;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 企业自行监测报告
 *
 * @author hbj403
 */
public interface IEntMonitorReportManager {

    public void addEntMonitorReport(EntMonitorReport entMonitorReport);

    public List<EntMonitorReport> getAllEntMonitorReport();

    public boolean delEntMonitorReport(String reportId);

    public EntMonitorReport getEntMonitorReport(String entUserId);

    public boolean updateEntMonitorReport(EntMonitorReport entMonitorReport);

    public JSONObject getJSON(String entUserId) throws JSONException;

    public JSONObject getJSONByEntUserId(String entUserId) throws JSONException;

    public EntMonitorReport getEntMonitorReportByReportId(String reportId);

}
