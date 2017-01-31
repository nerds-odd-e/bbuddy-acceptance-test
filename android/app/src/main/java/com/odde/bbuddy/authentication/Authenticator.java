package com.odde.bbuddy.authentication;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.odde.bbuddy.common.Consumer;
import com.odde.bbuddy.common.JsonBackend;

import org.json.JSONException;
import org.json.JSONObject;

public class Authenticator {

    private final JsonBackend backend;

    public Authenticator(JsonBackend backend) {
        this.backend = backend;
    }

    public void authenticate(Credentials credentials, final Consumer afterSuccess) {
        backend.postRequestForJson("/auth/sign_in", jsonOf(credentials), new Consumer<JSONObject>() {
            @Override
            public void accept(JSONObject jsonObject) {
                afterSuccess.accept("success");
            }
        }, new Runnable() {
            @Override
            public void run() {
                afterSuccess.accept("failed");
            }
        });
    }

    private JSONObject jsonOf(Credentials credentials) {
        try {
            return new JSONObject(new ObjectMapper().writeValueAsString(credentials));
        } catch (JsonProcessingException | JSONException e) {
            throw new IllegalStateException(e);
        }
    }

}
