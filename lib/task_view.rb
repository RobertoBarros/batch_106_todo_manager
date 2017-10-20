class TaskView

  def display(tasks)
    puts "---------------------------------"
    tasks.each do |task|
      done = task.done ? '[X]' : '[ ]'
      puts "#{done} id:#{task.id} - #{task.description}"
    puts "---------------------------------"
    end
  end

  def ask_task_description
    puts "What's do you want to do?"
    return gets.chomp
  end

  def ask_for_id
    puts "Id?"
    gets.chomp.to_i
  end

end