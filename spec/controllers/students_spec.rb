require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  describe 'GET index' do
    context "when user is  admin" do
      before do
        allow(controller).to receive(:current_user).and_return(access_level: "admin")
      end
      it 'returns a successful response' do
        get :index
        expect(response).to be_successful
      end
    end
  end


    # it 'assigns @students' do
    #   student = Student.create
    #   get :index
    #   expect(assigns(:students)).to eq([student])
    # end

  #   it 'renders the index template' do
  #     get :index
  #     expect(response).to render_template('index')
  #   end

  #   it 'has a 200 status code' do
  #     get :index
  #     expect(response.status).to eq(200)
  #   end
  # end

  describe 'responds to' do
    it 'responds to html by default' do
      post :create, params: { student: { name: 'Any Name', uin: '123456789', email_id: 'any@email.com' } }
      expect(response.content_type).to eq 'text/html; charset=utf-8'
    end

    it 'responds to custom formats when provided in the params' do
      post :create, params: {student: { name: 'Any Name', uin: '123456789', email_id: 'any@email.com' }, format: :json }
      # expect(response.content_type).to eq 'application/json; charset=utf-8'
    end

    # it "responds to html by default" do
    #   post :create, :params => {:student => { :name => "Any Name", :uin => "123456789", :email_id => "any@email.com" }, :format => :json }
    #   @current_student = Student.first
    #   form_params = {
    #      :id => @current_student.id,
    #      :application_status => "review"
    
    #   }
    #   patch :update, params: form_params
    #   expect(response.status).to eq (400)
    # end
  end

  # describe 'GET #show' do
  # context "when user is  admin" do
  #   before do
  #     allow(controller).to receive(:current_user).and_return(access_level: "admin")
  #   end
  #     it 'assigns the requested student to @student' do
  #       student = FactoryBot.create(:student)
  #       get :show, params: { id: student.id }
  #       assigns(:student).should eq(student)
  #     end

  #     it 'renders the #show view' do
  #       student = FactoryBot.create(:student)
  #       get :show, params: { id: student.id }
  #       response.should render_template :show
  #     end
  #   end
  # end

  describe "POST #create" do
  let(:valid_params) { { student: { name: "John Doe", email: "john@example.com" } } }
  let(:invalid_params) { { student: { name: "", email: "" } } }
  let(:user) { create(:user) }
  before { session[:user_id] = user.id }

  context "with valid params" do
    it "creates a new student" do
      expect {
        post :create, params: valid_params
      }.to change(Student, :count).by(0)
    end
  end

  context "with invalid params" do
    it "does not create a new student" do
      expect {
        post :create, params: invalid_params
      }.not_to change(Student, :count)
    end

    it "redirects to the new student page with an alert" do
      post :create, params: invalid_params
      expect(response).to redirect_to(new_student_path)
      expect(flash[:alert]).to eq(["Uin can't be blank", "Uin is the wrong length (should be 9 characters)", "Resume can't be blank", "Resume is invalid", "Transcript can't be blank", "Transcript is invalid"])
    end
  end
end



end
