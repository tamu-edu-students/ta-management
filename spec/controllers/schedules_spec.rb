require 'rails_helper'

RSpec.describe SchedulesController, type: :controller do
  describe 'GET index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

#     it 'assigns @schedules' do
#       shedule = Schedule.create
#       get :index
#       expect(assigns(:schedules)).to eq([schedule])
#     end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'responds to' do
    it 'responds to html by default' do
      post :create, params: { schedule: { code: 'ENGR', course_id: 102, section: 600, lecture_day: 'Monday', start_time: '9:00 AM', end_time: '10:10 AM', professor: 123, students: [123 ,234, 456]} }
      expect(response.content_type).to eq 'text/html; charset=utf-8'
    end

    it 'responds to custom formats when provided in the params' do
        post :create, params: { schedule: { code: 'ENGR', course_id: 102, section: 600, lecture_day: 'Monday', start_time: '9:00 AM', end_time: '10:10 AM', professor: 123, students: [123 ,234, 456]}, format: :json }
      expect(response.content_type).to eq 'application/json; charset=utf-8'
    end

  end

  describe 'GET #show' do
    it 'assigns the requested schedule to @schedule' do
      schedule = FactoryBot.create(:schedule)
      get :show, params: { id: schedule.id }
      assigns(:schedule).should eq(schedule)
    end

    it 'renders the #show view' do
      schedule = FactoryBot.create(:schedule)
      get :show, params: { id: schedule.id }
      response.should render_template :show
    end
  end

end
