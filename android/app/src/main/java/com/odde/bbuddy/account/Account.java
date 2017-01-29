package com.odde.bbuddy.account;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Account {

    private String name;
    private int balanceBroughtForward;

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

}
