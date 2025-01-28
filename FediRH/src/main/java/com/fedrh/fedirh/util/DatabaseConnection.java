package com.fedrh.fedirh.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    public static Connection getConnection(String dbType) throws SQLException {
        String url = null;
        String username = null;
        String password = null;

        switch (dbType.toLowerCase()) {
            case "mysql":
                url = "jdbc:mysql://localhost:3306/federation_db_mysql";
                username = "root";
                password = "root";
                break;

            case "postgres":
                url = "jdbc:postgresql://localhost:5438/federation_db_postgres";
                username = "postgres";
                password = "password";
                break;

            case "oracle":
                url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
                username = "system";
                password = "password";
                break;

            default:
                throw new IllegalArgumentException("Type de base de données non pris en charge : " + dbType);
        }

        return DriverManager.getConnection(url, username, password);
    }
}
