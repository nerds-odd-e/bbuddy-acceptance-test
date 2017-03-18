package com.odde.bbuddy.budget.viewmodel;

import com.odde.bbuddy.budget.model.Budgets;
import com.odde.bbuddy.budget.view.ShowAllBudgetsNavigation;
import com.odde.bbuddy.di.scope.ActivityScope;

import org.robobinding.annotation.PresentationModel;

import javax.inject.Inject;

import static java.lang.Integer.parseInt;

@PresentationModel
@ActivityScope
public class EditableBudget {

    private final Budgets budgets;
    private final ShowAllBudgetsNavigation showAllBudgetsNavigation;
    private String month;
    private String amount;

    @Inject
    public EditableBudget(Budgets budgets, ShowAllBudgetsNavigation showAllBudgetsNavigation) {
        this.budgets = budgets;
        this.showAllBudgetsNavigation = showAllBudgetsNavigation;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getMonth() {
        return month;
    }

    public String getAmount() {
        return amount;
    }

    public void add(){
        addBudget();
        showAllBudgetsNavigation.navigate();
    }

    private void addBudget() {
        Budget budget = new Budget();
        budget.setMonth(month);
        budget.setAmount(parseInt(amount));
        budgets.add(budget);
    }
}
