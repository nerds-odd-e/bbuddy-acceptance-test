require_relative 'page_base'

class BudgetsPage < PageBase

  def marked
    'Budgets'
  end

  def assert_budgets_does_not_exist(budget)
    wait_for_text_does_not_exist(budget.month)
    wait_for_text_does_not_exist(budget.amount)
  end

  def assert_budgets_exists(budget)
    wait_for_text budget.month
    wait_for_text budget.amount
  end

end
