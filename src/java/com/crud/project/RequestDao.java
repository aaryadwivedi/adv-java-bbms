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
public class RequestDao {
    Connection con;

    public RequestDao(Connection con) {
        this.con = con;
    }
    public boolean addRequest(Request R){
        boolean test=false;
        String query="insert into request(r_id, u_id, type, quant, status)values(?,?,?,?,?)";
        try{
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setInt(1,R.getR_id());
            pst.setInt(2,R.getU_id());
            pst.setString(3,R.getType());
            pst.setInt(4,R.getQuant());
            pst.setInt(5, R.getStatus());
            pst.executeUpdate();
            test=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return test;
    }
     public List<Request> getAllR(){
        List<Request> dn=new ArrayList<>();
        try{
            String query="select* from request where status = 0 order by r_id desc";
            PreparedStatement pt= this.con.prepareStatement(query);
            
            ResultSet rs=pt.executeQuery();
            while(rs.next()){
                int d_id=rs.getInt("r_id");
                int u_id=rs.getInt("u_id");
                String type=rs.getString("type");
                
                int quant=rs.getInt("quant");
                int status=rs.getInt("status");
                
                Request row= new Request(d_id,u_id,type,quant,status);
                dn.add(row);
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return dn;
    }
    public List<Request> getAllRequest(){
        List<Request> dn=new ArrayList<>();
        try{
            String query="select* from request where status = 1 order by r_id desc";
            PreparedStatement pt= this.con.prepareStatement(query);
            
            ResultSet rs=pt.executeQuery();
            while(rs.next()){
                int d_id=rs.getInt("r_id");
                int u_id=rs.getInt("u_id");
                String type=rs.getString("type");
                
                int quant=rs.getInt("quant");
                int status=rs.getInt("status");
                
                Request row= new Request(d_id,u_id,type,quant,status);
                dn.add(row);
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return dn;
    }
    public boolean editStat(int id,int stat){
        boolean t=false;
        String query="update request set status=? where r_id=?";
        try{
            PreparedStatement pst = this.con.prepareStatement(query);
            
            pst.setInt(1, stat);
            pst.setInt(2, id);
            
            pst.executeUpdate();
            
            t=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return t;
    }
}
