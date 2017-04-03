class AddAccountPage < PageBase

  def await
    wait_for_element_exists('Save')
    self
  end

end
