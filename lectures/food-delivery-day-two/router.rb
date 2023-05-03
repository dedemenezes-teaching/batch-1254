# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    while @running
      display_actions
      # 2. get the user choice
      user_choice = gets.chomp.to_i
      # 3. call the right controller action
      dispatch(user_choice)
    end
  end

  def dispatch(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 9
      @running = false
    else
      puts 'Choose between 1, 2, 3, 4 or 9'
    end
  end

  def display_actions
    puts '1. Add a meal'
    puts '2. List all meals'
    puts '3. Add a customer'
    puts '4. List all customers'
    puts '9. Quit'
  end
end
