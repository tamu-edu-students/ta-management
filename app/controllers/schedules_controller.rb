class SchedulesController < ApplicationController
    
    def import
        # binding.b
        file = params[:file]
        return redirect_to schedules_path, notice: "Only CSV file please" unless file.content_type == "text/csv" 

        CsvImportUsersService.new.call(file)
        redirect_to admin_path, notice: "Import successful"
    end
    def index
        @schedules = Schedule.all
    end

    def view
        @schedules = Schedule.all
    end
end