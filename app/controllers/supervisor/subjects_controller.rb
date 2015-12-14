class Supervisor::SubjectsController < ApplicationController
  before_action :load_user, only: [:index]

  def index
    @subjects = @user.subjects
  end

  def new
    @subject = Subject.new
    @subject.tasks.build
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash.now[:success] = t :subject_creation_success
      render :show
    else
      render :new
    end
  end

  def show
    @subject = Subject.find params[:id]
  end

  def edit
  end

  private
  def load_user
    @user = User.first #Incompatibility 1: Please see SpecificationNotes.md
  end

  def subject_params
    params.require(:subject).permit(:name, :description, tasks_attributes:
      [:id, :name, :description, :_destroy])
  end
end