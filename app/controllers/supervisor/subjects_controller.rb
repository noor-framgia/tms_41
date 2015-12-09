class Supervisor::SubjectsController < ApplicationController
  before_action :load_user, only: [:index]

  def index
    @subjects = @user.subjects
  end

  def new
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
end