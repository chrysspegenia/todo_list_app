class TasksController < ApplicationController
  before_action :set_task, only: [ :show, :edit, :update, :destroy, :complete ]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all.order(:id)
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @button_text = "Add task"
  end

  # GET /tasks/1/edit
  def edit
    @button_text = "Update"
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_url, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  def complete
    
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task marked as completed.'
    else
      render :index, alert: "Failed to mark task as completed."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :completed, :task_description)
    end
end
