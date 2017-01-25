package com.odde.bbuddy.authentication;

import com.odde.bbuddy.common.Backend;
import com.odde.bbuddy.common.Consumer;

public class Authenticator {

    private final Backend backend;

    public Authenticator(Backend backend) {
        this.backend = backend;
    }

    public void authenticate(Credentials credentials, final Consumer afterSuccess) {
        backend.authenticate(credentials, new Consumer<String>() {
            @Override
            public void accept(String message) {
                afterSuccess.accept(message);
            }
        });
    }
}
