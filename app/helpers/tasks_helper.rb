module TasksHelper
  def show_closed_tasks?
    cookies['showClosedTask'] == 'true'
  end
end
