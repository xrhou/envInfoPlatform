package com.env.service.impl;

import com.env.service.IEntProductManager;
import com.env.dao.IEntProductDAO;
import com.env.entity.EntProduct;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 企业主要生产产品
 *
 * @author hbj403
 */
public class EntProductManager implements IEntProductManager {

    private IEntProductDAO entProductDao;

    public void setEntProductDao(IEntProductDAO entProductDao) {
        this.entProductDao = entProductDao;
    }


    public void addEntProduct(EntProduct entProduct) {
        entProductDao.addEntProduct(entProduct);
    }


    public List<EntProduct> getAllEntProduct() {
        return entProductDao.getAllEntProduct();
    }


    public boolean delEntProduct(String entUserId) {
        return entProductDao.delEntProduct(entUserId);
    }


    public EntProduct getEntProduct(String entUserId) {
        EntProduct entProduct = entProductDao.getEntProduct(entUserId);
        if (null != entProduct) {
            return entProduct;
        } else {
            new Exception("企业生产产品列表为空！");
            return null;
        }
    }


    public boolean updateEntProduct(EntProduct entProduct) {
        return entProductDao.updateEntProduct(entProduct);
    }


    public JSONObject getJSON(String entUserId) throws JSONException {
        return null;
    }

}
