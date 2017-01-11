package com.env.service;

import com.env.entity.ConstructRunSituation;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 防治污染设施的建设和运行情况
 *
 * @author hbj403
 */
public interface IConstructRunSituationManager {

    public void addConstructRunSituation(ConstructRunSituation constructRunSituation);

    public ConstructRunSituation getConstructRunSituationByCrun(String crunSid);

    public boolean delConstructRunSituation(String crunSid);

    public boolean updateConstructRunSituation(ConstructRunSituation constructRunSituation);

    public List<ConstructRunSituation> getAllConstructRunSituation(String entUserId);

    public JSONObject getJSON(String entId) throws JSONException;
}
