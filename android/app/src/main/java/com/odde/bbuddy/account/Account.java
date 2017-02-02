package com.odde.bbuddy.account;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Account implements Serializable {

    private String name;

    @JsonProperty("balance")
    private int balanceBroughtForward;
    private int id;

    @JsonCreator
    public Account(@JsonProperty("name") String name, @JsonProperty("balance") int balanceBroughtForward) {
        this.name = name;
        this.balanceBroughtForward = balanceBroughtForward;
    }

    public String getName() {
        return name;
    }

    public int getBalanceBroughtForward() {
        return balanceBroughtForward;
    }

    @Override
    public String toString() {
        return name + " " + balanceBroughtForward;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setBalanceBroughtForward(int balanceBroughtForward) {
        this.balanceBroughtForward = balanceBroughtForward;
    }
}
