package com.env.dao.impl;

import com.env.dao.IOtherPublicInfoDAO;
import com.env.entity.OtherPublicInfo;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import java.util.List;

/**
 * 其他应当公开环境信息
 *
 * @author hbj403
 */
public class OtherPublicInfoDAOImpl implements IOtherPublicInfoDAO {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    public void addOtherPublicInfo(OtherPublicInfo otherPublicInfo) {
        sessionFactory.getCurrentSession().save(otherPublicInfo);
    }


    public List<OtherPublicInfo> getAllOtherPublicInfo(String entUserId) {
        String hql = "From OtherPublicInfo e where e.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, entUserId);
        return query.list();
    }


    public boolean delOtherPublicInfo(String OtherInfoId) {
        String hql = "delete OtherPublicInfo e where e.OtherInfoId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, OtherInfoId);
        return (query.executeUpdate() > 0);
    }


    public OtherPublicInfo getOtherPublicInfo(String OtherInfoId) {
        String hql = "from OtherPublicInfo e where e.OtherInfoId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, OtherInfoId);
        return (OtherPublicInfo) query.uniqueResult();
    }


    public boolean updateOtherPublicInfo(OtherPublicInfo otherPublicInfo) {
        String hql = "update OtherPublicInfo e set e.otherPollutionName=?,e.otherPollutionDetail=?,"
                + "e.otherTime=?,e.entUserId=?  "
                + " where e.OtherInfoId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, otherPublicInfo.getOtherPollutionName());
        query.setString(1, otherPublicInfo.getOtherPollutionDetail());
        query.setString(2, otherPublicInfo.getOtherTime());
        query.setString(3, otherPublicInfo.getEntUserId());
        query.setString(4, otherPublicInfo.getOtherInfoId());
        return (query.executeUpdate() > 0);
    }

}
