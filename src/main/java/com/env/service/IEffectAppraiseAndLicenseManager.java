package com.env.service;

import com.env.entity.EffectAppraiseAndLicense;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 环境影响评价及其他环境保护行政许可情况
 *
 * @author hbj403
 */
public interface IEffectAppraiseAndLicenseManager {

    public void addEffectAppraiseAndLicense(EffectAppraiseAndLicense effectAppraiseAndLicense);

    public List<EffectAppraiseAndLicense> getAllEffectAppraiseAndLicense(String entUserId);

    public boolean delEffectAppraiseAndLicense(String effectLicenseId);

    public EffectAppraiseAndLicense getEffectAppraiseAndLicense(String effectLicenseId);

    public boolean updateEffectAppraiseAndLicense(EffectAppraiseAndLicense effectAppraiseAndLicense);

    public JSONObject getJSON(String entUserId) throws JSONException;
}
