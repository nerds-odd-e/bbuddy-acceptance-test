package com.odde.bbuddy.di.component;

import com.odde.bbuddy.account.view.EditDeleteAccountActivity;
import com.odde.bbuddy.account.view.AddAccountActivity;
import com.odde.bbuddy.account.view.ShowAllAccountsActivity;
import com.odde.bbuddy.di.module.ActivityModule;

import javax.inject.Singleton;

import dagger.Component;

@Singleton
@Component(modules = ActivityModule.class)
public interface ActivityComponent {
    void inject(AddAccountActivity addAccountActivity);
    void inject(ShowAllAccountsActivity showAllAccountsActivity);
    void inject(EditDeleteAccountActivity editDeleteAccountActivity);
}
