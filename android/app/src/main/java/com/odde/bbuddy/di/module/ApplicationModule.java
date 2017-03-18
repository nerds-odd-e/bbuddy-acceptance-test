package com.odde.bbuddy.di.module;

import android.app.Application;

import com.odde.bbuddy.account.model.Accounts;
import com.odde.bbuddy.account.viewmodel.Account;
import com.odde.bbuddy.budget.model.Budgets;
import com.odde.bbuddy.budget.viewmodel.Budget;
import com.odde.bbuddy.common.JsonBackend;
import com.odde.bbuddy.common.JsonMapper;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;

@Module
public class ApplicationModule {

    private final Application application;

    public ApplicationModule(Application application) {
        this.application = application;
    }

    @Provides @Singleton
    public JsonBackend provideJsonBackend() {
        return new JsonBackend(application);
    }

    @Provides @Singleton
    public Accounts provideAccounts(JsonBackend jsonBackend) {
        return new Accounts(jsonBackend, new JsonMapper<>(Account.class));
    }

    @Provides @Singleton
    public Budgets provideBudgets(JsonBackend jsonBackend) {
        return new Budgets(jsonBackend, new JsonMapper<>(Budget.class));
    }

}
