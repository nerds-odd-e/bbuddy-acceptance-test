When(/^add budget as (month \d+-\d+ and amount \d+)$/) do |budget|
  DashboardPage.open.go_to_budgets
  BudgetsPage.open.go_to_add_budget.add_budget(budget)
end

Then(/^you will see all budgets as below$/) do |budgets|
  budgets.each {|budget| BudgetsPage.open.assert_budgets_exists(budget)}
end
