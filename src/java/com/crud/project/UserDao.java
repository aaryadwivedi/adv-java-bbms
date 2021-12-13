/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crud.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Aarya
 */
public class UserDao {
    Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    public boolean addUser(User U){
        boolean test=false;
        String query="insert into user(fname, lname, email, dob, password, acc)values(?,?,?,?,?,?)";
        try{
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1,U.getFname());
            pst.setString(2,U.getLname());
            pst.setString(3,U.getEmail());
            pst.setString(4,U.getDob());
            pst.setString(5,U.getPassword());
            pst.setInt(6, U.getAcc());
            pst.executeUpdate();
            test=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return test;
    }
    public User logUser(String email, String password)
    {
        User Us=null;
        try{
            String query = "select * from user where email = ? and password = ?";
            PreparedStatement pst= this.con.prepareStatement(query);
            pst.setString(1,email);
            pst.setString(2,password);
            
            ResultSet rs= pst.executeQuery();
            while(rs.next()){
                
                int u_id=rs.getInt("u_id");
                String fname=rs.getString("fname");
                String lname=rs.getString("lname");
                String mail=rs.getString("email");
                String dob=rs.getString("dob");
                String pasword=rs.getString("password");
                int acc=rs.getInt("acc");
                
                Us= new User(u_id,fname,lname,mail,dob,pasword,acc);
            }  
        }catch(Exception e){
            e.printStackTrace();
        }
        return Us;
    }
     public List<User> getAllUser()
    {
        List<User> uss=new ArrayList<>();
        try{
            String query = "select * from user order by fname";
            PreparedStatement pst= this.con.prepareStatement(query);            
            ResultSet rs= pst.executeQuery();
            while(rs.next()){
                
                int u_id=rs.getInt("u_id");
                String fname=rs.getString("fname");
                String lname=rs.getString("lname");
                String mail=rs.getString("email");
                String dob=rs.getString("dob");
                String pasword=rs.getString("password");
                int acc=rs.getInt("acc");
                
                User row= new User(u_id,fname,lname,mail,dob,pasword,acc);
                uss.add(row);
            }  
        }catch(Exception e){
            e.printStackTrace();
        }
        return uss;
    }
}
