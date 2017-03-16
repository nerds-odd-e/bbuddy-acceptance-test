class BudgetsPage < PageBase

  def go_to_add_budget
    touch('Add')
    AddBudgetPage.open
  end

end
