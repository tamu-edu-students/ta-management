class SchedulesController < ApplicationController
    # before_action :require_user_logged_in!
    
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

    def destroy
        @schedules = Schedule.all
        @schedules.destroy_all
        respond_to do |format|
          format.html { redirect_to admin_url, notice: "Schedules were successfully removed." }
          format.json { head :no_content }
        end
    end
end