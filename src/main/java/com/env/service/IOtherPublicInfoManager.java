package com.env.service;

import com.env.entity.OtherPublicInfo;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 其他应当公开环境信息
 *
 * @author hbj403
 */
public interface IOtherPublicInfoManager {

    public void addOtherPublicInfo(OtherPublicInfo otherPublicInfo);

    public List<OtherPublicInfo> getAllOtherPublicInfo(String entUserId);

    public boolean delOtherPublicInfo(String entUserId);

    public OtherPublicInfo getOtherPublicInfo(String entUserId);

    public boolean updateOtherPublicInfo(OtherPublicInfo otherPublicInfo);

    public JSONObject getJSON(String entUserId) throws JSONException;
}
