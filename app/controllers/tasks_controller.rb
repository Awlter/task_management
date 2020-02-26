# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks.order("state = 'process' DESC, state = 'open' DESC, state = 'closed' DESC")
  end

  def create
    @task = current_user.tasks.new(task_params.to_hash)
    @task.save
  end

  def update
    @task = Task.find(params[:id])
    return render status: 422 if @task.user != current_user
    @task.pivot_to_next_state!
    @task.save
  end

  def destroy; end

  private

  def task_params
    params.require(:task).permit(:description, priorities: {}).tap do |p|
      p[:priorities] = p[:priorities].values.map(&:to_i).select(&:positive?)
    end
  end
end
