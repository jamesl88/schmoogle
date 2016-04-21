require 'rails_helper'

describe EventsController do
  describe 'GET index' do
    before do
      get :index
    end

    it { expect(response).to be_success }
  end

  describe 'GET show' do
    let(:event) { FactoryGirl.create(:event) }
    before { get :show, id: event.id }

    it { expect(response).to be_success }
  end

  describe 'POST create' do
    before do
      request.env["HTTP_REFERER"] = "schmoogle.com"
      post :create, event: { name: 'new event'}
    end

    it { expect(response).to redirect_to "schmoogle.com" }
    it { expect(Event.last.name).to eq 'new event' }
  end

  describe 'PUT update' do
    let(:event) { FactoryGirl.create(:event, name: 'old name') }

    before do
      request.env["HTTP_REFERER"] = "schmoogle.com"
      put :update, id: event.id, event: { name: 'new name'}
    end

    it { expect(response).to redirect_to "schmoogle.com" }
    it { expect(event.reload.name).to eq 'new name' }
  end

  describe 'DELETE destroy' do
    let!(:event) { FactoryGirl.create(:event, name: 'old name') }

    before do
      request.env["HTTP_REFERER"] = "schmoogle.com"
      delete :destroy, id: event.id
    end

    it { expect(response).to redirect_to "schmoogle.com" }
    it { expect(User.count).to eq 0 }
  end
end
