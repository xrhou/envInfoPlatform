package com.env.dao.impl;

import com.env.dao.IEntControlTypeDAO;
import com.env.entity.EntControlType;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import java.util.List;

/**
 * 企业控制属性
 *
 * @author hbj403
 */
public class EntControlTypeDAOImpl implements IEntControlTypeDAO {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void addEntControlType(EntControlType entControlType) {
        sessionFactory.getCurrentSession().save(entControlType);
    }

    public List<EntControlType> getAllEntControlType() {
        String hql = "From EntControlType";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();
    }

    public boolean delEntControlType(String entUserId) {
        String hql = "delete EntControlType e where e.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, entUserId);
        return (query.executeUpdate() > 0);
    }

    public EntControlType getEntControlType(String entUserId) {
        String hql = "from EntControlType e where e.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, entUserId);
        return (EntControlType) query.uniqueResult();
    }

    public boolean updateEntControlType(EntControlType entControlType) {
        return false;
    }

}
