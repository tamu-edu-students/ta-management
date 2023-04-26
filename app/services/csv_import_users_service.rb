class CsvImportUsersService
    require 'csv'

    def call(file)
        file = File.open(file)
        csv = CSV.parse(file, headers: true, col_sep: ",")
        csv.each do |row|
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
            
            # binding.b
            Schedule.create(schedule_hash)
        end
    end
end