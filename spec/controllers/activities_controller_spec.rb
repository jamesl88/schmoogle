require 'rails_helper'

describe ActivitiesController do
  describe 'GET index' do
    before { get :index }

    it { expect(response).to be_success }
  end

  describe 'POST create' do
    before do
      request.env["HTTP_REFERER"] = "schmoogle.com"
      post :create, activity: { name: 'new activity', scheduled_at: Date.today}
    end

    it { expect(response).to redirect_to "schmoogle.com" }
    it { expect(Activity.last.name).to eq 'new activity' }
  end

  describe 'PUT update' do
    let(:activity) { FactoryGirl.create(:activity, name: 'old name') }

    before do
      request.env["HTTP_REFERER"] = "schmoogle.com"
      put :update, id: activity.id, activity: { name: 'new name'}
    end

    it { expect(response).to redirect_to "schmoogle.com" }
    it { expect(activity.reload.name).to eq 'new name' }
  end

  describe 'DELETE destroy' do
    let!(:activity) { FactoryGirl.create(:activity, name: 'old name') }

    before do
      request.env["HTTP_REFERER"] = "schmoogle.com"
      delete :destroy, id: activity.id
    end

    it { expect(response).to redirect_to "schmoogle.com" }
    it { expect(User.count).to eq 0 }
  end
end
