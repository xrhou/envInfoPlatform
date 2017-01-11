package com.env.dao.impl;

import com.env.dao.IEntMonitorReportDAO;
import com.env.entity.EntMonitorReport;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import java.util.List;

/**
 * 企业自行监测报告
 *
 * @author hbj403
 */
public class EntMonitorReportDAOImpl implements IEntMonitorReportDAO {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void addEntMonitorReport(EntMonitorReport entMonitorReport) {
        sessionFactory.getCurrentSession().save(entMonitorReport);
    }


    public List<EntMonitorReport> getAllEntMonitorReport() {
        String hql = "From EntMonitorReport";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();
    }


    public boolean delEntMonitorReport(String reportId) {
        String hql = "delete EntMonitorReport e where e.reportId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, reportId);
        return (query.executeUpdate() > 0);
    }


    public EntMonitorReport getEntMonitorReport(String entUserId) {
        String hql = "from EntMonitorReport e where e.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, entUserId);
        return (EntMonitorReport) query.uniqueResult();
    }


    public boolean updateEntMonitorReport(EntMonitorReport entMonitorReport) {
        boolean flag = false;
        if (null != entMonitorReport) {
            sessionFactory.getCurrentSession().update(entMonitorReport);
            flag = true;
        }
        return flag;
    }


    public List<EntMonitorReport> getAllByEntUserId(String entUserId) {
        String hql = "FROM EntMonitorReport e WHERE e.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, entUserId);
        return query.list();
    }


    public EntMonitorReport getEntMonitorReportByReportId(String reportId) {
        String hql = "from EntMonitorReport e where e.reportId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, reportId);
        return (EntMonitorReport) query.uniqueResult();
    }

}
