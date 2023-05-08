require "sqlite3"
DB = SQLite3::Database.new("tasks.db")
DB.results_as_hash = true
require_relative "task"

# # TODO: CRUD some tasks
# # # READ ONE
# task = Task.find(1)
# puts "#{task.title} - #{task.description}"
# p task

# # # READ ALL
tasks = Task.all
tasks.each do |task|
  puts "#{task.done.zero? ? "[ ]" : "[x]"} #{task.title}"
end

# # CREATE
# task = Task.new(title: 'Happy Hour', description: 'Drink and game and have fun for FREE!')
# task.save

# puts task.id

# # UPDATE
task = Task.find(5)
task.done = 1
task.save

tasks = Task.all
tasks.each do |task|
  puts "#{task.done.zero? ? "[ ]" : "[x]"} #{task.title}"
end

# task = Task.find(1)
# puts "#{task.done.zero? ? "[ ]" : "[x]"} #{task.title}"

# # # DELETE
# task = Task.find(2)
# task.destroy

# puts Task.find(2) == nil
task = Task.find(3)
task.destroy

puts Task.find(3) == nil
