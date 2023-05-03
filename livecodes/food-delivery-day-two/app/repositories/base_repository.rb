class BaseRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @elements = []
    load_csv if File.exist?(csv_file_path)
  end

  def find(id)
    # @elements.select { |element| element.id == id }.first
    @elements.find { |element| element.id == id }
  end

  def create(element)
    next_id = @elements.empty? ? 1 : @elements.last.id + 1
    element.id = next_id
    @elements << element
    save_csv
  end

  def all
    @elements
  end

  private

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << building_headers
      # all the elements
      @elements.each do |element|
        csv << building_row(element)
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      # p row #=> #<CSV::Row id:"1" name:"Margherita" price:"8">
      # 0. change to the right data type
      row = converted_columns(row)
      # 1. create the instance
      element = instantiate_element(row)
      # 2. append to our array
      @elements << element
    end
  end
end
