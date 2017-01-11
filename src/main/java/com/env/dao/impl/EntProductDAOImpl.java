package com.env.dao.impl;

import com.env.dao.IEntProductDAO;
import com.env.entity.EntProduct;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import java.util.List;

/**
 * 企业主要生产产品
 *
 * @author hbj403
 */
public class EntProductDAOImpl implements IEntProductDAO {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    public void addEntProduct(EntProduct entProduct) {
        sessionFactory.getCurrentSession().save(entProduct);
    }


    public List<EntProduct> getAllEntProduct() {
        String hql = "From EntProduct";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();
    }


    public boolean delEntProduct(String entUserId) {
        String hql = "delete EntProduct e where e.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, entUserId);
        return (query.executeUpdate() > 0);
    }


    public EntProduct getEntProduct(String entUserId) {
        String hql = "from EntProduct e where e.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, entUserId);
        return (EntProduct) query.uniqueResult();
    }


    public boolean updateEntProduct(EntProduct entProduct) {
        boolean flag = false;
        if ("".equals(entProduct.getEntProductId())) {
            sessionFactory.getCurrentSession().update(entProduct);
            flag = true;
        }
        return flag;
    }


}
