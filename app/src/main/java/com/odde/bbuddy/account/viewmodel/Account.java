package com.odde.bbuddy.account.viewmodel;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Account implements Serializable {

    private String name;
    @JsonProperty("balance")
    private int balanceBroughtForward;
    private int id;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getBalanceBroughtForward() {
        return balanceBroughtForward;
    }

    public void setBalanceBroughtForward(int balanceBroughtForward) {
        this.balanceBroughtForward = balanceBroughtForward;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

}
