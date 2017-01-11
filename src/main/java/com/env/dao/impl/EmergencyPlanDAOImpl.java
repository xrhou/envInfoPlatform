package com.env.dao.impl;

import com.env.dao.IEmergencyPlanDAO;
import com.env.entity.EmergencyPlan;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import java.util.List;

/**
 * 突发环境应急预案
 *
 * @author hbj403
 */
public class EmergencyPlanDAOImpl implements IEmergencyPlanDAO {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    public void addEmergencyPlan(EmergencyPlan emergencyPlan) {
        sessionFactory.getCurrentSession().save(emergencyPlan);
    }


    public List<EmergencyPlan> getAllEmergencyPlan(String entUserId) {
        String hql = "From EmergencyPlan e where e.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, entUserId);
        return query.list();
    }


    public boolean delEmergencyPlan(String emergencyPlanId) {
        String hql = "delete EmergencyPlan e where e.emergencyPlanId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, emergencyPlanId);
        return (query.executeUpdate() > 0);
    }


    public EmergencyPlan getEmergencyPlan(String entUserId) {
        String hql = "from EmergencyPlan e where e.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, entUserId);
        return (EmergencyPlan) query.uniqueResult();
    }


    public boolean updateEmergencyPlan(EmergencyPlan emergencyPlan) {
        boolean flag = false;
        if (!"".equals(emergencyPlan)) {
            sessionFactory.getCurrentSession().update(emergencyPlan);
            flag = true;
        }
        return flag;
    }

    public EmergencyPlan getEmergencyPlanId(String emergencyPlanId) {
        String hql = "From EmergencyPlan e where e.emergencyPlanId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, emergencyPlanId);
        return (EmergencyPlan) query.uniqueResult();
    }

}
