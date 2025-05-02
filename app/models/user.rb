class User < ApplicationRecord
  has_many :enrollments 
  has_many :courses, through: :enrollments

   validates :user_name, presence: true
  validates :email, presence: true,format:{with: /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/,message: "enter valid email"}
  validates :email,uniqueness:{message: "this email has already been taken "}
  validates :status,inclusion:{in:['not_started','in_progress','completed']}

     scope :valid_scope, ->(status) { status.present? ? where(status: status) : all }
end
