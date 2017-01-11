package com.env.dao.impl;

import com.env.dao.IEffectAppraiseAndLicenseDAO;
import com.env.entity.EffectAppraiseAndLicense;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import java.util.List;

/**
 * 环境影响评价及其他环境保护行政许可情况
 *
 * @author hbj403
 */
public class EffectAppraiseAndLicenseDAOImpl implements IEffectAppraiseAndLicenseDAO {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    public void addEffectAppraiseAndLicense(EffectAppraiseAndLicense effectAppraiseAndLicense) {
        sessionFactory.getCurrentSession().save(effectAppraiseAndLicense);
    }


    public List<EffectAppraiseAndLicense> getAllEffectAppraiseAndLicense(String entUserId) {
        String hql = "From EffectAppraiseAndLicense e where e.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, entUserId);
        return query.list();
    }


    public boolean delEffectAppraiseAndLicense(String effectLicenseId) {
        String hql = "delete EffectAppraiseAndLicense e where e.effectLicenseId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, effectLicenseId);
        return (query.executeUpdate() > 0);
    }


    public EffectAppraiseAndLicense getEffectAppraiseAndLicense(String effectLicenseId) {
        String hql = "from EffectAppraiseAndLicense e where e.effectLicenseId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, effectLicenseId);
        return (EffectAppraiseAndLicense) query.uniqueResult();
    }

    public boolean updateEffectAppraiseAndLicense(EffectAppraiseAndLicense effectAppraiseAndLicense) {
        boolean flag = false;
        if (!flag) {
            sessionFactory.getCurrentSession().update(effectAppraiseAndLicense);
            flag = true;
        }
        return flag;
    }

}
