require_relative '../views/meal_view'
require_relative '../views/customer_view'
require_relative '../views/employee_view'
require_relative '../views/order_view'
require_relative '../models/order'


class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    # repositories
    # views
    @meal_view = MealView.new
    @customer_view = CustomerView.new
    @employee_view = EmployeeView.new
    @order_view = OrderView.new
  end

  def mark_as_delivered(user)
    # 1. display to the user all the orders that are undelivered for the logged in user
    list_user_orders(user)
    # 2. Ask to the user which order he wants to mark as delivered
    index = @order_view.ask_for(:index).to_i - 1
    ## MARK AS DELIVERED
    @order_repository.mark_as_delivered(index, user)
  end

  def list_my_orders(user)
    # 1. retrieve undelivered orders that belongs to the logged in user
    list_user_orders(user)
  end

  def list_undelivered_orders
    # 1. retrieve all the orders that are undelivered
    undelivered = @order_repository.undelivered_orders
    # 2. diplsay to the user
    @order_view.display(undelivered)
  end

  def add
    ## MEAL
    meal = set_meal
    ## CUSTOMER
    customer = set_customer
    ## EMPLOYEE
    biker = set_biker
    # CREATE THE NEW INSTANCE OF ORDER CLASS
    order = Order.new(meal: meal, customer: customer, employee: biker)
    @order_repository.create(order)
  end

  private

  def list_user_orders(user)
    undelivered = @order_repository.my_undelivered_orders(user)
    # 2. display to the user
    @order_view.display(undelivered)
  end

  def set_meal
    # 1. we need to get the meal
    # 1.1 get all the meals
    meals = @meal_repository.all
    # 1.2 display the meals to our user
    @meal_view.display(meals)
    # 1.3 ask which meal the user want
    index = @meal_view.ask_for(:index).to_i - 1
    # 1.4 retrieve the right meal
    meals[index]
  end

  def set_customer
    # 1.1 get all the customers
    customers = @customer_repository.all
    # 1.2 display the customers to our user
    @customer_view.display(customers)
    # 1.3 ask which customer the user want
    index = @customer_view.ask_for(:index).to_i - 1
    # 1.4 retrieve the right customer
    customers[index]
  end

  def set_biker
    # 1.1 get all the employees that are RIDERS
    bikers = @employee_repository.all_riders
    # 1.2 display the employees to our user
    @employee_view.display(bikers)
    # 1.3 ask which employee the user want
    index = @employee_view.ask_for(:index).to_i - 1
    # 1.4 retrieve the right employee
    bikers[index]
  end
end


# 1 - pizza
# 2 - burger
# 1 -> 0
