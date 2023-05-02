require_relative '../views/meal_view'
require 'pry-byebug'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meal_view = MealView.new
  end

  def add
    # 1. Ask the user what name to add (VIEW)
    meal_name = @meal_view.ask_for('name')
    # 2. Ask the user what price to add (VIEW)
    meal_price = @meal_view.ask_for('price').to_i
    # binding.pry
    # 3. Create the new instance
    meal = Meal.new(name: meal_name, price: meal_price)
    # 4. append to the repository (ask the repo to create)
    @meal_repository.create(meal)
  end

  def list
    # 1. access the objects in the repo => we need to get the whole collection
    meals = @meal_repository.all
    # 2. display the list to the user (VIEW)
    @meal_view.display(meals)
  end
end
