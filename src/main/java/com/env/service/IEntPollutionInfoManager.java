package com.env.service;

import com.env.entity.EntPollutionInfo;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

public interface IEntPollutionInfoManager {

    public void addEntPollutionInfo(EntPollutionInfo entPollutionInfo);

    public List<EntPollutionInfo> getAllEntPollutionInfo(String entUserId, String gasOrWater);

    public boolean delEntPollutionInfo(String pollutionInfoId);

    public EntPollutionInfo getEntPollutionInfoByPollutionInfoId(String pollutionInfoId);

    public boolean updateEntPollutionInfo(EntPollutionInfo entPollutionInfo);

    public JSONObject getJSON(String entUserId, String gasOrWater) throws JSONException;
}
