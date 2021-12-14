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
public class bloodDao {
    Connection con;

    public bloodDao(Connection con) {
        this.con = con;
    }
   public List<Blood> getAllBlood(){
        List<Blood> dn=new ArrayList<>();
        try{
            String query="select* from blood  order by type desc";
            PreparedStatement pt= this.con.prepareStatement(query);
            
            ResultSet rs=pt.executeQuery();
            while(rs.next()){
                String type=rs.getString("type");
                int quant=rs.getInt("quant");
                Blood row= new Blood(type,quant);
                dn.add(row);
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return dn;
    }
   public int getBlood(String type){
        String query="select* from blood  where type = ?";
        int q = 0;
        try{
            PreparedStatement pst = this.con.prepareStatement(query);
            
            pst.setString(1, type);            
            ResultSet rs= pst.executeQuery();
            while(rs.next()){
                String tp=rs.getString("type");
                q=rs.getInt("quant"); 
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return q;
    }
   public boolean addBlood(String type,int quant){
        boolean t=false;
        String query="update blood set quant=? where type=?";
        try{
            PreparedStatement pst = this.con.prepareStatement(query);
            
            pst.setInt(1, quant);
            pst.setString(2, type);
            
            pst.executeUpdate();
            
            t=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return t;
    }
   
}
