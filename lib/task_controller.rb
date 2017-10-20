require_relative 'task'
require_relative 'task_view'

class TaskController

  def initialize()
    @view = TaskView.new
  end

  def list
    display_tasks
  end

  def mark_as_done
    # Listas todas as tasks
    display_tasks
    # Perguntar qual task
    id = @view.ask_for_id
    task = Task.find(id)
    task.done = true
    task.save
  end

  def create
    # Pedir a descricao
    description = @view.ask_task_description
    # Instaciar uma task com a descricao
    task = Task.new(description: description)
    # Adicionar a task no repositorio
    task.save
  end

  def update
    display_tasks
    id = @view.ask_for_id
    task = Task.find(id)
    task.description = @view.ask_task_description
    task.save
  end

  def destroy
    # Listar todas as task
    display_tasks
    # Perguntar o index
    id = @view.ask_for_id
    task = Task.find(id)
    task.destroy

  end

  private

  def display_tasks
    tasks = Task.all
    @view.display(tasks)
  end

end