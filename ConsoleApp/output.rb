require 'csv'

module Output
  def self.export_data(output)
    File.open('output.csv', 'a') do |csv|
      csv << output.join(', ')
    end
  end
end
