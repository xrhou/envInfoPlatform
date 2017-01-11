package com.env.service;

import com.env.entity.OperationLog;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 登陆日志管理
 *
 * @author hbj403
 */
public interface IOperationLogManager {

    public void addOperationLog(OperationLog operationLog);

    public List<OperationLog> getAllOperationLog();

    public boolean delOperationLog(String operatorlogid);

    public OperationLog getOperationLog(String operatorlogid);

    public boolean updateOperationLog(OperationLog operationLog);

    public JSONObject getAllJSON() throws JSONException;
}
