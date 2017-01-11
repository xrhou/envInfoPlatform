package com.env.service.impl;

import com.env.service.IEntMonitorReportManager;
import com.env.dao.IEntMonitorReportDAO;
import com.env.entity.EntMonitorReport;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 企业自行监测报告
 *
 * @author hbj403
 */
public class EntMonitorReportManager implements IEntMonitorReportManager {

    private IEntMonitorReportDAO entMonitorReportDao;

    public void setEntMonitorReportDao(IEntMonitorReportDAO entMonitorReportDao) {
        this.entMonitorReportDao = entMonitorReportDao;
    }


    public void addEntMonitorReport(EntMonitorReport entMonitorReport) {
        entMonitorReportDao.addEntMonitorReport(entMonitorReport);
    }


    public List<EntMonitorReport> getAllEntMonitorReport() {
        return entMonitorReportDao.getAllEntMonitorReport();
    }


    public boolean delEntMonitorReport(String reportId) {
        return entMonitorReportDao.delEntMonitorReport(reportId);
    }


    public EntMonitorReport getEntMonitorReportByReportId(String reportId) {
        return entMonitorReportDao.getEntMonitorReportByReportId(reportId);
    }


    public EntMonitorReport getEntMonitorReport(String entUserId) {
        return entMonitorReportDao.getEntMonitorReport(entUserId);
    }


    public boolean updateEntMonitorReport(EntMonitorReport entMonitorReport) {
        return entMonitorReportDao.updateEntMonitorReport(entMonitorReport);
    }


    public JSONObject getJSON(String entUserId) throws JSONException {
        return null;
    }


    public JSONObject getJSONByEntUserId(String entUserId) throws JSONException {
        List<EntMonitorReport> entMonitorReportList = entMonitorReportDao.getAllByEntUserId(entUserId);
        JSONArray members = new JSONArray();
        long total = 0;
        if (entMonitorReportList != null) {
            for (int i = 0; i < entMonitorReportList.size(); i++) {
                JSONObject member = new JSONObject();
                EntMonitorReport entMonitorReport = entMonitorReportList.get(i);
                member.put("reportId", entMonitorReport.getReportId());
                member.put("entUserId", entMonitorReport.getEntUserId());
                member.put("entReportDate", entMonitorReport.getEntReportDate());
                member.put("entReportFileName", entMonitorReport.getEntReportFileName());
                member.put("entReportFilePath", entMonitorReport.getEntReportFilePath());
                member.put("productDay", entMonitorReport.getProductDay());
                member.put("monitorDay", entMonitorReport.getMonitorDay());
                member.put("reportedUrl", entMonitorReport.getReportedUrl());
                members.put(member);
            }
            total = entMonitorReportList.size();
        }
        System.out.println("====" + members);
        JSONObject datas = new JSONObject();
        datas.put("Total", total);
        datas.put("Rows", members);
        return datas;
    }

}
