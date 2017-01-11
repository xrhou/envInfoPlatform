package com.env.service;

import com.env.entity.EntUser;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 企业用户登陆信息
 *
 * @author hbj403
 */
public interface IEntUserManager {

    public void addEntUser(EntUser entUser);

    public List<EntUser> getAllEntUser();

    public boolean delEntUser(String entId);

    public EntUser getEntUser(String entId);

    public boolean updateEntUser(EntUser entUser);

    public EntUser entUserlogin(String entId, String userpassword);

    public JSONObject getJSON(String entUserId) throws JSONException;

    boolean updateEntUserPWD(String entUserId, String userpassword);
}
