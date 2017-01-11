package com.env.service;

import com.env.entity.EntControlType;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 企业控制属性
 *
 * @author hbj403
 */
public interface IEntControlTypeManager {

    public void addEntControlType(EntControlType entControlType);

    public List<EntControlType> getAllEntControlType();

    public boolean delEntControlType(String entUserId);

    public EntControlType getEntControlType(String entUserId);

    public boolean updateEntControlType(EntControlType entControlType);

    public JSONObject getJSON(String entUserId) throws JSONException;
}
