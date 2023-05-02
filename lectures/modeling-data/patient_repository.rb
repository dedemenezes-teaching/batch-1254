require 'csv'
require 'pry-byebug'

class PatientRepository
  def initialize(csv_file_path, room_repository)
    @room_repository = room_repository
    @csv_file_path = csv_file_path
    @patients      = []
    load_csv
  end

  def create(patient)
    # ASSIGN AN ID!
    next_id = @patients.empty? ? 1 : @patients.last.id + 1
    patient.id = next_id
    @patients << patient
    save_csv #won't work -> NOT DEFINED
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |line|
      # p line #=> > #<CSV::Row id:"1" name:"biggie" cured:"false" room_id:"1">
      # 0. Convert to the RIGHT DATA TYPES
      line[:id] = line[:id].to_i
      line[:cured] = line[:cured] == 'true'
      room_id = line[:room_id].to_i
      # recreate the instance of our Patient class
      patient = Patient.new(line)
      # binding.pry
      @patients << patient
      # store in patients array
      # WE NEED TO ASSING THE ROOM TO THE PATIENT
      # 1.1 FIND THE RIGHT ROOM INSTANCE
      # Ask the room repo to retrieve the right room
      binding.pry
      room = @room_repository.find(room_id)
      room.add_patient(patient)
      p room
    end
  end
end
