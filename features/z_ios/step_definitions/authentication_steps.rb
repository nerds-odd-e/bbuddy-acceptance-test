Then(/^login successfully$/) do
  DashboardPage.assert_is_current_page
  MePage.open.sign_out
end
