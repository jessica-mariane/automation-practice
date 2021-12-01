class App
  def auth_initial_page
    AuthInitial.new
  end

  def login_page
    Login.new
  end

  def register_page
    Register.new
  end

  def my_account
    MyAccount.new
  end
end
