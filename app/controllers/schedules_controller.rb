class SchedulesController < ApplicationController
    require 'csv'
    def import
        # binding.b
        file = params[:file]
        return redirect_to schedules_path, notice: "Only CSV file please" unless file.content_type == "text/csv" 

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
            schedule_hash[:students] = [row['PT 1'], row['PT 2']]
            
            # binding.b
            Schedule.create(schedule_hash)
        end
        redirect_to admin_path, notice: "Import successful"
    end
    def index
        @schedules = Schedule.all
    end

    def view
        @schedules = Schedule.all
    end
end