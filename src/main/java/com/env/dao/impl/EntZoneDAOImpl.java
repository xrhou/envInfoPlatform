package com.env.dao.impl;

import com.env.dao.IEntZoneDAO;
import com.env.entity.EntZone;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import java.util.List;

/**
 * 企业所属地区
 *
 * @author hbj403
 */
public class EntZoneDAOImpl implements IEntZoneDAO {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    public void addEntZone(EntZone entZone) {
        sessionFactory.getCurrentSession().save(entZone);
    }


    public List<EntZone> getAllEntZone() {
        String hql = "From EntZone";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();
    }


    public boolean delEntZone(String entUserId) {
        String hql = "delete EntZone e where e.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, entUserId);
        return (query.executeUpdate() > 0);
    }


    public EntZone getEntZone(String entUserId) {
        String hql = "from EntZone e where e.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, entUserId);
        return (EntZone) query.uniqueResult();
    }


    public boolean updateEntZone(EntZone entZone) {
        return false;
    }

}
