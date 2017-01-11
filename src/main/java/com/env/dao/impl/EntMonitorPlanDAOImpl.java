package com.env.dao.impl;

import com.env.dao.IEntMonitorPlanDAO;
import com.env.entity.EntMonitorPlan;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import java.util.List;

/**
 * 企业自行监测方案
 *
 * @author hbj403
 */
public class EntMonitorPlanDAOImpl implements IEntMonitorPlanDAO {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void addEntMonitorPlan(EntMonitorPlan entMonitorPlan) {
        sessionFactory.getCurrentSession().save(entMonitorPlan);
    }


    public List<EntMonitorPlan> getAllEntMonitorPlan() {
        String hql = "From EntMonitorPlan";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();
    }


    public boolean delEntMonitorPlan(String entUserId) {
        String hql = "delete EntMonitorPlan e where e.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, entUserId);
        return (query.executeUpdate() > 0);
    }


    public EntMonitorPlan getEntMonitorPlan(String entUserId) {
        String hql = "from EntMonitorPlan e where e.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, entUserId);
        return (EntMonitorPlan) query.uniqueResult();
    }


    public boolean updateEntMonitorPlan(EntMonitorPlan entMonitorPlan) {
        return false;
    }

}
