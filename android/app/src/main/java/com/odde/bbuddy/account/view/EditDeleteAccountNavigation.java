package com.odde.bbuddy.account.view;

import android.content.Context;
import android.content.Intent;

import com.odde.bbuddy.account.viewmodel.Account;
import com.odde.bbuddy.di.scope.ActivityScope;

import javax.inject.Inject;

@ActivityScope
public class EditDeleteAccountNavigation {

    private final Context context;

    @Inject
    public EditDeleteAccountNavigation(Context context) {
        this.context = context;
    }

    public void navigate(Account account) {
        Intent intent = new Intent(context, EditDeleteAccountActivity.class);
        intent.putExtra("account", account);
        context.startActivity(intent);
    }
}
