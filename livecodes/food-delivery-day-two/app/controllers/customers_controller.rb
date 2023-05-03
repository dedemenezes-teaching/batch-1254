require_relative '../views/customer_view'
require 'pry-byebug'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customer_view = CustomerView.new
  end

  def list
    customers = @customer_repository.all
    @customer_view.display(customers)
  end

  def add
    # 1. Ask the user what name to add (VIEW)
    name = @customer_view.ask_for('name')
    # 2. Ask the user what address to add (VIEW)
    address = @customer_view.ask_for('address')
    # 3. Create the new instance
    customer = Customer.new(name: name, address: address)
    # 4. append to the repository (ask the repo to create)
    @customer_repository.create(customer)
  end
end
