class EditAccountPage < PageBase

  def marked
    'Save'
  end

  def edit_account(account)
    clear_then_enter_text('name', account.name)
    clear_then_enter_text('balance', account.balance)
    touch('Save')
  end

  def delete_account
    touch('Accounts')
    wait_for_this_kind_of_element_exists "UITableViewCell"
    wait_for_none_animating
    swipe :left, :query => "UITableViewCell", :offset => {:x => 100, :y => 0}
    touch('Delete')
  end

end