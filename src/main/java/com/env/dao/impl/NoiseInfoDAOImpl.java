package com.env.dao.impl;

import com.env.dao.INoiseInfoDAO;
import com.env.entity.NoiseInfo;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import java.util.List;

/**
 * 噪声污染物
 *
 * @author hbj403
 */
public class NoiseInfoDAOImpl implements INoiseInfoDAO {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    public void addNoiseInfo(NoiseInfo noiseInfo) {
        sessionFactory.getCurrentSession().save(noiseInfo);
    }


    public List<NoiseInfo> getAllNoiseInfo(String entUserId) {
        String hql = "From NoiseInfo e where e.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, entUserId);
        return query.list();
    }


    public boolean delNoiseInfoByNoiseInfoId(String noiseInfoId) {
        String hql = "delete NoiseInfo e where e.noiseInfoId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, noiseInfoId);
        return (query.executeUpdate() > 0);
    }


    public NoiseInfo getNoiseInfoByNoiseInfoId(String noiseInfoId) {
        String hql = "from NoiseInfo e where e.noiseInfoId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, noiseInfoId);
        return (NoiseInfo) query.uniqueResult();
    }


    public boolean updateNoiseInfoByNoiseInfoId(NoiseInfo noiseInfo) {
        boolean flag = false;
        if ("".equals(noiseInfo.getNoiseInfoId())) {
            sessionFactory.getCurrentSession().update(noiseInfo);
            flag = true;
        }
        return flag;
    }

}
