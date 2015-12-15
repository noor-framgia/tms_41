class Supervisor::UsersCoursesController < ApplicationController
  before_action :load_course

  def show
  end

  def update
    if @course.update course_users_params
    flash[:success] = t (:successful_enrolled)
      redirect_to [:supervisor, @course]
    end
  end

  def destroy
  end

  private

  def course_users_params
    params.require(:course).permit user_ids: []
  end

  def load_course
    @course = Course.find params[:id]
  end

end
