package com.odde.bbuddy.budget.viewmodel;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Budget {
    private String month;
    private int amount;

    public String getMonth() {
        return month;
    }

    public int getAmount() {
        return amount;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}
