package com.env.service.impl;

import com.env.service.IEffectAppraiseAndLicenseManager;
import com.env.dao.IEffectAppraiseAndLicenseDAO;
import com.env.entity.EffectAppraiseAndLicense;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 环境影响评价及其他环境保护行政许可情况
 *
 * @author hbj403
 */
public class EffectAppraiseAndLicenseManager implements IEffectAppraiseAndLicenseManager {

    private IEffectAppraiseAndLicenseDAO effectAppraiseAndLicenseDao;

    public void setEffectAppraiseAndLicenseDao(IEffectAppraiseAndLicenseDAO effectAppraiseAndLicenseDao) {
        this.effectAppraiseAndLicenseDao = effectAppraiseAndLicenseDao;
    }


    public void addEffectAppraiseAndLicense(EffectAppraiseAndLicense effectAppraiseAndLicense) {
        effectAppraiseAndLicenseDao.addEffectAppraiseAndLicense(effectAppraiseAndLicense);
    }


    public List<EffectAppraiseAndLicense> getAllEffectAppraiseAndLicense(String entUserId) {
        return effectAppraiseAndLicenseDao.getAllEffectAppraiseAndLicense(entUserId);
    }


    public boolean delEffectAppraiseAndLicense(String effectLicenseId) {
        return effectAppraiseAndLicenseDao.delEffectAppraiseAndLicense(effectLicenseId);
    }


    public EffectAppraiseAndLicense getEffectAppraiseAndLicense(String effectLicenseId) {
        return effectAppraiseAndLicenseDao.getEffectAppraiseAndLicense(effectLicenseId);
    }


    public boolean updateEffectAppraiseAndLicense(EffectAppraiseAndLicense effectAppraiseAndLicense) {
        return effectAppraiseAndLicenseDao.updateEffectAppraiseAndLicense(effectAppraiseAndLicense);
    }


    public JSONObject getJSON(String entUserId) throws JSONException {
        List<EffectAppraiseAndLicense> effectAppraiseAndLicenseList = effectAppraiseAndLicenseDao.getAllEffectAppraiseAndLicense(entUserId);
        JSONArray members = new JSONArray();
        long total = 0;
        if (effectAppraiseAndLicenseList != null) {
            for (int i = 0; i < effectAppraiseAndLicenseList.size(); i++) {
                JSONObject member = new JSONObject();
                EffectAppraiseAndLicense effectAppraiseAndLicense = effectAppraiseAndLicenseList.get(i);
                member.put("EffectLicenseId", effectAppraiseAndLicense.getEffectLicenseId());
                member.put("entUserId", effectAppraiseAndLicense.getEntUserId());
                member.put("BuildingName", effectAppraiseAndLicense.getBuildingName());
                member.put("EiaUnits", effectAppraiseAndLicense.getEiaUnits());
                member.put("EiaDate", effectAppraiseAndLicense.getEiaDate());
                member.put("EiaDocNumber", effectAppraiseAndLicense.getEiaDocNumber());
                member.put("CompletedUnit", effectAppraiseAndLicense.getCompletedUnit());
                member.put("CompletedTime", effectAppraiseAndLicense.getCompletedTime());
                member.put("CompletedDocNumber", effectAppraiseAndLicense.getCompletedDocNumber());
                member.put("otherSituation", effectAppraiseAndLicense.getOtherSituation());
                members.put(member);
            }
            total = effectAppraiseAndLicenseList.size();
        }
        JSONObject datas = new JSONObject();
        datas.put("Total", total);
        datas.put("Rows", members);
        return datas;
    }

}
