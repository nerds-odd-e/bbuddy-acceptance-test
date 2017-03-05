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

public class EditableAccountEditTest {

    Accounts mockAccounts = mock(Accounts.class);
    ShowAllAccountsNavigation mockShowAllAccountsNavigation = mock(ShowAllAccountsNavigation.class);
    EditableAccount editableAccount = new EditableAccount(mockAccounts, mockShowAllAccountsNavigation) {{
        setId(1);
    }};

    @Test
    public void edit_should_correctly_edit_account() {
        given_account_id_is(1);

        editAccount("name", 100);

        verifyAccountsEditWithAccount(1, "name", 100);
    }

    @Test
    public void edit_should_show_all_accounts_after_success() {
        given_edit_account_will_success();

        editAccount("name", 100);

        verify(mockShowAllAccountsNavigation).navigate();
    }

    private void verifyAccountsEditWithAccount(int id, String name, int balanceBroughtForward) {
        ArgumentCaptor<Account> captor = ArgumentCaptor.forClass(Account.class);
        verify(mockAccounts).editAccount(captor.capture(), any(Runnable.class));
        assertEquals(id, captor.getValue().getId());
        assertEquals(name, captor.getValue().getName());
        assertEquals(balanceBroughtForward, captor.getValue().getBalanceBroughtForward());
    }

    private void editAccount(String name, int balanceBroughtForward) {
        editableAccount.setName(name);
        editableAccount.setBalanceBroughtForward(balanceBroughtForward);
        editableAccount.update();
    }

    private void given_account_id_is(int id) {
        editableAccount.setId(id);
    }

    private void given_edit_account_will_success() {
        doAnswer(new Answer() {
            @Override
            public Object answer(InvocationOnMock invocation) throws Throwable {
                Runnable afterSuccess = invocation.getArgument(1);
                afterSuccess.run();
                return null;
            }
        }).when(mockAccounts).editAccount(any(Account.class), any(Runnable.class));
    }
}
