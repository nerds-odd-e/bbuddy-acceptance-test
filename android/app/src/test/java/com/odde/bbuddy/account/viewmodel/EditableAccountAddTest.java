package com.odde.bbuddy.account.viewmodel;

import com.odde.bbuddy.account.model.Accounts;
import com.odde.bbuddy.account.view.ShowAllAccountsNavigation;

import org.junit.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.invocation.InvocationOnMock;
import org.mockito.stubbing.Answer;

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.doAnswer;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;

public class EditableAccountAddTest {

    Accounts mockAccounts = mock(Accounts.class);
    ShowAllAccountsNavigation mockShowAllAccountsNavigation = mock(ShowAllAccountsNavigation.class);
    EditableAccount editableAccount = new EditableAccount(mockAccounts, mockShowAllAccountsNavigation);

    @Test
    public void add_should_correctly_add_account() {
        addAccount("name", 100);

        verifyAccountsAddWithAccount("name", 100);
    }

    @Test
    public void add_should_show_all_accounts_after_add_account_success() {
        given_add_account_will_success();

        addAccount("name", 100);

        verify(mockShowAllAccountsNavigation).navigate();
    }

    private void given_add_account_will_success() {
        doAnswer(new Answer() {
            @Override
            public Object answer(InvocationOnMock invocation) throws Throwable {
                Runnable afterSuccess = invocation.getArgument(1);
                afterSuccess.run();
                return null;
            }
        }).when(mockAccounts).addAccount(any(Account.class), any(Runnable.class));
    }

    private void verifyAccountsAddWithAccount(String name, int balanceBroughtForward) {
        ArgumentCaptor<Account> captor = ArgumentCaptor.forClass(Account.class);
        verify(mockAccounts).addAccount(captor.capture(), any(Runnable.class));
        assertEquals(name, captor.getValue().getName());
        assertEquals(balanceBroughtForward, captor.getValue().getBalanceBroughtForward());
    }

    private void addAccount(String name, int balanceBroughtForward) {
        editableAccount.setName(name);
        editableAccount.setBalanceBroughtForward(balanceBroughtForward);
        editableAccount.add();
    }

}
