package com.env.service;

import com.env.entity.SolidWaste;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 固体废物
 *
 * @author hbj403
 */
public interface ISolidWasteManager {

    public void addSolidWaste(SolidWaste solidWaste);

    public List<SolidWaste> getAllSolidWaste(String entUserId);

    public boolean delSolidWasteBysolidWasteId(String solidWasteId);

    public SolidWaste getSolidWasteBysolidWasteId(String solidWasteId);

    public boolean updateSolidWaste(SolidWaste solidWaste);

    public JSONObject getJSON(String entUserId) throws JSONException;
}
