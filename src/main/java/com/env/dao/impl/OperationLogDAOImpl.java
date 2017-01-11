package com.env.dao.impl;

import com.env.dao.IOperationLogDAO;
import com.env.entity.OperationLog;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import java.util.List;

/**
 * 操作日志
 *
 * @author hbj403
 */
public class OperationLogDAOImpl implements IOperationLogDAO {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    public void addOperationLog(OperationLog operationLog) {
        sessionFactory.getCurrentSession().save(operationLog);
    }


    public List<OperationLog> getAllOperationLog() {
        String hql = "From OperationLog";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();
    }


    public boolean delOperationLog(String operatorlogid) {
        String hql = "delete OperationLog o where o.operatorlogid=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, operatorlogid);
        return (query.executeUpdate() > 0);
    }


    public OperationLog getOperationLog(String operatorlogid) {
        String hql = "from OperationLog o where o.operatorlogid=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, operatorlogid);
        return (OperationLog) query.uniqueResult();
    }


    public boolean updateOperationLog(OperationLog operationLog) {
        String hql = "update operationlog o set o.deal_IP=?,"
                + "o.deal_type=?,o.description=?,o.log_id=?,"
                + "o.operatorlogid=? where o.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, operationLog.getDeal_IP());
        query.setString(1, operationLog.getDeal_type());
        query.setString(2, operationLog.getDescription());
        query.setString(3, operationLog.getLog_id());
        query.setString(4, operationLog.getOperatorlogid());
        query.setString(5, operationLog.getEntUserId());
        return (query.executeUpdate() > 0);
    }

}
