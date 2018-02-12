module Answer
  def self.responses_number(answers)
    count = 0
    answers.each do |answer|
      count += 1 unless answer.nil?
    end
    count
  end

  def self.correct(questions, answers)
    count = 0
    answers.each_with_index do |answer, index|
      unless answer.nil?
        then count += 1 if questions[index][:answer] == answer
      end
    end
    count
  end

  def self.get_unresolved_question(answers, column_questions)
    return 1 if answers.size == 1
    return answers.size if answers.size < column_questions
    answers.each_with_index do |answer, index|
      return index if answer.nil?
    end
  end
end
