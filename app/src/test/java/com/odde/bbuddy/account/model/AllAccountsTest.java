package com.odde.bbuddy.account.model;

import android.support.annotation.NonNull;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.odde.bbuddy.account.viewmodel.Account;
import com.odde.bbuddy.common.Consumer;
import com.odde.bbuddy.common.JsonBackend;
import com.odde.bbuddy.common.JsonMapper;

import org.json.JSONArray;
import org.junit.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.invocation.InvocationOnMock;
import org.mockito.stubbing.Answer;

import java.util.List;

import static java.util.Arrays.asList;
import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.doAnswer;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;

public class AllAccountsTest {

    JsonBackend mockJsonBackend = mock(JsonBackend.class);
    JsonMapper<Account> jsonMapper = new JsonMapper<>(Account.class);
    Accounts accounts = new Accounts(mockJsonBackend, jsonMapper);
    Consumer mockConsumer = mock(Consumer.class);

    @Test
    public void all_accounts_with_authentication_headers() {
        processAllAccounts();

        verify(mockJsonBackend).getRequestForJsonArray(eq("/accounts"), any(Consumer.class));
    }

    @Test
    public void all_accounts_with_some_data_from_backend() {
        given_backend_return_json_with_account(account("name", 1000));

        processAllAccounts();

        verifyAccountConsumed("name", 1000);
    }

    private Account account(String name, int balanceBroughtForward) {
        Account account = new Account();
        account.setName(name);
        account.setBalanceBroughtForward(balanceBroughtForward);
        return account;
    }

    private void verifyAccountConsumed(String expectedName, int expectedBalanceBroughtForward) {
        ArgumentCaptor<List<Account>> captor = ArgumentCaptor.forClass(List.class);
        verify(mockConsumer).accept(captor.capture());
        assertEquals(expectedName, captor.getValue().get(0).getName());
        assertEquals(expectedBalanceBroughtForward, captor.getValue().get(0).getBalanceBroughtForward());
    }

    private void given_backend_return_json_with_account(final Account account) {
        given_backend_will_return(jsonArrayOf(account));
    }

    private void given_backend_will_return(Answer answer) {
        doAnswer(answer).when(mockJsonBackend).getRequestForJsonArray(anyString(), any(Consumer.class));
    }

    @NonNull
    private Answer jsonArrayOf(final Account account) {
        return new Answer() {
            @Override
            public Object answer(InvocationOnMock invocation) throws Throwable {
                Consumer consumer = invocation.getArgument(1);
                consumer.accept(new JSONArray(new ObjectMapper().writeValueAsString(asList(account))));
                return null;
            }
        };
    }

    private void processAllAccounts() {
        accounts.processAllAccounts(mockConsumer);
    }

}