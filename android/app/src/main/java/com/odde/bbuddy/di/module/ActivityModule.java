package com.odde.bbuddy.di.module;

import android.app.Activity;
import android.content.Context;

import com.odde.bbuddy.account.viewmodel.PresentableAccounts;
import com.odde.bbuddy.budget.viewmodel.PresentableBudgets;
import com.odde.bbuddy.di.scope.ActivityScope;

import org.robobinding.ViewBinder;
import org.robobinding.binder.BinderFactoryBuilder;
import org.robobinding.presentationmodel.PresentationModelChangeSupport;

import javax.inject.Named;

import dagger.Module;
import dagger.Provides;

@Module
public class ActivityModule {

    private final Activity activity;

    public ActivityModule(Activity activity) {
        this.activity = activity;
    }

    @Provides @ActivityScope
    Context provideContext() {
        return activity;
    }

    @Provides @ActivityScope
    Activity provideActivity() {
        return activity;
    }

    @Provides @ActivityScope
    ViewBinder provideViewBinder() {
        return new BinderFactoryBuilder().build().createViewBinder(activity);
    }

    @Provides @ActivityScope @Named("accounts")
    PresentationModelChangeSupport providePresentationModelChangeSupportForAccounts(PresentableAccounts presentableAccounts) {
        return new PresentationModelChangeSupport(presentableAccounts);
    }

    @Provides @ActivityScope @Named("budgets")
    PresentationModelChangeSupport providePresentationModelChangeSupportForBudgets(PresentableBudgets presentableBudgets) {
        return new PresentationModelChangeSupport(presentableBudgets);
    }

}
