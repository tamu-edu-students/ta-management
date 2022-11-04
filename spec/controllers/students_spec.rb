require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  describe 'GET index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    # it 'assigns @students' do
    #   student = Student.create
    #   get :index
    #   expect(assigns(:students)).to eq([student])
    # end

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
      post :create, params: { student: { name: 'Any Name', uin: '123456789', email_id: 'any@email.com' } }
      expect(response.content_type).to eq 'text/html; charset=utf-8'
    end

    it 'responds to custom formats when provided in the params' do
      post :create, params: {student: { name: 'Any Name', uin: '123456789', email_id: 'any@email.com' }, format: :json }
      expect(response.content_type).to eq 'application/json; charset=utf-8'
    end

    # it "responds to html by default" do
    #   post :create, :params => {:student => { :name => "Any Name", :uin => "123456789", :email_id => "any@email.com" }, :format => :json }
    #   @current_student = Student.first
    #   form_params = {
    #      :id => @current_student.id,
    #      :application_status => "review"
    #
    #   }
    #   patch :update, params: form_params
    #   expect(response.status).to eq (400)
    # end
  end

  describe 'GET #show' do
    it 'assigns the requested student to @student' do
      student = FactoryBot.create(:student)
      get :show, params: { id: student.id }
      assigns(:student).should eq(student)
    end

    it 'renders the #show view' do
      student = FactoryBot.create(:student)
      get :show, params: { id: student.id }
      response.should render_template :show
    end
  end

end
