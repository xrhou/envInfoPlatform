package com.env.utils.db;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface ResultSetHandler {

    public Object doHandler(ResultSet rs) throws SQLException;
}
