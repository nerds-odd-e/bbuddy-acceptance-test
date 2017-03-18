package com.odde.bbuddy.budget.view;

import android.app.Activity;

import com.odde.bbuddy.di.scope.ActivityScope;

import javax.inject.Inject;

@ActivityScope
public class ShowAllBudgetsNavigation {

    private final Activity activity;

    @Inject
    public ShowAllBudgetsNavigation(Activity activity) {
        this.activity = activity;
    }

    public void navigate() {
        activity.finish();
    }
}
