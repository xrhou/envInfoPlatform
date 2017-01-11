package com.env.service.impl;

import com.env.dao.IEntControlTypeDAO;
import com.env.entity.EntControlType;
import com.env.service.IEntControlTypeManager;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

public class EntControlTypeManager implements IEntControlTypeManager {
    private IEntControlTypeDAO entControlTypeDao;

    public void setEntControlTypeDao(IEntControlTypeDAO entControlTypeDao) {
        this.entControlTypeDao = entControlTypeDao;
    }


    public void addEntControlType(EntControlType entControlType) {
        entControlTypeDao.addEntControlType(entControlType);
    }


    public List<EntControlType> getAllEntControlType() {
        return entControlTypeDao.getAllEntControlType();
    }


    public boolean delEntControlType(String entUserId) {
        return entControlTypeDao.delEntControlType(entUserId);
    }


    public EntControlType getEntControlType(String entUserId) {
        return entControlTypeDao.getEntControlType(entUserId);
    }


    public boolean updateEntControlType(EntControlType entControlType) {
        return entControlTypeDao.updateEntControlType(entControlType);
    }

    public JSONObject getJSON(String entUserId) throws JSONException {
        return null;
    }

}
