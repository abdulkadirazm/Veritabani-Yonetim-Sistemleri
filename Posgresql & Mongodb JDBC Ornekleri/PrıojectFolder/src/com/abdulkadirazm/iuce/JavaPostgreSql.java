package com.abdulkadirazm.iuce;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class JavaPostgreSql {
    private static int id;
    private static Scanner input;
    private static int choice;
    private static String idStr = "ID";
    private static String nameStr = "NAME";
    private static String genderStr = "GENDER";
    private static String parentIdStr = "PARENT_ID";

    public static void main(String[] args) {
        choice = 0;
        input = new Scanner(System.in);

        menu();
        choice = input.nextInt();

        while (choice != 0) {

            switch (choice) {

                case 1:
                    System.out.println("ID :");
                    id = input.nextInt();
                    findGens(id);
                    break;
                case 2:
                    System.out.println("ID :");
                    id = input.nextInt();
                    findDescendants(id);
                    break;
                case 0:
                    choice = 0;
                    break;
                default:
                    System.out.println("Please,Enter 1 or 2");
                    break;

            }

            menu();
            choice = input.nextInt();
        }

    }

    private static void findGens(int use_parent) {

        try (Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/odev", "postgres", "postgres")) {
            System.out.println("Connected to PostgreSQL database!");
            Statement statement = connection.createStatement();
            String ROM = "\"" + id + "\"";
            ResultSet resultSet = statement.executeQuery(
                    "WITH RECURSIVE t\n" +
                    "    AS\n" +
                    "    (\n" +
                    "        SELECT * \n" +
                    "          FROM person p\n" +
                    "         WHERE p.id = "+ use_parent +"\n" +
                    "         UNION ALL\n" +
                    "        SELECT person.*\n" +
                    "          FROM person\n" +
                    "          JOIN t prev ON (person.id = prev.parentID )\n" +
                    "\t)\n" +
                    "SELECT * FROM t;\n");

            System.out.printf("%-2.2s %-8.10s  %-10.10s %-2.9s%n", idStr, nameStr, genderStr, parentIdStr);
            System.out.println("----------------------------------");
            String s = String.valueOf(use_parent);
            while (resultSet.next()) {
                if (!resultSet.getString("id").equals(s))
                    System.out.printf("%-2.2s %-8.10s  %-10.10s %-2.5s%n", resultSet.getString("id"), resultSet.getString("name"), resultSet.getString("gender"), resultSet.getString("parentID"));

            }
        } catch (SQLException e) {
            System.out.println("Connection failure.");
            e.printStackTrace();
        }
    }

    private static void findDescendants(int start_id) {
        try (Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/odev", "postgres", "postgres")) {
            System.out.println("Connected to PostgreSQL database!");
            Statement statement = connection.createStatement();
            String ROM = "\"" + id + "\"";
            ResultSet resultSet = statement.executeQuery(
                    "WITH RECURSIVE t\n" +
                    "    AS\n" +
                    "    (\n" +
                    "        SELECT * \n" +
                    "          FROM person p\n" +
                    "         WHERE p.id = " + start_id + "\n" +
                    "         UNION ALL\n" +
                    "        SELECT next.*\n" +
                    "          FROM t prev\n" +
                    "          JOIN person next ON (next.parentID = prev.id)\n" +
                    "    )\n" +
                    "SELECT * FROM t;\n");
            System.out.printf("%-2.2s %-8.10s  %-10.10s %-2.9s%n", idStr, nameStr, genderStr, parentIdStr);
            System.out.println("----------------------------------");
            String s = String.valueOf(start_id);
            while (resultSet.next()) {
                if (!resultSet.getString("id").equals(s))
                    System.out.printf("%-2.2s %-8.10s  %-10.10s %-2.9s%n", resultSet.getString("id"), resultSet.getString("name"), resultSet.getString("gender"), resultSet.getString("parentID"));
            }
        } catch (SQLException e) {
            System.out.println("Connection failure.");
            e.printStackTrace();
        }
    }



    private static void menu() {
        System.out.println("Menu");
        System.out.println("0: Çıkış");
        System.out.println("1: Soy ağacı sorgula");
        System.out.println("2: Soyundan gelenleri sorgula");
        System.out.println("Enter choice ?");
    }
}