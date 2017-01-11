package com.env.dao.impl;


import com.env.dao.IConstructRunSituationDAO;
import com.env.entity.ConstructRunSituation;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import java.util.List;

/**
 * 防治污染设施的建设和运行情况
 *
 * @author hbj403
 */
public class ConstructRunSituationDAOImpl implements IConstructRunSituationDAO {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void addConstructRunSituation(ConstructRunSituation constructRunSituation) {
        sessionFactory.getCurrentSession().save(constructRunSituation);
    }

    public List<ConstructRunSituation> getAllConstructRunSituation(String entUserId) {
        String hql = "From ConstructRunSituation e where e.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, entUserId);
        return query.list();
    }

    public boolean delConstructRunSituation(String crunSid) {
        String hql = "delete ConstructRunSituation e where e.crunSid=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, crunSid);
        return (query.executeUpdate() > 0);
    }

    public ConstructRunSituation getConstructRunSituationBycrunSid(String crunSid) {
        String hql = "from ConstructRunSituation e where e.crunSid=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, crunSid);
        return (ConstructRunSituation) query.uniqueResult();
    }

    public boolean updateConstructRunSituation(ConstructRunSituation constructRunSituation) {
        boolean flag = false;
        if ("".equals(constructRunSituation.getCrunSid())) {
            sessionFactory.getCurrentSession().update(constructRunSituation);
            flag = true;
        }
        return flag;
    }

}
