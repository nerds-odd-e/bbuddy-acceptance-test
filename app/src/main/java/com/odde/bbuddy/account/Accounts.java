package com.odde.bbuddy.account;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.odde.bbuddy.authentication.AuthenticationToken;
import com.odde.bbuddy.common.Consumer;
import com.odde.bbuddy.common.JsonBackend;

import org.json.JSONArray;

import java.io.IOException;
import java.util.List;

public class Accounts {

    private final JsonBackend jsonBackend;
    private final AuthenticationToken token;

    public Accounts(JsonBackend jsonBackend, AuthenticationToken token) {
        this.jsonBackend = jsonBackend;
        this.token = token;
    }

    public void processAllAccounts(final Consumer<List<Account>> consumer) {
        jsonBackend.getRequestForJsonArray("/accounts", token.getHeaders(), new Consumer<JSONArray>() {
            @Override
            public void accept(JSONArray response) {
                consumer.accept(accountsFromJson(response));
            }
        });
    }

    private List<Account> accountsFromJson(JSONArray response) {
        try {
            return new ObjectMapper().readValue(response.toString(), new TypeReference<List<Account>>(){});
        } catch (IOException e) {
            throw new IllegalStateException();
        }
    }

}
