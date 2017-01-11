package com.env.service.impl;

import com.env.dao.IOperationLogDAO;
import com.env.entity.OperationLog;
import com.env.service.IOperationLogManager;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 登陆日志管理
 *
 * @author hbj403
 */
public class OperationLogManager implements IOperationLogManager {

    private IOperationLogDAO operationLogDao;

    public void setOperationLogDao(IOperationLogDAO operationLogDao) {
        this.operationLogDao = operationLogDao;
    }


    public void addOperationLog(OperationLog operationLog) {
        operationLogDao.addOperationLog(operationLog);
    }


    public List<OperationLog> getAllOperationLog() {
        return operationLogDao.getAllOperationLog();
    }


    public boolean delOperationLog(String operatorlogid) {
        return operationLogDao.delOperationLog(operatorlogid);
    }


    public OperationLog getOperationLog(String operatorlogid) {
        return operationLogDao.getOperationLog(operatorlogid);
    }


    public boolean updateOperationLog(OperationLog operationLog) {
        return operationLogDao.updateOperationLog(operationLog);
    }


    public JSONObject getAllJSON() throws JSONException {
        return null;
    }

}
