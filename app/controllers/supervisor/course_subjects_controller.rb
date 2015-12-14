class Supervisor::CourseSubjectsController < ApplicationController
  before_action :load_subject
  before_action :load_task
  before_action :load_course

  def show
    @course_subject = CourseSubject.find params[:id]
    @course = @course_subject.course
  end

  def new
    @course= Course.find params[:id]
    @course_subject = CourseSubject.new
    @course_subject.course_subject_tasks.build

  end

  def create
    @course_subject = CourseSubject.new course_subject_params
    if @course_subject.save
      flash[:success] = t (:manipulate_task)
      redirect_to [:supervisor,@course]
    else
      redirect_to supervisor_course_subject_url
    end
  end

  private

  def course_subject_params
    params.require(:course_subject).permit :id, :course_id, :subject_id,
      course_subject_tasks_attributes: [:course_subject_id, :task_ids[]]
  end

  def load_course
    @courses = Course.all
  end

  def load_subject
    @subjects = Subject.all
  end

  def load_task
    @tasks = Task.all
  end
end
