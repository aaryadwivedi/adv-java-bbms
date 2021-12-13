/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crud.project;
import java.sql.*;
/**
 *
 * @author Aarya
 */
public class ConnectionDao {
    private static Connection con;
    
    public static Connection getCon()
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bbms","root","");
        }catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }

    static Connection getConnnection() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
