class Supervisor::CoursesController < ApplicationController

  def index
  end

  def new
    @course = Course.new
    @subjects = Subject.all
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:success] = t (:course_created)
      render :index
    else
      redirect_to new_supervisor_course_url
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :start_date, :end_date, subject_ids: [] )
  end
end
