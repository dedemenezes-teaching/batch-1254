class OrderRepository
  def initialize(csv_file_path, meal_repository, customer_repository, employee_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @csv_file_path = csv_file_path
    @orders = []
    load_csv if File.exist? @csv_file_path
  end

  def my_undelivered_orders(user)
    undelivered_orders.select { |order| order.employee == user}
  end

  def mark_as_delivered(index, user)
    undelivered = my_undelivered_orders(user)
    order = undelivered[index]
    # 1. update the delivered attribute
    order.deliver!
    # 2. SAVE CSV
    save_csv
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered? }
  end

  def create(order)
    # assign an id
    next_id = @orders.empty? ? 1 : @orders.last.id + 1
    order.id = next_id
    # add to the array
    @orders << order
    # save to the csv
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      # 1. convert to the right data type

      row[:id] = row[:id].to_i
      row[:delivered] = row[:delivered] == 'true'
      row[:meal] = @meal_repository.find(row[:meal_id].to_i)
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)
      row[:employee] = @employee_repository.find(row[:employee_id].to_i)
      # recreate the instance with the right data type

      order = Order.new(row)
      # populate our array
      @orders << order
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << %i[id meal_id customer_id employee_id delivered]
      @orders.each do |order|
        csv << [order.id, order.meal.id, order.customer.id, order.employee.id, order.delivered?]
      end
    end
  end
end
