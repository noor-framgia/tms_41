class Supervisor::CoursesController < ApplicationController
  before_action :load_course

  def index
  end

  def edit
  end

  def update
    if @course.update_attributes course_params
      flash[:success] = t :course_update
      redirect_to [:supervisor, @course]
    else
      render :edit
    end
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

  def show
    @course = Course.find(params[:id])
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :start_date, :end_date, subject_ids: [] )
  end

  def load_course
    @course = Course.find params[:id]
  end
end
