class Api::V1::TasksController < ApplicationController
  before_action :set_task, only: [ :show, :update, :destroy ]

  # GET api/v1/tasks/
  def index
    @tasks = Task.all
    render json: { status: "success", data: @tasks }
  end

  # GET api/v1/tasks/:id
  def show
    render json: { status: "success", data: @task }
  end

  # POST api/v1/tasks
  def create
    @task = Task.new(task_params)
    if @task.save
      render json: { status: "success", data: @task }
    else
      render json: { status: "error", data: @task.errors }
    end
  end

  # PUT api/v1/tasks/:id
  def update
    if @task.update(task_params)
      render json: { status: "success", data: @task }
    else
      render json: { status: "error", data: @task.errors }
    end
  end

  # DELETE api/v1/tasks/:id
  def destroy
    @task.destroy
    render json: { status: "success", data: @task }
  end

  private

  def task_params
    params.expect(task: [ :title, :description ])
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
