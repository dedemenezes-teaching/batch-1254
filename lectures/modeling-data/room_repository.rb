class RoomRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @rooms = []
    load_csv
  end

  def find(id)
    @rooms.select { |room| room.id == id }.first
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |line|
      # binding.pry
      line[:id] = line[:id].to_i
      line[:capacity] = line[:capacity].to_i

      # RECREATE THE ROOM INSTANCE
      room = Room.new(line)
      # PUSH TO THE COLLECTION
      @rooms << room
    end
  end
end
