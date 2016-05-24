require 'rails_helper'

describe ActivitiesController do
  let!(:event) { FactoryGirl.create(:event) }
  before do
    any_instance_of(Activity) do |activity|
      stub(activity).add_attendances
    end
  end

  describe 'POST create' do
    before do
      request.env["HTTP_REFERER"] = "schmoogle.com"
      post :create, activity: { name: 'new activity', scheduled_at: Time.now, event_id: event.id }, format: :json
    end

    it { expect(response).to be_success }
    it { expect(Activity.last.name).to eq 'new activity' }
  end
end
