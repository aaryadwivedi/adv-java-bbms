/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crud.project;

import java.sql.Connection;

/**
 *
 * @author Aarya
 */
public class bloodDao {
    Connection con;

    public bloodDao(Connection con) {
        this.con = con;
    }
    
}
