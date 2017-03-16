class BudgetsPage < PageBase

  def go_to_add_budget
    touch_navigation_button(0)
    AddBudgetPage.open
  end

end
