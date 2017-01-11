package com.env.dao.impl;

import com.env.dao.IEntYearMonitorReportDAO;
import com.env.entity.EntYearMonitorReport;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import java.util.List;

/**
 * 年度企业自行监测报告
 *
 * @author hbj403
 */
public class EntYearMonitorReportDAOImpl implements IEntYearMonitorReportDAO {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    public void addEntYearMonitorReport(EntYearMonitorReport entYearMonitorReport) {
        sessionFactory.getCurrentSession().save(entYearMonitorReport);
    }


    public List<EntYearMonitorReport> getAllEntYearMonitorReport() {
        String hql = "From EntYearMonitorReport";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();
    }


    public boolean delEntYearMonitorReport(String entUserId) {
        String hql = "delete EntYearMonitorReport e where e.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, entUserId);
        return (query.executeUpdate() > 0);
    }


    public EntYearMonitorReport getEntYearMonitorReport(String entUserId) {
        String hql = "from EntYearMonitorReport e where e.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, entUserId);
        return (EntYearMonitorReport) query.uniqueResult();
    }


    public boolean updateEntYearMonitorReport(
            EntYearMonitorReport entYearMonitorReport) {
        return false;
    }

}
