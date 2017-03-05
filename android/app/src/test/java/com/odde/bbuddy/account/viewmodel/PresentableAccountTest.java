package com.odde.bbuddy.account.viewmodel;

import android.support.annotation.NonNull;

import org.junit.Test;
import org.robobinding.itempresentationmodel.ItemContext;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;

public class PresentableAccountTest {

    @Test
    public void display_of_account() {
        PresentableAccount presentableAccount = new PresentableAccount();
        ItemContext stubItemContext = mock(ItemContext.class);

        presentableAccount.updateData(account("name", 100), stubItemContext);

        assertEquals("name 100", presentableAccount.getDisplayOfAccount());
    }

    @NonNull
    private Account account(String name, int balanceBroughtForward) {
        Account account = new Account();
        account.setName(name);
        account.setBalanceBroughtForward(balanceBroughtForward);
        return account;
    }

}