# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    while @running
      @current_user = @sessions_controller.login
      while @current_user
        if @current_user.rider?
          manager_action
        else
          rider_action
        end
      end
    end
  end

  def rider_action
    display_manager_actions
    # 2. get the user choice
    user_choice = gets.chomp.to_i
    # 3. call the right controller action
    dispatch_manager(user_choice)
  end

  def manager_action
    display_rider_actions
    # 2. get the user choice
    user_choice = gets.chomp.to_i
    # 3. call the right controller action
    dispatch_rider(user_choice)
  end

  def display_rider_actions
    puts '1. mark one of my orders as delivered'
    puts '2. list all my undelivered orders'
    puts '9. Quit'
  end

  def dispatch_rider(action)
    case action
    when 1
      puts 'TODO: MARK ORDER AS DELIVERED'
    when 2
      puts 'TODO: LIST MY UNDELIVERED ORDERS'
    when 9
      quit
    else
      puts 'Choose between 1, 2, 3, 4 or 9'
    end
  end

  def dispatch_manager(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 8 then logout
    when 9 then quit
    else
      puts 'Choose between 1, 2, 3, 4 or 9'
    end
  end

  def quit
    logout
    @running = false
  end

  def logout
    @current_user = nil
  end

  def display_manager_actions
    puts '1. Add a meal'
    puts '2. List all meals'
    puts '3. Add a customer'
    puts '4. List all customers'
    puts '8. Logout'
    puts '9. Quit'
  end
end
