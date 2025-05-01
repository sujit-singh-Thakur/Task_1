class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course

   validates :enrolled_at, presence: true
  # validates :course_active

  before_validation :set_enrolled_at, on: :create


  #  private
  #  def course_active
  #   errors

  private
  def set_enrolled_at
    @item = self.enrolled_at ||= Time.now
  end

  
end
