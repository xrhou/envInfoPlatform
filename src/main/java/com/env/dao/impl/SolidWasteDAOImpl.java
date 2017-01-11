package com.env.dao.impl;

import com.env.dao.ISolidWasteDAO;
import com.env.entity.SolidWaste;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import java.util.List;

/**
 * 固体废物
 *
 * @author hbj403
 */
public class SolidWasteDAOImpl implements ISolidWasteDAO {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    public void addSolidWaste(SolidWaste solidWaste) {
        sessionFactory.getCurrentSession().save(solidWaste);
    }


    public List<SolidWaste> getAllSolidWaste(String entUserId) {
        String hql = "From SolidWaste e where e.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, entUserId);
        return query.list();
    }


    public boolean delSolidWasteBysolidWasteId(String solidWasteId) {
        String hql = "delete SolidWaste e where e.solidWasteId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, solidWasteId);
        return (query.executeUpdate() > 0);
    }


    public SolidWaste getSolidWasteBysolidWasteId(String solidWasteId) {
        String hql = "from SolidWaste e where e.solidWasteId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, solidWasteId);
        return (SolidWaste) query.uniqueResult();
    }


    public boolean updateSolidWaste(SolidWaste solidWaste) {
        boolean flag = false;
        if ("".equals(solidWaste.getSolidWasteId())) {
            sessionFactory.getCurrentSession().update(solidWaste);
            flag = true;
        }
        return flag;
    }

}
