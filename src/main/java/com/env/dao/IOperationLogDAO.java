package com.env.dao;

import java.util.List;

import com.env.entity.OperationLog;
/**
 * 操作日志
 * @author hbj403
 */
public interface IOperationLogDAO {

	public void addOperationLog(OperationLog operationLog);
	
	public List<OperationLog> getAllOperationLog();
	
	public boolean delOperationLog(String operatorlogid);
	
	public OperationLog getOperationLog(String operatorlogid);
	
	public boolean updateOperationLog(OperationLog operationLog);
}
