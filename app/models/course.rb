class Course < ApplicationRecord
  has_many :enrollments
  has_many :users, through: :enrollments


 scope :active, -> {where(status: true)}
scope :inactive, ->{where(status: false)}
end
