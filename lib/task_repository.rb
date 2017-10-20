class TaskRepository

  def initialize
    @tasks = []
  end

  def add(task)
    @tasks << task
  end

  def all
    @tasks
  end

  def find(index)
    return @tasks[index]
  end

  def remove(index)
    @tasks.delete_at(index)
  end



end