class Course < ApplicationRecord
  has_many :enrollments
  has_many :users, through: :enrollments
 validates :description, presence: true
 
end
