/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.mavenproject1;

/**
 *
 * @author student
 */
public class cartitem {
    String pid1;
    String pname1;
    int qty1;

    public cartitem(String pid1, String pname1, int qty1) {
        this.pid1 = pid1;
        this.pname1 = pname1;
        this.qty1 = qty1;
    }

    public String getPid1() {
        return pid1;
    }

    public String getPname1() {
        return pname1;
    }

    public int getQty1() {
        return qty1;
    }

    public void setPid1(String pid1) {
        this.pid1 = pid1;
    }

    public void setPname1(String pname1) {
        this.pname1 = pname1;
    }

    public void setQty1(int qty1) {
        this.qty1 = qty1;
    }
    
}
