package com.fedrh.fedirh.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class App {
    public static void main(String[] args) {
        try {
            // Test connexion MySQL
            System.out.println("Connexion à MySQL...");
            Connection mysqlConn = DatabaseConnection.getConnection("mysql");
            testQuery(mysqlConn);

            // Test connexion PostgreSQL
            System.out.println("Connexion à PostgreSQL...");
            Connection postgresConn = DatabaseConnection.getConnection("postgres");
            testQuery(postgresConn);

            // Test connexion Oracle
            System.out.println("Connexion à Oracle...");
            Connection oracleConn = DatabaseConnection.getConnection("oracle");
            testQuery(oracleConn);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void testQuery(Connection conn) {
        try (Statement stmt = conn.createStatement()) {
            ResultSet rs = stmt.executeQuery("SELECT 1 FROM DUAL");
            while (rs.next()) {
                System.out.println("Résultat : " + rs.getInt(1));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}