package com.env.dao;


import com.env.entity.ConstructRunSituation;

import java.util.List;

/**
 * 防治污染设施的建设和运行情况
 *
 * @author hbj403
 */
public interface IConstructRunSituationDAO {

    public void addConstructRunSituation(ConstructRunSituation constructRunSituation);

    public List<ConstructRunSituation> getAllConstructRunSituation(String entUserId);

    public boolean delConstructRunSituation(String entUserId);

    public ConstructRunSituation getConstructRunSituationBycrunSid(String crunSid);

    public boolean updateConstructRunSituation(ConstructRunSituation constructRunSituation);
}
