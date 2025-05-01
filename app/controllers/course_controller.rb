class CourseController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.all 
  end

  def show 
    id = params.expect(:id)
    @course = Course.find(id)

    @enrollments = @course.enrollments.includes(:user)
  end

  def create 
    # @course = Course.new(param_course)
    # @course.save

    @course = Course.new(param_course ={ 
      course_name: params[:course_name],
      description: params[:description],
      status: params[:status]
    })
 if @course.save
  redirect_to course_index_url
 else
  render :new
 end
 

  end

  private
  def param_course
    params.expect(course: [:course_name, :description,:status])
  end

end
