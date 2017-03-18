package com.odde.bbuddy.budget.viewmodel;

import com.odde.bbuddy.budget.model.Budgets;
import com.odde.bbuddy.common.Consumer;
import com.odde.bbuddy.di.scope.ActivityScope;

import org.robobinding.annotation.ItemPresentationModel;
import org.robobinding.annotation.PresentationModel;
import org.robobinding.presentationmodel.HasPresentationModelChangeSupport;
import org.robobinding.presentationmodel.PresentationModelChangeSupport;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import dagger.Lazy;

@PresentationModel
@ActivityScope
public class PresentableBudgets implements HasPresentationModelChangeSupport {

    private final Lazy<PresentationModelChangeSupport> presentationModelChangeSupportLoader;
    private final Budgets budgets;
    private List<Budget> allBudgets = new ArrayList<>();

    @Inject
    public PresentableBudgets(Budgets budgets, @Named("budgets") Lazy<PresentationModelChangeSupport> presentationModelChangeSupportLoader) {
        this.budgets = budgets;
        this.presentationModelChangeSupportLoader = presentationModelChangeSupportLoader;
        refresh();
    }

    @ItemPresentationModel(value = PresentableBudget.class)
    public List<Budget> getBudgets() {
        return allBudgets;
    }

    public void refresh() {
        budgets.processAllBudgets(new Consumer<List<Budget>>() {
            @Override
            public void accept(List<Budget> budgets) {
                allBudgets.clear();
                allBudgets.addAll(budgets);
                presentationModelChangeSupport().refreshPresentationModel();
            }
        });
    }

    private PresentationModelChangeSupport presentationModelChangeSupport() {
        return presentationModelChangeSupportLoader.get();
    }

    @Override
    public PresentationModelChangeSupport getPresentationModelChangeSupport() {
        return presentationModelChangeSupport();
    }
}