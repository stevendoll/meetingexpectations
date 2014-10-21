class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @tasks = Task.all
    respond_with(@tasks)
  end

  def show
    respond_with(@task)
  end

  def new
    @task = Task.new
    respond_with(@task)
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    flash[:notice] = 'Task was successfully created.' if @task.save
    respond_with(@task)
  end

  def update
    flash[:notice] = 'Task was successfully updated.' if @task.update(task_params)
    respond_with(@task)
  end

  def destroy
    @task.destroy
    respond_with(@task)
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :description, :planned_start, :planned_end, :trashed, :position, :meeting_id)
    end
end
