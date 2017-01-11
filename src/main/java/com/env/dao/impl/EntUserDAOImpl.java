package com.env.dao.impl;

import com.env.dao.IEntUserDAO;
import com.env.entity.EntUser;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import java.util.List;

/**
 * 企业用户登陆信息
 *
 * @author hbj403
 */
public class EntUserDAOImpl implements IEntUserDAO {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    public void addEntUser(EntUser entUser) {
        sessionFactory.getCurrentSession().save(entUser);
    }


    public List<EntUser> getAllEntUser() {
        String hql = "From EntUser";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();
    }


    public boolean delEntUser(String entUserId) {
        String hql = "delete EntUser e where e.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, entUserId);
        return (query.executeUpdate() > 0);
    }


    public EntUser getEntUser(String entUserId) {
        String hql = "from EntUser e where e.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, entUserId);
        return (EntUser) query.uniqueResult();
    }


    public boolean updateEntUser(EntUser entUser) {
        String hql = "update EntUser e set e.entUserId=?,e.entName=?,"
                + "e.entOrganizationCode=?,e.loginTime=?,e.userpassword=?"
                + " where e.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, entUser.getEntUserId());
        query.setString(1, entUser.getEntName());
        query.setString(2, entUser.getEntOrganizationCode());
        query.setDate(3, entUser.getLoginTime());
        query.setString(4, entUser.getUserpassword());
        query.setString(5, entUser.getEntUserId());
        return (query.executeUpdate() > 0);
    }


    public boolean updateEntUserPWD(String entUserId, String userpassword) {
        String hql = "update EntUser e set e.userpassword=?"
                + " where e.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, userpassword);
        query.setString(1, entUserId);
        return (query.executeUpdate() > 0);
    }


    public EntUser entUserlogin(String entId, String userpassword) {
        String hql = "from EntUser e where e.entId=? and e.userpassword=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, entId);
        query.setString(1, userpassword);
        return (EntUser) query.uniqueResult();
    }

}
