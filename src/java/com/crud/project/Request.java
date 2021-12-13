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
public class Request {
    int r_id;
    int u_id;
    String type;
    int quant;
    int status;

    public Request() {
    }

    public Request(int r_id, int u_id, String type, int quant, int status) {
        this.r_id = r_id;
        this.u_id = u_id;
        this.type = type;
        this.quant = quant;
        this.status = status;
    }

    public Request(int u_id, String type, int quant, int status) {
        this.u_id = u_id;
        this.type = type;
        this.quant = quant;
        this.status = status;
    }

    public int getR_id() {
        return r_id;
    }

    public void setR_id(int r_id) {
        this.r_id = r_id;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
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
    
}
