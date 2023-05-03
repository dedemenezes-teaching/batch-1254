require_relative '../views/session_view'

class SessionsController
  def initialize(employee_repository)
    @session_view = SessionView.new
    @employee_repository = employee_repository
  end

  def login
    # 1. Ask for the username
    username = @session_view.ask_for(:username)
    # 2. Ask for the password
    password = @session_view.ask_for(:pasword)
    current_user = @employee_repository.find_by_username(username)
    # 3.1 check if the username exists the same as
    # 3.2 check if the password is correct
    if current_user && current_user.password == password
      # 1. welcome message
      @session_view.welcome(current_user)
      current_user
    else
      # 1. print a message (VIEW)
      @session_view.try_again
      # 2.                # RECURSION
      login
    end
  end
end
