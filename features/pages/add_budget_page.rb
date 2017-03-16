require_relative 'page_base'

class AddBudgetPage < PageBase

  def marked
    'Save'
  end

  def add_budget(month, amount)
    clear_then_enter_text('Month', month)
    clear_then_enter_text('Amount', amount)
    touch(marked)
  end

end
