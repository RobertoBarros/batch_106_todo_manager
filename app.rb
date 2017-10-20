require 'sqlite3'
DB = SQLite3::Database.new("todo.db")


require_relative 'lib/task_controller'
require_relative 'lib/router'

controller = TaskController.new
router = Router.new(controller)

router.run
