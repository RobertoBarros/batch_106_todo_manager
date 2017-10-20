class Router
  def initialize(controller)
    @controller = controller
  end

  def run
    loop do
      print_action
      action = gets.chomp.to_i
      dispatch(action)
    end
  end

  def print_action
    puts "\n-----"
    puts "What do you want to do?"
    puts "1 - Display all tasks"
    puts "2 - Add a new task"
    puts "3 - Update a task"
    puts "4 - Mark task done"
    puts "5 - Remove task"
    puts "-------"
  end

  def dispatch(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.create
    when 3 then @controller.update
    when 4 then @controller.mark_as_done
    when 5 then @controller.destroy
    else
      puts "Please type a number"
    end
  end
end