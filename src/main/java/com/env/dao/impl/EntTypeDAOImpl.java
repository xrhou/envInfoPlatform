package com.env.dao.impl;

import com.env.dao.IEntTypeDAO;
import com.env.entity.EntType;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import java.util.List;

/**
 * 企业类型
 *
 * @author hbj403
 */
public class EntTypeDAOImpl implements IEntTypeDAO {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    public void addEntType(EntType entType) {
        sessionFactory.getCurrentSession().save(entType);
    }


    public List<EntType> getAllEntType() {
        String hql = "From EntType";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();
    }


    public boolean delEntType(String entUserId) {
        String hql = "delete EntType e where e.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, entUserId);
        return (query.executeUpdate() > 0);
    }


    public EntType getEntType(String entUserId) {
        String hql = "from EntType e where e.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, entUserId);
        return (EntType) query.uniqueResult();
    }

    public boolean updateEntType(EntType entType) {
        return false;
    }

}
