package com.odde.bbuddy.authentication;

import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.assertEquals;

public class AuthenticationTokenTest {

    @Test
    public void update_and_get_headers() {
        AuthenticationToken token = new AuthenticationToken();
        Map<String, String> headers = new HashMap<String, String>() {{
            put("access-token", "access-token");
            put("token-type", "token-type");
            put("uid", "uid");
            put("client", "client");
            put("expiry", "expiry");
        }};

        token.updateByHeaders(headers);

        assertEquals(headers, token.getHeaders());
    }

}