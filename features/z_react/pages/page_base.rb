class PageBase

  def await
    wait_for_text(marked)
    self
  end

end
