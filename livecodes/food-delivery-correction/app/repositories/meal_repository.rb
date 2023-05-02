require 'csv'
require_relative '../models/meal'
require_relative 'base_repository'

class MealRepository < BaseRepository
  def building_headers
    %i[id name price]
  end

  def building_row(element)
    [element.id, element.name, element.price]
  end

  def converted_columns(row)
    row[:id]    = row[:id].to_i
    row[:price] = row[:price].to_i
    return row
  end

  def instantiate_element(row)
    Meal.new(row)
  end
end
