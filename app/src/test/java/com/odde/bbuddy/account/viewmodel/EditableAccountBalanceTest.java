package com.odde.bbuddy.account.viewmodel;

import com.odde.bbuddy.account.model.Accounts;
import com.odde.bbuddy.account.view.ShowAllAccountsNavigation;

import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;

public class EditableAccountBalanceTest {

    Accounts mockAccounts = mock(Accounts.class);
    ShowAllAccountsNavigation mockShowAllAccountsNavigation = mock(ShowAllAccountsNavigation.class);
    EditableAccount editableAccount = new EditableAccount(mockAccounts, mockShowAllAccountsNavigation);

    @Test
    public void display_balance_brought_forward_for_view() {
        editableAccount.setBalanceBroughtForward(100);

        assertEquals("100", editableAccount.getBalanceBroughtForwardForView());
    }

    @Test
    public void get_balance_brought_forward_from_view() {
        editableAccount.setBalanceBroughtForwardForView("100");

        assertEquals(100, editableAccount.getBalanceBroughtForward());
    }

    @Test
    public void value_not_changed_if_balance_brought_forward_from_view_is_not_a_number() {
        editableAccount.setBalanceBroughtForward(50);

        editableAccount.setBalanceBroughtForwardForView("not a number");

        assertEquals(50, editableAccount.getBalanceBroughtForward());
    }

}