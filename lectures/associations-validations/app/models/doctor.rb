class Doctor < ActiveRecord::Base
  has_many :interns # CREATES A METHOD NAMED AS THE SYMBOL
  has_many :consultations
  has_many :patients, through: :consultations

  validates :last_name, presence: true
  validates :first_name, uniqueness: { scope: :last_name }
end
