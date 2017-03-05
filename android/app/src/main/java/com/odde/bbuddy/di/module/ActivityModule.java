package com.odde.bbuddy.di.module;

import android.app.Activity;
import android.content.Context;

import com.odde.bbuddy.account.viewmodel.PresentableAccounts;

import org.robobinding.ViewBinder;
import org.robobinding.binder.BinderFactoryBuilder;
import org.robobinding.presentationmodel.PresentationModelChangeSupport;

import dagger.Module;
import dagger.Provides;

@Module
public class ActivityModule {

    private final Activity activity;

    public ActivityModule(Activity activity) {
        this.activity = activity;
    }

    @Provides
    Context provideContext() {
        return activity;
    }

    @Provides
    ViewBinder provideViewBinder() {
        return new BinderFactoryBuilder().build().createViewBinder(activity);
    }

    @Provides
    PresentationModelChangeSupport providePresentationModelChangeSupport(PresentableAccounts presentableAccounts) {
        return new PresentationModelChangeSupport(presentableAccounts);
    }

}
