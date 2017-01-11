package com.env.service.impl;

import com.env.dao.IEntYearMonitorReportDAO;
import com.env.entity.EntYearMonitorReport;
import com.env.service.IEntYearMonitorReportManager;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 年度企业自行监测报告
 *
 * @author hbj403
 */
public class EntYearMonitorReportManager implements IEntYearMonitorReportManager {

    private IEntYearMonitorReportDAO entYearMonitorReportDao;

    public void setEntYearMonitorReportDao(
            IEntYearMonitorReportDAO entYearMonitorReportDao) {
        this.entYearMonitorReportDao = entYearMonitorReportDao;
    }


    public void addEntYearMonitorReport(EntYearMonitorReport entYearMonitorReport) {
        entYearMonitorReportDao.addEntYearMonitorReport(entYearMonitorReport);
    }


    public List<EntYearMonitorReport> getAllEntYearMonitorReport() {
        return entYearMonitorReportDao.getAllEntYearMonitorReport();
    }


    public boolean delEntYearMonitorReport(String entUserId) {
        return entYearMonitorReportDao.delEntYearMonitorReport(entUserId);
    }


    public EntYearMonitorReport getEntYearMonitorReport(String entUserId) {
        return entYearMonitorReportDao.getEntYearMonitorReport(entUserId);
    }


    public boolean updateEntYearMonitorReport(EntYearMonitorReport entYearMonitorReport) {
        return entYearMonitorReportDao.updateEntYearMonitorReport(entYearMonitorReport);
    }


    public JSONObject getJSON(String entUserId) throws JSONException {
        return null;
    }

}
