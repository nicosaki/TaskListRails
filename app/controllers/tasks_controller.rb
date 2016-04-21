class TasksController < ApplicationController
  def index
    @tasks = Task.order(completed: :asc)
    render :index
  end

  def by_priority
    @tasks = Task.order(priority: :desc)
    render :index
  end

  def new
    @task = Task.new()
    render :new
  end

  def create #NEEDS MODEL TO ALTER
    @task = Task.create(create_task_params[:task])
    @tasks = Task.order(completed: :asc)
    render :index
  end

  def show
    @task = Task.find(params[:id])
    render :taskpage
  end

  def complete
    @task = Task.find(params[:id])
    @task.update(completed: DateTime.new)
    @tasks = Task.order(completed: :asc)
    render :index
  end

  def uncomplete
    @task = Task.find(params[:id])
    @task.update(completed: nil)
    @tasks = Task.order(completed: :asc)
    render :index
  end

  def delete
    @task = Task.find(params[:id])
    @task.destroy
    @tasks = Task.order(completed: :asc)
    render :index
  end

  def edit
    @task = Task.find(params[:id])
    # @edit_task = [@task.id, @task.task, @task.description, @task.completed]
    render :new
  end

  def update
    @task = Task.find(params[:id]).update(create_task_params[:task])
    @tasks = Task.order(completed: :asc)
    render :index
  end

  private
  def create_task_params
    params.permit(task: [:task, :description])
  end
end