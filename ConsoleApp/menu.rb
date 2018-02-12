require_relative 'check'

class Menu
  def initialize
    @position_menu = { 'имя' => 'string', 'отдел' => 'string', 'з/п' => 'integer', 'возраст' => 'integer',
                       'образование' => 'string', 'специальность' => 'string', 'количество рабочих мест' => 'integer' }
    @people = { 'имя' => 'string', 'фамилия' => 'string', 'отчество' => 'string', 'возраст' => 'integer',
                'образование' => 'string', 'специальность' => 'string' }
    @action_menu = {
      '1' => ->() { print_menu_for_add },
      '2' => ->() { print_menu_for_delete },
      '3' => ->() { return { number: '3', massiv: '' } },
      '4' => ->() { return { number: '4', massiv: '' } },
      '5' => ->() { return { number: '5', massiv: '' } },
      '6' => ->() { return { number: '6', massiv: '' } },
      '7' => ->() { exit },
      '1.1' => ->() { print_menu_add_position_or_people(@position_menu) },
      '1.2' => ->() { print_menu_add_position_or_people(@people) },
      '2.1' => ->() { print_menu_delete_position_or_people('должность') },
      '2.2' => ->() { print_menu_delete_position_or_people('фамилию') }
    }
  end

  def print_menu
    puts("1)Добавление должности или человека \
			\n2)Удаление должности или человека \
			\n3)Подбор для каждлого человека подходящей должности, если это возможно \
то включение его в список сотрудников\
			\n4)Вывод на экран списка сотрудников\
			\n5)Вывод на экран списка вакансий\
			\n6)Расчет ежемесячной з/п и вывод ведомости в файл\
			\n7)Выход")
  end

  def print_menu_for_add
    puts("1)Добавление должности\
			\n2)Добавление человека")
    Check.take_number(1, 2) do |input|
      output = @action_menu["1.#{input}"].call
      @number = "1.#{input}"
      @output_note = output
      return { number: "1.#{input}", massiv: output }
    end
  end

  def print_menu_add_position_or_people(who)
    new_note = []
    for i in who
      puts i[0]
      Check.input(i[1]) do |input|
        new_note << input
      end
    end
    new_note
  end

  def print_menu_for_delete
    puts("1)Удаление должности\
			\n2)Удаление человека")
    Check.take_number(1, 2) do |input|
      output = @action_menu["2.#{input}"].call
      return { number: "2.#{input}", massiv: output }
    end
  end

  def print_menu_delete_position_or_people(str)
    puts "Введите #{str}"
    Check.input('string') do |input|
      return input
    end
  end

  def menu
    print_menu
    Check.take_number(1, 7) do |input|
      return @action_menu[input].call
    end
  end
end
