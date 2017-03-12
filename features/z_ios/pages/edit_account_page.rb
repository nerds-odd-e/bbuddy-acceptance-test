class EditAccountPage < PageBase

  def delete_account
    touch('Accounts')
    wait_for_this_kind_of_element_exists "UITableViewCell"
    wait_for_none_animating
    swipe :left, :query => "UITableViewCell", :offset => {:x => 100, :y => 0}
    touch('Delete')
  end

end