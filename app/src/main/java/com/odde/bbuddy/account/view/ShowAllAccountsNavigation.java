package com.odde.bbuddy.account.view;

import android.content.Context;
import android.content.Intent;

import com.odde.bbuddy.DashboardActivity;

import javax.inject.Inject;
import javax.inject.Singleton;

@Singleton
public class ShowAllAccountsNavigation {

    private final Context context;

    @Inject
    public ShowAllAccountsNavigation(Context context) {
        this.context = context;
    }

    public void navigate() {
        Intent intent = new Intent(context, DashboardActivity.class);
        intent.putExtra("tabPosition", 1);
        context.startActivity(intent);
    }
}
