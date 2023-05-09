class Intern < ActiveRecord::Base
  belongs_to :doctor # CREATES A METHOD WITH THE SYMBOL NAME
  has_many :patients
end
