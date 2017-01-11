package com.env.dao.impl;

import com.env.dao.IEntpriseDAO;
import com.env.entity.Entprise;
import com.env.utils.StringUtils;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import java.util.List;

/**
 * 监测企业 基本信息
 *
 * @author hbj403
 */
public class EntpriseDAOImpl implements IEntpriseDAO {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    public void addEntpriser(Entprise entprise) {
        sessionFactory.getCurrentSession().save(entprise);
    }


    public List<Entprise> getAllEntprise(String flag, String entName) {
        System.out.println("Dao中我要查询的菜单数值flag:" + flag + ",entName:" + entName);
        StringBuffer hql = new StringBuffer();
        hql.append("from Entprise e ");
        hql.append(" WHERE 1=1 ");

        if (StringUtils.isEmpty(flag)) {
            hql.append(" and 1=1 ");
        } else if (flag.equals("hz")) {
            hql.append(" and 1=1 ");
        } else if (flag.equals("cx")) {
            hql.append(" and e.entZone='长兴县' ");
        } else if (flag.equals("dq")) {
            hql.append(" and e.entZone='德清县' ");
        } else if (flag.equals("aj")) {
            hql.append(" and e.entZone='安吉县' ");
        } else if (flag.equals("wx")) {
            hql.append(" and e.entZone='吴兴区' ");
        } else if (flag.equals("nx")) {
            hql.append(" and e.entZone='南浔区' ");
        } else if (flag.equals("kf")) {
            hql.append(" and e.entZone='开发区' ");
        } else if (flag.equals("dj")) {
            hql.append(" and e.entZone='度假区' ");
        } else if (flag.equals("s")) {
            hql.append(" and e.entType like '%水污染%' ");
        } else if (flag.equals("q")) {
            hql.append(" and e.entType like '%大气污染%' ");
        } else if (flag.equals("ws")) {
            hql.append(" and e.entType like '%污水处理%' ");
        } else if (flag.equals("j")) {
            hql.append(" and e.entType like '%重金属%' ");
        } else if (flag.equals("yz")) {
            hql.append(" and e.entType like '%化畜禽养殖场%' ");
        } else if (flag.equals("wf")) {
            hql.append(" and e.entType like '%危废经营单位%' ");
        } else if (flag.equals("sy")) {
            hql.append(" and e.entType like '%重点实验室%' ");
        } else if (flag.equals("gf")) {
            hql.append(" and e.entType like '%固体废物%' ");
        } else if (flag.equals("yy")) {
            hql.append(" and e.entType like '%二级以上医院%' ");
        } else if (flag.equals("gk")) {
            hql.append(" and e.entControl= '国控企业' ");
        } else if (flag.equals("sk")) {
            hql.append(" and e.entControl= '省控企业' ");
        } else if (flag.equals("qx")) {
            hql.append(" and e.entControl='市县区控企业' ");
        }

        if (!StringUtils.isEmpty(entName)) {
            hql.append(" and e.entName like '%" + entName + "%' ");
        }

        System.out.println(hql.toString());

        Query query = sessionFactory.getCurrentSession().createQuery(hql.toString());
        return query.list();
    }


    public boolean delEntprise(String entUserId) {
        String hql = "delete Entprise e where e.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, entUserId);
        return (query.executeUpdate() > 0);
    }


    public Entprise getEntprise(String entUserId) {
        String hql = "from Entprise e where e.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, entUserId);
        return (Entprise) query.uniqueResult();
    }


    public boolean updateEntprise(Entprise entprise) {
        String hql = "update Entprise e set e.createDate=?,e.entAddress=?,"
                + "e.entBusiness=?,e.entCheckItem=?,e.entControl=?,e.entName=?,"
                + "e.entPhone=?,e.entPhoneName=?,e.entOtherInfo=?,e.entProduct=?,"
                + "e.entproductCycle=?,e.entReperson=?,e.entScale=?,e.entType=?,"
                + "e.entZone=?,e.loginDate=?,e.entpriseId=?,e.entProductAndManage=?,"
                + "e.pollutionMethod=? where e.entUserId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setDate(0, entprise.getCreateDate());
        query.setString(1, entprise.getEntAddress());
        query.setString(2, entprise.getEntBusiness());
        query.setString(3, entprise.getEntCheckItem());
        query.setString(4, entprise.getEntControl());
        query.setString(5, entprise.getEntName());
        query.setString(6, entprise.getEntPhone());
        query.setString(7, entprise.getEntPhoneName());
        query.setString(8, entprise.getEntOtherInfo());
        query.setString(9, entprise.getEntProduct());
        query.setString(10, entprise.getEntproductCycle());
        query.setString(11, entprise.getEntReperson());
        query.setString(12, entprise.getEntScale());
        query.setString(13, entprise.getEntType());
        query.setString(14, entprise.getEntZone());
        query.setDate(15, entprise.getLoginDate());
        query.setString(16, entprise.getEntpriseId());
        query.setString(17, entprise.getEntProductAndManage());
        query.setString(18, entprise.getPollutionMethod());
        query.setString(19, entprise.getEntUserId());
        return (query.executeUpdate() > 0);
    }

}
