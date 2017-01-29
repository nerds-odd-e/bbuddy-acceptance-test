package com.odde.bbuddy.authentication;

import java.util.HashMap;
import java.util.Map;

public class AuthenticationToken {

    private final static Map<String, String> authenticationHeaders = new HashMap<>();

    public void updateByHeaders(Map<String, String> headers) {
        updateTokenField(headers, "access-token");
        updateTokenField(headers, "token-type");
        updateTokenField(headers, "uid");
        updateTokenField(headers, "client");
        updateTokenField(headers, "expiry");
    }

    private String updateTokenField(Map<String, String> headers, String fieldName) {
        return authenticationHeaders.put(fieldName, headers.get(fieldName));
    }

    public Map<String, String> getHeaders() {
        return authenticationHeaders;
    }

}
