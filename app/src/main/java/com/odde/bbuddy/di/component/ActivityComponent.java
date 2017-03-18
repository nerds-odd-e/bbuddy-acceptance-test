package com.odde.bbuddy.di.component;

import com.odde.bbuddy.account.view.AddAccountActivity;
import com.odde.bbuddy.account.view.EditDeleteAccountActivity;
import com.odde.bbuddy.account.view.ShowAllAccountsActivity;
import com.odde.bbuddy.budget.view.AddBudgetActivity;
import com.odde.bbuddy.budget.view.ShowAllBudgetsActivity;
import com.odde.bbuddy.di.module.ActivityModule;
import com.odde.bbuddy.di.scope.ActivityScope;

import dagger.Subcomponent;

@ActivityScope
@Subcomponent(modules = ActivityModule.class)
public interface ActivityComponent {
    void inject(AddAccountActivity addAccountActivity);
    void inject(ShowAllAccountsActivity showAllAccountsActivity);
    void inject(EditDeleteAccountActivity editDeleteAccountActivity);
    void inject(AddBudgetActivity addBudgetActivity);
    void inject(ShowAllBudgetsActivity showAllBudgetsActivity);
}
