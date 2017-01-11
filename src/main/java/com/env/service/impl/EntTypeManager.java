package com.env.service.impl;

import com.env.service.IEntTypeManager;
import com.env.dao.IEntTypeDAO;
import com.env.entity.EntType;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 企业类型
 *
 * @author hbj403
 */
public class EntTypeManager implements IEntTypeManager {

    private IEntTypeDAO entTypeDao;

    public void setEntTypeDao(IEntTypeDAO entTypeDao) {
        this.entTypeDao = entTypeDao;
    }


    public void addEntType(EntType entType) {
        entTypeDao.addEntType(entType);
    }


    public List<EntType> getAllEntType() {
        return entTypeDao.getAllEntType();
    }


    public boolean delEntType(String entUserId) {
        return entTypeDao.delEntType(entUserId);
    }


    public EntType getEntType(String entUserId) {
        return entTypeDao.getEntType(entUserId);
    }


    public boolean updateEntType(EntType entType) {
        return entTypeDao.updateEntType(entType);
    }

    public JSONObject getJSON(String entUserId) throws JSONException {
        return null;
    }

}
