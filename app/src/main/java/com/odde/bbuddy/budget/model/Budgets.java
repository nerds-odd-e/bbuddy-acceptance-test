package com.odde.bbuddy.budget.model;

import com.odde.bbuddy.budget.viewmodel.Budget;
import com.odde.bbuddy.common.Consumer;
import com.odde.bbuddy.common.JsonBackend;
import com.odde.bbuddy.common.JsonMapper;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.List;

public class Budgets {

    private final JsonBackend jsonBackend;
    private final JsonMapper<Budget> jsonMapper;

    public Budgets(JsonBackend jsonBackend, JsonMapper<Budget> jsonMapper) {
        this.jsonBackend = jsonBackend;
        this.jsonMapper = jsonMapper;
    }

    public void add(Budget budget) {
        jsonBackend.postRequestForJson("/budgets", jsonMapper.jsonOf(budget), new Consumer<JSONObject>() {
            @Override
            public void accept(JSONObject jsonObject) {

            }
        }, new Runnable() {
            @Override
            public void run() {

            }
        });
    }

    public void processAllBudgets(final Consumer<List<Budget>> consumer) {
        jsonBackend.getRequestForJsonArray("/budgets", new Consumer<JSONArray>() {
            @Override
            public void accept(JSONArray response) {
                consumer.accept(jsonMapper.fromJsonArray(response));
            }
        });
    }

}
