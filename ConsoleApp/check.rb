module Check
  def self.menu_number(str, first, last)
    begin
      number = Integer(str)
      unless number <= last && number >= first
        # raise 'Its not a number or ![1-7]'
      end
      true
    end
  rescue
    puts "Введите цифру от #{first} до #{last}"
    return false
  end

  def self.take_number(first, last)
    input = $stdin.gets.chomp until menu_number(input, first, last)
    yield input
  end

  def self.string?(str)
    # str.encoding("UTF-8")
    if (/[a-zA-Z]/ =~ str) && !(/[0-9]/ =~ str)
      true
    else
      puts 'Введите нормально строку'
      false
    end
  end

  def self.integer?(number)
    begin
      number = Integer(number)
      true
    end
  rescue
    puts 'Введите нормально число'
    return false
  end

  def self.input(method)
    input = $stdin.gets.chomp
    if method == 'string'
      input = $stdin.gets.chomp until string?(input)
      yield input.capitalize
    else
      input = $stdin.gets.chomp until integer?(input)
      yield input
    end
  end
end
