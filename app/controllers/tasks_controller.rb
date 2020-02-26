# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :load_and_check_current_task, only: %i[update destroy]

  def index
    @tasks = current_user.tasks.order("state = 'process' DESC, state = 'open' DESC, state = 'closed' DESC")
  end

  def create
    @task = current_user.tasks.new(task_params.to_hash)
    @task.save
  end

  def update
    @task.pivot_to_next_state!
    @task.save
  end

  def destroy
    @task.delete
  end

  private

  def task_params
    params.require(:task).permit(:description, priorities: {}).tap do |p|
      p[:priorities] = p[:priorities].values.map(&:to_i).select(&:positive?)
    end
  end

  def load_and_check_current_task
    @task = current_user.tasks.find_by(id: params[:id])
    return render file: "#{Rails.root}/public/422.html" unless @task
  end
end
