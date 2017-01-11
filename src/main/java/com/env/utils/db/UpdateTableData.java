package com.env.utils.db;

import com.env.entity.EntUser;
import com.env.entity.Entprise;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 更新一个表中的对应字段的数据到另一个表中
 *
 * @author hbj403
 */
public class UpdateTableData {

    private JdbcTemplete jdbcTemplete;

    public UpdateTableData() {
        jdbcTemplete = new JdbcTemplete();
    }

    public void update(String entUserId, String entName, String entUsercode) throws SQLException {
        String sql = "update entprise set entUserId=?,entName=?,entUsercode=?";
        jdbcTemplete.update(sql, entUserId, entName, entUsercode);
    }

    @SuppressWarnings("unchecked")
    public List<Entprise> EntprisefindAll() throws SQLException {
        String sql = "select entpriseId from Entprise";
        return (List<Entprise>) jdbcTemplete.query(sql, new ResultSetHandler() {

            public Object doHandler(ResultSet rs) throws SQLException {
                List<Entprise> list = new ArrayList<Entprise>();
                Entprise f = null;
                while (rs.next()) {
                    f = new Entprise();
                    f.setEntpriseId(rs.getString(1));
                    list.add(f);
                }
                return list;
            }
        });
    }

    @SuppressWarnings("unchecked")
    public List<EntUser> findAll() throws SQLException {
        String sql = "select entUserId,entName,entId from ent_user";
        return (List<EntUser>) jdbcTemplete.query(sql, new ResultSetHandler() {

            public Object doHandler(ResultSet rs) throws SQLException {
                List<EntUser> list = new ArrayList<EntUser>();
                EntUser f = null;
                while (rs.next()) {
                    f = new EntUser();
                    f.setEntUserId(rs.getString(1));
                    f.setEntName(rs.getString(2));
                    f.setEntId(rs.getString(3));
                    list.add(f);
                }
                return list;
            }
        });
    }

    public static void main(String[] args) throws SQLException {
        UpdateTableData utd = new UpdateTableData();
        List<EntUser> entUsers = utd.findAll();
        List<Entprise> Entprises = utd.EntprisefindAll();
        List<String> entpriseid = new ArrayList<String>();
        for (int i = 0; i < Entprises.size(); i++) {
            System.out.println(i + "getEntpriseId:" + Entprises.get(i).getEntpriseId());
            entpriseid.add(Entprises.get(i).getEntpriseId());
        }
        for (int j = 0; j < entUsers.size(); j++) {
            System.out.println(j + "---" + entUsers.get(j).getEntUserId() + "-" + entUsers.get(j).getEntName() + "-" + entUsers.get(j).getEntId());
            //utd.update(entUser.getEntUserId(), entUser.getEntName(), entUser.getEntId());
        }

    }

}
