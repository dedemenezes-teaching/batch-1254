class Patient
  attr_reader :name
  attr_accessor :room, :id
  # def name
  #   @name
  # end

  # STATE
  # MUST USE TODAY
  def initialize(attributes = {})
    # name   => String
    # cured  => Boolean
    # age    => Integer
    # address => String
    @name  = attributes[:name]
    @cured = attributes[:cured] || false
    # @age = attributes[:age]
    @id    = attributes[:id]
  end

  # BEHAVIOR
  def cure!
    @cured = true
  end

  def cured?
    @cured
  end
end
