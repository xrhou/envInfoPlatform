package com.env.service;

import com.env.entity.EntProduct;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 企业主要生产产品
 *
 * @author hbj403
 */
public interface IEntProductManager {
    public void addEntProduct(EntProduct entProduct);

    public List<EntProduct> getAllEntProduct();

    public boolean delEntProduct(String entUserId);

    public EntProduct getEntProduct(String entUserId);

    public boolean updateEntProduct(EntProduct entProduct);

    public JSONObject getJSON(String entUserId) throws JSONException;
}
