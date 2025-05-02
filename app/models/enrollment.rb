class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course

   validates :enrolled_at, presence: true
  # validates :course_active

  before_validation :set_enrolled_at, on: :create
  validates :course_name, presence: {message: "this course is not active"}, if: ->{status == true}
 
   scope :not_started, -> {where(status:"not_started")} 
   scope :in_progress, -> {where(status: "in_progress")}
   scope :completed, ->{where(status: "completed")}

  # before_validation :course_name_display

  private
  def set_enrolled_at
    self.enrolled_at ||= Time.now
  end

  
end
