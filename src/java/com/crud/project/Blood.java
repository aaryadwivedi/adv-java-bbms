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
public class Blood {
    String type;
    int quant;

    public Blood() {
    }

    public Blood(String type, int quant) {
        this.type = type;
        this.quant = quant;
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
}
