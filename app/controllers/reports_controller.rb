class ReportsController < ApplicationController

  def new
    @report= Report.new
  end

  def create
    @user= User.first  # temp
    @report = @user.reports.build(report_params)
    if @report.save
      flash[:success] = t :report_created
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def report_params
    params.require(:report).permit :todays_date, :todays_task,
                            :tomorrows_task, :free_comment
  end

  def load_report
    @report = Report.find params[:id]
  end
end
