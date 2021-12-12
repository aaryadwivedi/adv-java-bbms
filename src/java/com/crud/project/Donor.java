/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crud.project;

/**
 *
 * @author Aarya
 */
public class Donor {
    int d_id;
    int u_id;
    String date;
    String type;
    int quant;
    int status;

    public Donor() {
    }

    public Donor(int u_id, String date, String type, int quant, int status) {
        this.u_id = u_id;
        this.date = date;
        this.type = type;
        this.quant = quant;
        this.status = status;
    }

    public Donor(int d_id, int u_id, String date, String type, int quant, int status) {
        this.d_id = d_id;
        this.u_id = u_id;
        this.date = date;
        this.type = type;
        this.quant = quant;
        this.status = status;
    }

    public int getD_id() {
        return d_id;
    }

    public void setD_id(int d_id) {
        this.d_id = d_id;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getQuant() {
        return quant;
    }

    public void setQuant(int quant) {
        this.quant = quant;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Donor{" + "d_id=" + d_id + ", u_id=" + u_id + ", date=" + date + ", type=" + type + ", quant=" + quant + ", status=" + status + '}';
    }
    
    
}
