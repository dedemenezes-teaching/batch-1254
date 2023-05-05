require "sqlite3"
DB = SQLite3::Database.new("tasks.db")
DB.results_as_hash = true
require_relative "task"

# TODO: CRUD some tasks
# # READ ONE
task = Task.find(1)
puts "#{task.title} - #{task.description}"
# # READ ALL
# tasks = Task.all
# tasks.each do |task|
#   puts "#{task.done ? "[x]" : "[ ]"} #{task.title}"
# end

# # CREATE
# task = Task.new()
# task.save

# puts task.id

# # UPDATE
# task = Task.find(1)
# task.done = true
# task.save

# task = Task.find(1)
# puts "#{task.done ? "[x]" : "[ ]"} #{task.title}"

# # DELETE
# task = Task.find(1)
# task.destroy

# puts Task.find(1) == nil
