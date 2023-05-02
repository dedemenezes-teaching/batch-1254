require_relative 'patient'
require_relative 'room'
require_relative 'patient_repository'
require_relative 'room_repository'

# biggie = Patient.new(name: 'Biggie')
# p biggie

# puts "#{biggie.name} is #{biggie.cured? ? 'not sick' : 'sick'}"
# #=> "Biggie is sick"


# rap_room = Room.new(capacity: 2)
# samba_room = Room.new(capacity: 10)
# p rap_room.full?
# rap_room.add_patient(biggie)

# rihanna = Patient.new(name: 'rihanna')
# rap_room.add_patient(rihanna)
# p rap_room

room_repo = RoomRepository.new('rooms.csv')

patient_repo = PatientRepository.new('patients.csv', room_repo)
# p patient_repo
# p room_repo.find(1)
p patient_repo

puts 'name?'
name = gets.chomp
#1. intantiate our patient
new_patient = Patient.new(name: name)
patient_repo.create(new_patient)
p patient_repo
