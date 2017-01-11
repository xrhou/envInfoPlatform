package com.env.service.impl;

import com.env.dao.IEntpriseDAO;
import com.env.entity.Entprise;
import com.env.service.IEntpriseManager;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 监测企业 基本信息
 *
 * @author hbj403
 */
public class EntpriseManager implements IEntpriseManager {

    private IEntpriseDAO entpriseDao;

    public void setEntpriseDao(IEntpriseDAO entpriseDao) {
        this.entpriseDao = entpriseDao;
    }


    public void addEntpriser(Entprise entprise) {
        entpriseDao.addEntpriser(entprise);
    }


    public List<Entprise> getAllEntprise(String flag, String entName) {
        return entpriseDao.getAllEntprise(flag, entName);
    }


    public boolean delEntprise(String entUserId) {
        return entpriseDao.delEntprise(entUserId);
    }


    public Entprise getEntprise(String entUserId) {
        Entprise entprise = entpriseDao.getEntprise(entUserId);
        if (null != entprise) {
            return entprise;
        } else {
            new Exception("entprise未找到!");
            return null;
        }
    }

    public boolean updateEntprise(Entprise entprise) {
        return entpriseDao.updateEntprise(entprise);
    }

    /**
     * 查询所有自行监测企业
     *
     * @return
     * @throws JSONException
     * @throws Exception
     */
    public JSONObject getJSON(String flag, String entName) throws JSONException {
        List<Entprise> entpriseList = entpriseDao.getAllEntprise(flag, entName);
        JSONArray members = new JSONArray();
        long total = 0;
        if (entpriseList != null) {
            for (int i = 0; i < entpriseList.size(); i++) {
                JSONObject member = new JSONObject();
                Entprise entprise = entpriseList.get(i);
                member.put("entUserId", entprise.getEntUserId());
                member.put("entUserCode", entprise.getEntUsercode());
                member.put("entName", entprise.getEntName());
                member.put("entZone", entprise.getEntZone());
                member.put("entBusiness", entprise.getEntBusiness());
                member.put("entControl", entprise.getEntControl());
                member.put("entReperson", entprise.getEntReperson());
                member.put("entType", entprise.getEntType());

                members.put(member);
            }
            total = entpriseList.size();
        }
        System.out.println("====" + members);
        JSONObject datas = new JSONObject();
        datas.put("total", total);
        datas.put("rows", members);
        return datas;
    }

}
