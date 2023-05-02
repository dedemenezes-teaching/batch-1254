require 'csv'
require_relative '../models/customer'
require_relative 'base_repository'

class CustomerRepository < BaseRepository
  def building_headers
    %i[id name address]
  end

  def building_row
    [element.id, element.name, element.address]
  end

  def converted_columns(row)
    row[:id]    = row[:id].to_i
    return row
  end

  def instantiate_element(row)
    Customer.new(row)
  end
end
