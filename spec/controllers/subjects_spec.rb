require 'rails_helper'

RSpec.describe SubjectsController, type: :controller do
  describe 'GET index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns @subjects' do
      subject = Subject.create
      get :index
      expect(assigns(:subjects)).to eq([subject])
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

  describe 'responds to' do
    it 'responds to html by default' do
      post :create, params: { subject: { course_name: 'course 1', course_section: 'section 1' }}
      expect(response.content_type).to eq 'text/html; charset=utf-8'
    end

    it 'responds to custom formats when provided in the params' do
      post :create, params: { subject: { course_name: 'course 1', course_section: 'section 1' }, format: :json }
      expect(response.content_type).to eq 'application/json; charset=utf-8'
    end
  end

  describe 'GET #show' do
    it 'assigns the requested subject to @subject' do
      subject = FactoryBot.create(:subject)
      get :show, params: { id: subject.id }
      assigns(:subject).should eq(subject)
    end

    it 'renders the #show view' do
      subject = FactoryBot.create(:subject)
      get :show, params: { id: subject.id }
      response.should render_template :show
    end
  end

end
