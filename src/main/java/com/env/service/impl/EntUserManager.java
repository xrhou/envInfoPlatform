package com.env.service.impl;

import com.env.dao.IEntUserDAO;
import com.env.entity.EntUser;
import com.env.service.IEntUserManager;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 企业用户登陆信息
 *
 * @author hbj403
 */
public class EntUserManager implements IEntUserManager {

    private IEntUserDAO entUserDao;

    public void setEntUserDao(IEntUserDAO entUserDao) {
        this.entUserDao = entUserDao;
    }


    public void addEntUser(EntUser entUser) {
        entUserDao.addEntUser(entUser);
    }


    public List<EntUser> getAllEntUser() {
        return entUserDao.getAllEntUser();
    }


    public boolean delEntUser(String entUserId) {
        return entUserDao.delEntUser(entUserId);
    }


    public EntUser getEntUser(String entUserId) {
        return entUserDao.getEntUser(entUserId);
    }


    public boolean updateEntUser(EntUser entUser) {
        return entUserDao.updateEntUser(entUser);
    }


    public boolean updateEntUserPWD(String entUserId, String userpassword) {
        return entUserDao.updateEntUserPWD(entUserId, userpassword);
    }

    public EntUser entUserlogin(String entId, String userpassword) {
        return entUserDao.entUserlogin(entId, userpassword);
    }

    public JSONObject getJSON(String entId) throws JSONException {
        return null;
    }

}
