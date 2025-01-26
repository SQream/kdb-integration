package com.sqream.demo.service;

import jakarta.annotation.PostConstruct;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.sql.*;
import java.util.Arrays;

import com.kx.c;

import static com.kx.c.td;

@Slf4j
@Service
public class KdbClientService {

    @Value("${kdb.host}")
    private String kdbHost;

    @Value("${kdb.port}")
    private int kdbPort;

    @Value("${kdb.table}")
    private String kdbTable;

    @Value("${sqream.host}")
    private String sqreamHost;

    @Value("${sqream.port}")
    private int sqreamPort;

    @Value("${sqream.database}")
    private String sqreamDb;

    @Value("${sqream.ssl}")
    private boolean sqreamSsl;

    @Value("${sqream.cluster}")
    private boolean sqreamCluster;

    @Value("${sqream.fetch-size}")
    private int sqreamFetchSize;

    @Value("${sqream.username}")
    private String sqreamUser;

    @Value("${sqream.password}")
    private String sqreamPassword;


    @PostConstruct
    public void getData() throws c.KException, IOException, SQLException {
        c kdbServer = null;
        Connection conn = null;

        try {
            // connect to KDB+
            kdbServer = new c(kdbHost, kdbPort);

            // get data from KDB+
            c.Flip table = td(kdbServer.k("select from " + kdbTable));
            log.info("Column names: {}", Arrays.toString(table.x));

            // convert KDB+ column data to primitive long array
            long[] longArray = Arrays.stream((long[])table.y[0]).toArray();
            log.info("Data: {}", Arrays.toString(longArray));

            // Connect to SQream
            String url = String.format("jdbc:Sqream://%s:%d/%s;ssl=%b;cluster=%b;fetchSize=%d",
                    sqreamHost, sqreamPort, sqreamDb, sqreamSsl, sqreamCluster, sqreamFetchSize);
            conn = DriverManager.getConnection(url, sqreamUser, sqreamPassword);

            try (Statement stmt = conn.createStatement()) {
                stmt.executeUpdate("create or replace table tbl (x_array bigint[])");
            }

            try (PreparedStatement ps = conn.prepareStatement("insert into tbl values (?)")) {
                Array sqlArray = conn.createArrayOf("Long",
                        Arrays.stream(longArray).boxed().toArray(Long[]::new));
                ps.setArray(1, sqlArray);
                ps.addBatch();
            }

        } catch (Exception e) {
            log.error("Error processing data", e);
        } finally {
            if (kdbServer != null)
                kdbServer.close();
            if (conn != null)
                conn.close();
        }
    }
}
