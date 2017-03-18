package com.odde.bbuddy.di.component;

import android.app.Activity;

import com.odde.bbuddy.BbuddyApplication;
import com.odde.bbuddy.di.module.ActivityModule;

public class ActivityComponentFactory {
    public static ActivityComponent createActivityComponentBy(Activity activity) {
        return ((BbuddyApplication)activity.getApplication()).getApplicationComponent().plus(new ActivityModule(activity));
    }
}
