class SchedulesController < ApplicationController
    # before_action :require_user_logged_in!
    before_action :admin_user
    
    def import
       # binding.b
        if params[:file].nil?
            return redirect_to schedules_path, notice: "You did not select any file. Try again"
        else
            file = params[:file]
            return redirect_to schedules_path, notice: "Only CSV file please" unless file.content_type == "text/csv"   
        end
        CsvImportUsersService.new.call(file)
        redirect_to admin_path, notice: "Successfully imported"
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
    
    private
        
     # Confirms an admin user
      def admin_user
        unless is_admin?
          flash[:danger] = "You do not have administrative access to this page."
          redirect_to user_url(session[:user_id])
        end
      end
end