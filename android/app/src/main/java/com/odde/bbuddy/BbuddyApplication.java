package com.odde.bbuddy;

import android.app.Application;

import com.odde.bbuddy.di.component.ApplicationComponent;
import com.odde.bbuddy.di.component.DaggerApplicationComponent;
import com.odde.bbuddy.di.module.ApplicationModule;

public class BbuddyApplication extends Application {

    private ApplicationComponent applicationComponent;

    @Override
    public void onCreate() {
        super.onCreate();
        initApplicationComponent();
    }

    private void initApplicationComponent() {
        applicationComponent = DaggerApplicationComponent.builder()
                .applicationModule(new ApplicationModule(this))
                .build();
    }

    public ApplicationComponent getApplicationComponent() {
        return applicationComponent;
    }

}
