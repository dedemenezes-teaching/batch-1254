class BaseView
  def ask_for(item)
    puts "#{item}?"
    gets.chomp
  end
end
