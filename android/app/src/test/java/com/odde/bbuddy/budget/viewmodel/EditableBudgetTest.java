package com.odde.bbuddy.budget.viewmodel;

import com.odde.bbuddy.budget.model.Budgets;
import com.odde.bbuddy.budget.view.ShowAllBudgetsNavigation;
import com.odde.bbuddy.budget.viewmodel.Budget;
import com.odde.bbuddy.budget.viewmodel.EditableBudget;

import org.junit.Test;
import org.mockito.ArgumentCaptor;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;

public class EditableBudgetTest {

    ShowAllBudgetsNavigation mockShowAllBudgetsNavigation = mock(ShowAllBudgetsNavigation.class);
    Budgets mockBudgets = mock(Budgets.class);
    EditableBudget editableBudget = new EditableBudget(mockBudgets, mockShowAllBudgetsNavigation);

    @Test
    public void add_should_show_all_budgets() {
        addBudgetWithMonthAndAmount("2017-01", "1000");

        verify(mockShowAllBudgetsNavigation).navigate();
    }

    @Test
    public void add_should_correctly_add_budget() {
        addBudgetWithMonthAndAmount("2017-01", "1000");

        verifyBudgetsAddWithMonthAndAmout("2017-01", 1000);
    }

    private void verifyBudgetsAddWithMonthAndAmout(String month, int amount) {
        ArgumentCaptor<Budget> captor = ArgumentCaptor.forClass(Budget.class);
        verify(mockBudgets).add(captor.capture());
        assertEquals(month, captor.getValue().getMonth());
        assertEquals(amount, captor.getValue().getAmount());
    }

    private void addBudgetWithMonthAndAmount(String month, String amount) {
        editableBudget.setMonth(month);
        editableBudget.setAmount(amount);
        editableBudget.add();
    }

}