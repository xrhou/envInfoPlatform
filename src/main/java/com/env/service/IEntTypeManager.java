package com.env.service;

import com.env.entity.EntType;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

public interface IEntTypeManager {

    public void addEntType(EntType entType);

    public List<EntType> getAllEntType();

    public boolean delEntType(String entUserId);

    public EntType getEntType(String entUserId);

    public boolean updateEntType(EntType entType);

    public JSONObject getJSON(String entUserId) throws JSONException;
}
