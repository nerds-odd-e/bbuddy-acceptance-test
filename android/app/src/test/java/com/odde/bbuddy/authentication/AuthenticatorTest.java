package com.odde.bbuddy.authentication;

import com.odde.bbuddy.common.Backend;
import com.odde.bbuddy.common.Consumer;

import org.junit.Test;
import org.mockito.invocation.InvocationOnMock;
import org.mockito.stubbing.Answer;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.doAnswer;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;

public class AuthenticatorTest {

    Backend mockBackend = mock(Backend.class);
    Authenticator authenticator = new Authenticator(mockBackend);
    Credentials credentials = new Credentials("abc@gmail.com", "password");
    Consumer afterSuccess = mock(Consumer.class);

    @Test
    public void authenticate_with_user_name_and_password() throws Exception {
        authenticator.authenticate(credentials, afterSuccess);

        verify(mockBackend).authenticate(eq(credentials), any(Consumer.class));
    }

    @Test
    public void authenticate_successful() {
        given_backend_will_success_with_message("login success");

        authenticator.authenticate(credentials, afterSuccess);

        verify(afterSuccess).accept("login success");
    }

    private void given_backend_will_success_with_message(final String message) {
        doAnswer(new Answer() {
            @Override
            public Object answer(InvocationOnMock invocation) throws Throwable {
                Consumer consumer = invocation.getArgument(1);
                consumer.accept(message);
                return null;
            }
        }).when(mockBackend).authenticate(any(Credentials.class), any(Consumer.class));
    }

}