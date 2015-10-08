require 'rails_helper'

describe UsersController do
  describe 'GET index' do
    before { get :index }

    it { expect(response).to be_success }
  end

  describe 'POST create' do
    before do
      request.env["HTTP_REFERER"] = "example.com"
      post :create, user: { name: 'James Lieu' }
    end

    it { expect(response).to redirect_to "example.com" }
    it { expect(User.last.name).to eq 'James Lieu' }
    it { expect(flash[:success]).to be_present }
  end
end
