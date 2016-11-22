# still must manually create these(or generate them with rails generator.. resources only provides the routes)
class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id]) #Task.find(id)
  end

  def new
    @task = Task.new #(old way, before partial)

  end

  def create
    # @task = Task.new(params[:task]) (handled by below)
    @task = Task.new(task_params)
    @task.save

    #no need for 'create.html.erb' in the views
    redirect_to task_path(@task)
  end

  def edit
    # @task = Task.find(params[:id]) (old way before the partials)
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    # @task.update(params[:task]) (handled by below)
    @task.update(task_params)

    #no need for the 'update.html.erb' in views
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    #no need for the 'destroy.html.erb' in views
    redirect_to tasks_path
  end

  private

    def task_params
      params.require(:task).permit(:id, :name, :describe)
    end
end
