class Room
  attr_accessor :id
  def initialize(attributes = {})
    # capacity => Integer
    # patients => An array of instances of Patient Class
    @capacity = attributes[:capacity]
    @patients = attributes[:patients] || []
    @id       = attributes[:id]
  end

  # Behavior
  def full?
    @patients.length == @capacity
  end

  def add_patient(patient)
    raise StandardError, 'Room is full' if full?

    @patients << patient
    # assign a room to our patient
    patient.room = self #=> self represents the instance which called the #add_patient
  end

end
