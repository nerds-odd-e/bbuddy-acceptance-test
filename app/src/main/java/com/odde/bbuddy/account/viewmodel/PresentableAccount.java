package com.odde.bbuddy.account.viewmodel;

import org.robobinding.itempresentationmodel.ItemContext;
import org.robobinding.itempresentationmodel.ItemPresentationModel;

public class PresentableAccount implements ItemPresentationModel<Account> {

    private String name;
    private int balanceBroughtForward;

    @Override
    public void updateData(Account account, ItemContext itemContext) {
        this.name = account.getName();
        this.balanceBroughtForward = account.getBalanceBroughtForward();
    }

    public String getDisplayOfAccount() {
        return name + " " + balanceBroughtForward;
    }
}
