class Supervisor::CoursesController < ApplicationController
  before_action :load_course, except: [:index, :new, :create]

  def index
    @courses = Course.all
  end

  def edit
  end

  def update
    if params[:type] == "close"
      if @course.update_attributes status: Course.statuses[:close]
        flash[:success] = t :course_closed
        redirect_to [:supervisor, @course]
      else
        render :edit
      end
    else
      if @course.update_attributes course_params
        flash[:success] = t :course_update
        redirect_to [:supervisor, @course]
      else
        render :edit
      end
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
      redirect_to supervisor_courses_url
    else
      redirect_to new_supervisor_course_url
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def destroy
    @course.destroy
    flash[:success] = t :course_delete
    redirect_to supervisor_courses_path
  end

  private
  def course_params
    params.require(:course).permit(:name, :description, :start_date, :end_date, subject_ids: [] )
  end

  def load_course
    @course = Course.find params[:id]
  end

end
