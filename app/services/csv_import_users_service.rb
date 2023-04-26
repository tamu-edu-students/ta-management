class CsvImportUsersService
  require 'csv'

  def call(file)
    file = File.open(file)
    csv = CSV.parse(file, headers: true, col_sep: ",")

    skipped_rows = []
    csv.each do |row|
        if row['PT 1'] != "CLOSED"
          user1 = User.find_by(email_id: row['PT 1'])
        
          if user1.nil?
            skipped_rows << row['PT 1']
            row['PT 1'] = "TA Not Registered"
          end
        end
        
        if row['PT 2'] != "CLOSED"
          user2 = User.find_by(email_id: row['PT 2'])
          
          if user2.nil?
            skipped_rows << row['PT 2']
            row['PT 2'] = "TA Not Registered"
          end
        end

      schedule_hash = {}
      schedule_hash[:code] = row['Code']
      schedule_hash[:course_id] = row['Course']
      schedule_hash[:section] = row['Section']
      schedule_hash[:lecture_day] = row['Lecture Day']
      schedule_hash[:start_time] = row['Start Time']
      schedule_hash[:end_time] = row['End Time']
      schedule_hash[:professor] = row['Instructor']
      schedule_hash[:professor_email] = row['Instructor Email']
      schedule_hash[:students] = [row['PT 1'], row['PT 2']]

      Schedule.create(schedule_hash)
    end
    
    # { skipped_rows: skipped_rows }
    puts "Testing 1"
    puts skipped_rows.class
    puts skipped_rows.length()
    puts "Testing 2"
    puts "Skipped Rows: #{skipped_rows.join(', ')}" unless skipped_rows.empty?
    
    return skipped_rows
  end
end