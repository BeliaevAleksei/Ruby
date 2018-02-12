class People
	attr_reader :first_name, :age, :education, :speciality
	
  def initialize(first_name, last_name, patronymic, age, education, specialty)
    @first_name = first_name
    @last_name = last_name
    @patronymic = patronymic
    @age = Integer(age)
    @education = education
    @speciality = specialty
  end
  
  def ==(other)
    self.class === other and
      other.age == @age and
      other.education == @education and
      other.speciality == @speciality
  end

  alias eql? ==

	def hash
    @age.hash ^ @education.hash ^ @speciality.hash# XOR
  end
	
  def to_s
    "first_name: #{@first_name}, last_name: #{@last_name}, patronymic: #{@patronymic},
		age: #{@age}, education: #{@education}, specialty: #{@speciality}"
  end
end
