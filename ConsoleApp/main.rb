require_relative 'models/people'
require_relative 'models/position'
require_relative 'read'
require_relative 'hr'
require_relative 'menu'

class App
  def initialize(_first_file, _second_file)
    @people = Read.people_from_file(_first_file)
    @position = Read.position_from_file(_second_file)
    @hr = Hr.new(@people, @position)
    @menu = Menu.new
    @action = {
      '0' => ->() { exit },
      '1.1' => ->(position) { @hr.add_position(position) },
      '1.2' => ->(people) { @hr.add_people(people) },
      '2.1' => ->(position) { @hr.delete_position(position) },
      '2.2' => ->(people) { @hr.delete_people(people) },
      '3' => ->(_people) { @hr.selection_staff },
      '4' => ->(_people) { @hr.print_staff },
      '5' => ->(_people) { @hr.print_jobs },
      '6' => ->(_people) { @hr.print_in_file },
      '7' => ->() { exit }
    }
  end

  def start
    loop do
      test = @menu.menu
      @action[test[:number]].call(test[:massiv])
      break if test[0] == 7
    end
  end
end


app = App.new(ARGV[0], ARGV[1])
app.start
