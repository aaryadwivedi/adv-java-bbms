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
public class DonorDao {
    Connection con;

    public DonorDao(Connection con) {
        this.con = con;
    }
    public boolean addDonor(Donor D){
        boolean test=false;
        String query="insert into donor(u_id, date, type, quant, status)values(?,?,?,?,?)";
        try{
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setInt(1,D.getU_id());
            pst.setString(2,D.getDate());
            pst.setString(3,D.getType());
            pst.setInt(4,D.getQuant());
            pst.setInt(5, D.getStatus());
            pst.executeUpdate();
            test=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return test;
    }
    public List<Donor> getAllDonors(){
        List<Donor> dn=new ArrayList<>();
        try{
            String query="select* from donor";
            PreparedStatement pt= this.con.prepareStatement(query);
            
            ResultSet rs=pt.executeQuery();
            while(rs.next()){
                int d_id=rs.getInt("d_id");
                int u_id=rs.getInt("u_id");
                String type=rs.getString("type");
                String date=rs.getString("date");
                int quant=rs.getInt("quant");
                int status=rs.getInt("status");
                
                Donor row= new Donor(d_id,u_id,date,type,quant,status);
                dn.add(row);
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return dn;
    }
}