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
}
