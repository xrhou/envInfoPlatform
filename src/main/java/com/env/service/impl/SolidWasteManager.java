package com.env.service.impl;

import com.env.service.ISolidWasteManager;
import com.env.dao.ISolidWasteDAO;
import com.env.entity.SolidWaste;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 固体废物
 *
 * @author hbj403
 */
public class SolidWasteManager implements ISolidWasteManager {

    private ISolidWasteDAO solidWasteDao;

    public void setSolidWasteDao(ISolidWasteDAO solidWasteDao) {
        this.solidWasteDao = solidWasteDao;
    }


    public void addSolidWaste(SolidWaste solidWaste) {
        solidWasteDao.addSolidWaste(solidWaste);
    }


    public List<SolidWaste> getAllSolidWaste(String entUserId) {
        return solidWasteDao.getAllSolidWaste(entUserId);
    }


    public boolean delSolidWasteBysolidWasteId(String solidWasteId) {
        return solidWasteDao.delSolidWasteBysolidWasteId(solidWasteId);
    }


    public SolidWaste getSolidWasteBysolidWasteId(String solidWasteId) {
        return solidWasteDao.getSolidWasteBysolidWasteId(solidWasteId);
    }


    public boolean updateSolidWaste(SolidWaste solidWaste) {
        return solidWasteDao.updateSolidWaste(solidWaste);
    }


    public JSONObject getJSON(String entUserId) throws JSONException {
        List<SolidWaste> solidWasteList = solidWasteDao.getAllSolidWaste(entUserId);
        JSONArray members = new JSONArray();
        long total = 0;
        if (solidWasteList != null) {
            for (int i = 0; i < solidWasteList.size(); i++) {
                JSONObject member = new JSONObject();
                SolidWaste solidWaste = solidWasteList.get(i);
                member.put("solidWasteId", solidWaste.getSolidWasteId());
                member.put("entUserId", solidWaste.getEntUserId());
                member.put("wasteName", solidWaste.getWasteName());
                member.put("isDanger", solidWaste.getIsDanger());
                member.put("handleType", solidWaste.getHandleType());
                member.put("handleNumber", solidWaste.getHandleNumber());
                member.put("handleDirection", solidWaste.getHandleDirection());

                members.put(member);
            }
            total = solidWasteList.size();
        }
        JSONObject datas = new JSONObject();
        datas.put("Rows", members);
        datas.put("Total", total);
        return datas;
    }

}
