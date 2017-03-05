package com.odde.bbuddy.account.model;

import android.support.annotation.NonNull;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.odde.bbuddy.account.viewmodel.Account;
import com.odde.bbuddy.common.Consumer;
import com.odde.bbuddy.common.JsonBackend;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Singleton;

@Singleton
public class Accounts {

    private final JsonBackend jsonBackend;

    @Inject
    public Accounts(JsonBackend jsonBackend) {
        this.jsonBackend = jsonBackend;
    }

    public void processAllAccounts(final Consumer<List<Account>> consumer) {
        jsonBackend.getRequestForJsonArray("/accounts", new Consumer<JSONArray>() {
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

    public void addAccount(Account account, final Runnable afterSuccess) {
        jsonBackend.postRequestForJson("/accounts", jsonOf(account), new Consumer<JSONObject>() {
            @Override
            public void accept(JSONObject jsonObject) {
                afterSuccess.run();
            }
        }, new Runnable() {
            @Override
            public void run() {

            }
        });
    }

    @NonNull
    private JSONObject jsonOf(Account account) {
        try {
            return new JSONObject(new ObjectMapper().writeValueAsString(account));
        } catch (JSONException | JsonProcessingException e) {
            throw new IllegalStateException();
        }
    }

    public void editAccount(Account account, final Runnable afterSuccess) {
        jsonBackend.putRequestForJson("/accounts/" + account.getId(), jsonOf(account), new Consumer<JSONObject>() {
            @Override
            public void accept(JSONObject jsonObject) {
                afterSuccess.run();
            }
        }, new Runnable() {
            @Override
            public void run() {

            }
        });
    }

    public void deleteAccount(Account account, final Runnable afterSuccess) {
        jsonBackend.deleteRequestForJson("/accounts/" + account.getId(), new Consumer<JSONObject>() {
            @Override
            public void accept(JSONObject jsonObject) {
                afterSuccess.run();
            }
        }, new Runnable() {
            @Override
            public void run() {

            }
        });
    }
}
