require 'csv'

module Read
  def self.payment_from_file(filename)
    questions = []
    CSV.foreach(filename, headers: true) do |row|
      questions << { question: row['question'], a: row['first'], b: row['second'], c: row['third'],
                     d: row['fourth'], answer: row['answer'] }
    end
    questions
  end
end
