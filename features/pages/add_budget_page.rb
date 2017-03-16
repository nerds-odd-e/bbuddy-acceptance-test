require_relative 'page_base'

class AddBudgetPage < PageBase

  def marked
    'Save'
  end

  def add_budget(budget)
    clear_then_enter_text('Month', budget.month)
    clear_then_enter_text('Amount', budget.amount)
    touch(marked)
  end

end
