package com.sqream.demo;

import lombok.extern.slf4j.Slf4j;
import org.junit.Test;

import java.sql.*;

@Slf4j
public class JdbcTest {
    @Test
    public void demonstrateKdbPreparedStatement() throws SQLException, ClassNotFoundException {
        Class.forName("com.kx.jdbc");
        try (Connection conn = DriverManager.getConnection("jdbc:q:192.168.4.20:5001")) {//
            try (PreparedStatement ps  = conn.prepareStatement("select 1")) {
                ResultSet rs = ps.executeQuery();
                log.info(String.valueOf(rs));
                while (rs.next()) {
                    log.info(String.valueOf(rs.getLong(1)));
                }
            }

            String createTableSQL = "create table t(x int,f float,s varchar(0),d date,t time,z timestamp, b boolean)";
            try (Statement stmt = conn.createStatement()) {
                stmt.executeUpdate(createTableSQL);
                log.info("Table 't' created successfully.");
            }

            log.info("Inserting data into 't'...");
//            String insertSQL = "insert into t values (?, ?, ?, ?, ?, ?, ?)";
            String insertQ = "q){`t insert 0N!a::x}";

//            try (PreparedStatement ps = conn.prepareStatement(insertSQL)) {
            try (PreparedStatement ps = conn.prepareStatement(insertQ)) {
                ps.setInt(1,10);
                ps.setDouble(2,10.3);
                ps.setString(3,"qwe1");
                ps.setDate(4,Date.valueOf("2000-01-02"));
                ps.setTime(5,Time.valueOf("12:34:56"));
                ps.setTimestamp(6,Timestamp.valueOf("2000-01-02 12:34:56"));
                ps.setBoolean(7, true);
                ps.executeUpdate();
            }

            log.info("Selecting and printing data from 't'...");
            String selectSQL = "select * from t";
            try (PreparedStatement ps = conn.prepareStatement(selectSQL);
                 ResultSet rs = ps.executeQuery()) {
                while(rs.next()) {
                    log.info("PRINTING A RECORD..");
                    for (int i=1; i<=rs.getMetaData().getColumnCount(); ++i) {
                        log.info("column name: {}, column value: {}", rs.getMetaData().getColumnName(i), rs.getObject(i));
                    }
                    log.info("RECORD PRINTED");
                }
            }

            String verifyDataSQL = "select count(*) from t";
            try (PreparedStatement ps = conn.prepareStatement(verifyDataSQL);
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    log.info("Row count in t: " + rs.getLong(1));
                }
            }
        }
    }
}
