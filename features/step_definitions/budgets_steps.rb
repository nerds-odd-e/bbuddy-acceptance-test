When(/^add budget as month (\d+-\d+) and amount (\d+)$/) do |month, amount|
  DashboardPage.open.go_to_budgets
  BudgetsPage.open.go_to_add_budget.add_budget(month, amount)
end

Then(/^you will see all budgets as below$/) do |table|
  budget = table.hashes[0]
  BudgetsPage.open.assert_budgets_exists(budget[:month], budget[:amount])
end
