package com.odde.bbuddy.authentication;

import android.support.annotation.NonNull;

import com.odde.bbuddy.common.Consumer;
import com.odde.bbuddy.common.JsonBackend;

import org.json.JSONException;
import org.json.JSONObject;
import org.junit.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.ArgumentMatchers;
import org.mockito.invocation.InvocationOnMock;
import org.mockito.stubbing.Answer;

import java.util.HashMap;

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.doAnswer;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;

public class AuthenticatorTest {

    JsonBackend mockBackend = mock(JsonBackend.class);
    AuthenticationToken mockAuthenticationToken = mock(AuthenticationToken.class);
    Authenticator authenticator = new Authenticator(mockBackend, mockAuthenticationToken);
    Credentials credentials = new Credentials("abc@gmail.com", "password");
    Consumer afterSuccess = mock(Consumer.class);

    @Test
    public void authenticate_with_user_name_and_password() throws JSONException {
        authenticate();

        ArgumentCaptor<JSONObject> captor = ArgumentCaptor.forClass(JSONObject.class);
        verify(mockBackend).postRequestForJson(eq("/auth/sign_in"), captor.capture(), any(Consumer.class), any(Runnable.class), any(Consumer.class));
        assertEquals("abc@gmail.com", captor.getValue().getString("email"));
        assertEquals("password", captor.getValue().getString("password"));
    }

    private void authenticate() {
        authenticator.authenticate(credentials, afterSuccess);
    }

    @Test
    public void authenticate_successful() {
        given_jsonbackend_will_response(success());

        authenticate();

        verify(afterSuccess).accept("success");
    }

    @Test
    public void authenticate_failed() {
        given_jsonbackend_will_response(failed());

        authenticate();

        verify(afterSuccess).accept("failed");
    }

    @Test
    public void update_authentication_token() {
        given_jsonbackend_will_response(success());

        authenticate();

        verify(mockAuthenticationToken).updateByHeaders(ArgumentMatchers.<String, String>anyMap());
    }

    @NonNull
    private Answer failed() {
        return new Answer() {
            @Override
            public Object answer(InvocationOnMock invocation) throws Throwable {
                Runnable runnable = invocation.getArgument(3);
                runnable.run();
                return null;
            }
        };
    }

    private void given_jsonbackend_will_response(Answer answer) {
        doAnswer(answer).when(mockBackend).postRequestForJson(anyString(), any(JSONObject.class), any(Consumer.class), any(Runnable.class), any(Consumer.class));
    }

    @NonNull
    private Answer success() {
        return new Answer() {
            @Override
            public Object answer(InvocationOnMock invocation) throws Throwable {
                Consumer consumer = invocation.getArgument(2);
                consumer.accept(new JSONObject());
                Consumer headerConsumer = invocation.getArgument(4);
                headerConsumer.accept(new HashMap<>());
                return null;
            }
        };
    }

}