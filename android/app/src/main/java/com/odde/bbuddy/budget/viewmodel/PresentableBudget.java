package com.odde.bbuddy.budget.viewmodel;

import org.robobinding.itempresentationmodel.ItemContext;
import org.robobinding.itempresentationmodel.ItemPresentationModel;

public class PresentableBudget implements ItemPresentationModel<Budget> {
    private String displayOfBudget;

    @Override
    public void updateData(Budget budget, ItemContext itemContext) {
        displayOfBudget = budget.getMonth() + " " + String.valueOf(budget.getAmount());
    }

    public String getDisplayOfBudget() {
        return displayOfBudget;
    }
}
