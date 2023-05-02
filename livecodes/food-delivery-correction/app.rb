# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'app/controllers/customers_controller'

require_relative 'router'

meal_csv_file_path = File.join(__dir__, 'data/meals.csv')
customer_csv_file_path = File.join(__dir__, 'data/customers.csv')
# p meal_csv_file_path
meal_repo = MealRepository.new(meal_csv_file_path)
customer_repo = CustomerRepository.new(customer_csv_file_path)
# p meal_repo

meals_controller = MealsController.new(meal_repo)
customers_controller = CustomersController.new(customer_repo)
router = Router.new(meals_controller, customers_controller)
router.run
