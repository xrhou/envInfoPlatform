package com.env.dao.impl;

import com.env.dao.IEntPollutionInfoDAO;
import com.env.entity.EntPollutionInfo;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import java.util.List;

/**
 * 企业排污信息表
 *
 * @author hbj403
 */
public class EntPollutionInfoDAOImpl implements IEntPollutionInfoDAO {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    public void addEntPollutionInfo(EntPollutionInfo entPollutionInfo) {
        sessionFactory.getCurrentSession().save(entPollutionInfo);
    }


    public List<EntPollutionInfo> getAllEntPollutionInfo(String entUserId, String gasOrWater) {
        String hql = "From EntPollutionInfo e where e.entUserId=? and e.gasOrWater=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, entUserId);
        query.setString(1, gasOrWater);
        return query.list();
    }


    public boolean delEntPollutionInfo(String pollutionInfoId) {
        String hql = "delete EntPollutionInfo e where e.pollutionInfoId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, pollutionInfoId);
        return (query.executeUpdate() > 0);
    }


    public EntPollutionInfo getEntPollutionInfoByPollutionInfoId(String pollutionInfoId) {
        System.out.println("==获取企业污染物信息==" + pollutionInfoId);
        String hql = "from EntPollutionInfo e where e.pollutionInfoId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, pollutionInfoId);
        return (EntPollutionInfo) query.uniqueResult();
    }


    public boolean updateEntPollutionInfo(EntPollutionInfo entPollutionInfo) {
        boolean flag = false;
        if ("".equals(entPollutionInfo.getPollutionInfoId())) {
            sessionFactory.getCurrentSession().update(entPollutionInfo);
            flag = true;
        }
        return flag;
    }


}

