class Employee
  # STATE
  # role     => String 'manager' || 'rider'
  # username => String
  # password => String
  def initialize(attributes = {})
    @id       = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role     = attributes[:role]
  end

  def rider?
    @role == 'rider'
  end
end

rider = Employee.new(role: 'rider', username: 'andre', password: 'secret')
p rider
