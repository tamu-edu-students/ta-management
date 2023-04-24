class CsvImportUsersService
  require 'csv'

  def call(file)
    file = File.open(file)
    csv = CSV.parse(file, headers: true, col_sep: ",")

    skipped_pts = []
    csv.each do |row|
      user1 = User.find_by(email_id: row['PT 1'])
      user2 = User.find_by(email_id: row['PT 2'])
      
      if user1.nil?
        skipped_pts << row['PT 1']
        next
      end
      
      if user2.nil?
        skipped_pts << row['PT 2']
        next
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
    
    puts "Skipped PTs: #{skipped_pts.join(', ')}" unless skipped_pts.empty?
  end
end