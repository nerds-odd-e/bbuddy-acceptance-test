package com.odde.bbuddy.authentication;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.odde.bbuddy.common.Consumer;
import com.odde.bbuddy.common.JsonBackend;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.Map;

public class Authenticator {

    private final JsonBackend backend;
    private final AuthenticationToken token;

    public Authenticator(JsonBackend backend, AuthenticationToken token) {
        this.backend = backend;
        this.token = token;
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
        }, new Consumer<Map<String, String>>() {
            @Override
            public void accept(Map<String, String> headers) {
                token.updateByHeaders(headers);
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
