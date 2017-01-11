package com.env.service;

import com.env.entity.Entprise;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 监测企业 基本信息
 *
 * @author hbj403
 */
public interface IEntpriseManager {

    public void addEntpriser(Entprise entprise);

    public List<Entprise> getAllEntprise(String flag, String entName);

    public boolean delEntprise(String entUserId);

    public Entprise getEntprise(String entUserId);

    public boolean updateEntprise(Entprise entprise);

    public JSONObject getJSON(String flag, String entName) throws JSONException;
}
