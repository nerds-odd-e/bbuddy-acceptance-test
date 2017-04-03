class MePage < PageBase

  def marked
    'Me'
  end

  def sign_out
    touch(marked)
    touch('Sign Out')
  end

end
