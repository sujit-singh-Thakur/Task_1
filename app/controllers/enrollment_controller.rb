class EnrollmentController < ApplicationController
 
  def index 
    # @enrollment = Enrollment.all
    @enrollments = Enrollment.includes(:user,:course).all
  end

  def new
    @enrollment = Enrollment.new
    @courses = Course.all
  end

  def create
  
     email = params[:email]
     user = User.find_by(email: email)
     if user
      puts "user is valid #{email}"
     else
      puts "user is not found #{email}"
     end
    course_names = params[:course_name]
     course = Course.find_by(course_name: course_names)
    
     if course.status==true
      puts "course is active #{course_names}"
     else
      puts "course is inactive #{course_names}"
     end


     @enrollment = Enrollment.new(
      user_id: user.id,
      course_id: course.id,
      enrolled_at: Time.now,
      status: params[:status]
     )
    
     if @enrollment.save
      redirect_to enrollment_index_url
         else
      render :new
     end

  end

  # private
  # def enroll_param
  #   params.expect(enrollment: [:user_id,:course_id,:status])
  # end

  
end
