class JobsController < ApplicationController
  before_action :set_job, only: [:show, :destroy, :edit, :update]
  before_action :set_company, only: [:index, :new, :create]
  before_action :set_contact, only: [:index]

  def index
    if params[:sort] == 'location'
      @jobs = Job.location
    elsif params[:sort] == 'interest'
      @jobs = Job.level_of_interest
    elsif params[:location]
      @jobs = Job.city(params[:location])
    else
      @jobs = @company.jobs
    end
  end

  def new
    @categories = Category.all
    @job = Job.new
  end

  def create
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_jobs_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
  end

  def edit
    @company = @job.company
    @categories = Category.all
  end

  def update
    @job.update(job_params)
    flash.notice = "Job '#{@job.title}' Updated!"
    redirect_to company_job_path(@job.company, @job)
  end

  def destroy
    @job.destroy
    flash.notice = "Job '#{@job.title}' was successfully deleted!"
    redirect_to company_jobs_path(@job.company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end

  def set_job
    @job = Job.find(params[:id])
  end
  
  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_contact
    @contact = Contact.new()
  end

end
