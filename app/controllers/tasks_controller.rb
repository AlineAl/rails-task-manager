class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def find
    take_id
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to task_path(@task)
  end

  def edit
    take_id
  end

  def update
    @task = take_id
    @task.update(task_params)

    redirect_to task_path(@task)
  end

  def destroy
    @task = take_id
    @task.destroy 

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end

  def take_id
    @task = Task.find(params[:id])
  end
end
