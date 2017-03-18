package com.odde.bbuddy.account.model;

import android.support.annotation.NonNull;

import com.odde.bbuddy.account.viewmodel.Account;
import com.odde.bbuddy.common.Consumer;
import com.odde.bbuddy.common.JsonBackend;
import com.odde.bbuddy.common.JsonMapper;

import org.json.JSONException;
import org.json.JSONObject;
import org.junit.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.invocation.InvocationOnMock;
import org.mockito.stubbing.Answer;

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.doAnswer;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;

public class EditAccountTest {

    private static final int ID = 1;
    JsonBackend mockJsonBackend = mock(JsonBackend.class);
    JsonMapper<Account> jsonMapper = new JsonMapper<>(Account.class);
    Accounts accounts = new Accounts(mockJsonBackend, jsonMapper);
    Runnable mockRunnable = mock(Runnable.class);

    @Test
    public void edit_account_with_id_name_and_balance_brought_forward() throws JSONException {
        accounts.editAccount(account(ID, "name", 1000), mockRunnable);

        ArgumentCaptor<JSONObject> captor = ArgumentCaptor.forClass(JSONObject.class);
        verify(mockJsonBackend).putRequestForJson(eq("/accounts/" + ID), captor.capture(), any(Consumer.class), any(Runnable.class));
        assertEquals("name", captor.getValue().getString("name"));
        assertEquals(1000, captor.getValue().getInt("balance"));
    }

    @Test
    public void edit_account_successfully() {
        given_backend_will_success();

        accounts.editAccount(account(ID, "name", 1000), mockRunnable);

        verify(mockRunnable).run();
    }

    private void given_backend_will_success() {
        doAnswer(new Answer() {
            @Override
            public Object answer(InvocationOnMock invocation) throws Throwable {
                Consumer consumer = invocation.getArgument(2);
                consumer.accept(new JSONObject());
                return null;
            }
        }).when(mockJsonBackend).putRequestForJson(anyString(), any(JSONObject.class), any(Consumer.class), any(Runnable.class));
    }

    @NonNull
    private Account account(int id, String name, int balanceBroughtForward) {
        Account account = new Account();
        account.setId(id);
        account.setName(name);
        account.setBalanceBroughtForward(balanceBroughtForward);
        return account;
    }

}
