require 'rails_helper'
require 'capybara/rspec'

RSpec.describe SchedulesController, type: :controller do
  before(:all) do
    if Schedule.where(:code => "ENGR").empty?
      Schedule.create(:code => "ENGR", 
                   :course_id => 404, 
                   :section => 201, 
                   :lecture_day => "Sunday",
                   :start_time => "10:00 AM",
                   :end_time => "12:00 PM",
                   :professor => "Lara",
                   :students => ["kim@yahoo.com", "love@yahoo.com"])
    end

    if Schedule.where(:code => "CS").empty?
      Schedule.create(:code => "CS", 
                   :course_id => 239, 
                   :section => 210, 
                   :lecture_day => "Friday",
                   :start_time => "10:00 AM",
                   :end_time => "12:00 PM",
                   :professor => "Koom",
                   :students => ["kim@yahoo.com", "love@yahoo.com"])
    end

    if Schedule.where(:code => "PHYS").empty?
      Schedule.create(:code => "PHYS", 
                   :course_id => 504, 
                   :section => 201, 
                   :lecture_day => "Tuesday",
                   :start_time => "10:00 AM",
                   :end_time => "12:00 PM",
                   :professor => "Lara",
                   :students => ["kim@yahoo.com", "love@yahoo.com"])
    end

    if Schedule.where(:code => "KIK").empty?
      Schedule.create(:code => "KIK", 
                   :course_id => 204, 
                   :section => 301, 
                   :lecture_day => "Thursday",
                   :start_time => "10:00 AM",
                   :end_time => "12:00 PM",
                   :professor => "Lara",
                   :students => ["kim@yahoo.com", "love@yahoo.com"])
    end
    
    if Schedule.where(:code => "SIS").empty?
      Schedule.create(:code => "SIS", 
                   :course_id => 604, 
                   :section => 601, 
                   :lecture_day => "Monday",
                   :start_time => "10:00 AM",
                   :end_time => "12:00 PM",
                   :professor => "Lara",
                   :students => ["kim@yahoo.com", "love@yahoo.com"])
    end
  end

  describe 'GET index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "views", type: :feature do
    it "views all schedules" do
      visit '/view'
      expect(response.status).to eq(200)
    end
  end

  describe "remove schedules", type: :feature do 
    it "deletes all schedules" do
      get :destroy
      expect(flash[:notice]).to match(/Schedules were successfully removed./)
    end
  end

  # describe 'responds to' do
  #   it 'responds to html by default' do
  #     post :create, params: { schedule: { code: 'ENGR', course_id: 102, section: 600, lecture_day: 'Monday', start_time: '9:00 AM', end_time: '10:10 AM', professor: 123, students: [123 ,234, 456]} }
  #     expect(response.content_type).to eq 'text/html; charset=utf-8'
  #   end

  #   it 'responds to custom formats when provided in the params' do
  #       post :create, params: { schedule: { code: 'ENGR', course_id: 102, section: 600, lecture_day: 'Monday', start_time: '9:00 AM', end_time: '10:10 AM', professor: 123, students: [123 ,234, 456]}, format: :json }
  #     expect(response.content_type).to eq 'application/json; charset=utf-8'
  #   end

#     it "responds to html by default" do
#       post :create, :params => {:schedule => { :code => 'ENGR', :course_id => 102, :section => 600, :lecture_day => 'Monday', :start_time => '9:00 AM', :end_time => '10:10 AM', :professor => 123, :students => [123 ,234, 456]}, :format => :json }
#       @current_schedule = Schedule.first
#       form_params = {
#          :id => @current_schedule.id,
#       }
#       patch :update, params: form_params
#       expect(response.status).to eq (400)
#     end
  # end

  # describe 'GET #show' do
  #   it 'assigns the requested schedule to @schedule' do
  #     schedule = FactoryBot.create(:schedule)
  #     get :show, params: { id: schedule.id }
  #     assigns(:schedule).should eq(schedule)
  #   end

  #   it 'renders the #show view' do
  #     schedule = FactoryBot.create(:schedule)
  #     get :show, params: { id: schedule.id }
  #     response.should render_template :show
  #   end
  # end

end
