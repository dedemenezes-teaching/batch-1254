class Meal
  attr_accessor :id
  attr_reader :name, :price

  def initialize(attributes = {})
    @id    = attributes[:id]
    @name  = attributes[:name]
    @price = attributes[:price]
  end
end

# meal_one = Meal.new(name: 'pizza', price: 7)
# p meal_one
