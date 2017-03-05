package com.odde.bbuddy.account.viewmodel;

import com.odde.bbuddy.account.model.Accounts;
import com.odde.bbuddy.account.view.ShowAllAccountsNavigation;

import org.junit.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.invocation.InvocationOnMock;
import org.mockito.stubbing.Answer;

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentCaptor.forClass;
import static org.mockito.Mockito.any;
import static org.mockito.Mockito.doAnswer;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;

public class EditableAccountDeleteTest {

    Accounts mockAccounts = mock(Accounts.class);
    ShowAllAccountsNavigation mockShowAllAccountsNavigation = mock(ShowAllAccountsNavigation.class);
    EditableAccount editableAccount = new EditableAccount(mockAccounts, mockShowAllAccountsNavigation) {{
       setId(1);
    }};

    @Test
    public void delete_should_correctly_delete_account() {
        given_account_id_is(1);

        editableAccount.delete();

        verifyAccountsDeleteCalledWithAccount(1);
    }

    @Test
    public void delete_should_show_all_accounts_after_success() {
        given_account_delete_will_success();

        editableAccount.delete();

        verify(mockShowAllAccountsNavigation).navigate();
    }

    private void given_account_delete_will_success() {
        doAnswer(new Answer() {
            @Override
            public Object answer(InvocationOnMock invocation) throws Throwable {
                Runnable runnable = invocation.getArgument(1);
                runnable.run();
                return null;
            }
        }).when(mockAccounts).deleteAccount(any(Account.class), any(Runnable.class));
    }

    private void given_account_id_is(int id) {
        editableAccount.setId(id);
    }

    private void verifyAccountsDeleteCalledWithAccount(int id) {
        ArgumentCaptor<Account> captor = forClass(Account.class);
        verify(mockAccounts).deleteAccount(captor.capture(), any(Runnable.class));
        assertEquals(id, captor.getValue().getId());
    }

}
