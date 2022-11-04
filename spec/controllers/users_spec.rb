require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    # it "assigns @users" do
    #   user = User.create
    #   get :index
    #   expect(assigns(:users)).to eq([user])
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
      post :create, params: { user: { name: 'Any Name', email_id: 'any@email.com', password: 'password' } }
      expect(response.content_type).to eq 'text/html; charset=utf-8'
    end

    it 'responds to custom formats when provided in the params' do
      post :create, params: { user: { name: 'Any Name', email_id: 'any@email.com', password: 'password' }, format: :json }
      expect(response.content_type).to eq 'application/json; charset=utf-8'
    end
  end

  describe 'GET #show' do
    it 'assigns the requested users to @user' do
      user = FactoryBot.create(:user)
      get :show, params: { id: user.id }
      assigns(:user).should eq(user)
    end

    it 'renders the #show view' do
      user = FactoryBot.create(:user)
      get :show, params: { id: user.id }
      response.should render_template :show
    end
  end

end
