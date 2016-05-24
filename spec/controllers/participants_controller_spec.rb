require 'rails_helper'

describe ParticipantsController do
  let!(:event) { FactoryGirl.create(:event) }
  before do
    any_instance_of(Participant) do |participant|
      stub(participant).add_attendances
    end
  end

  describe 'POST create' do
    before do
      request.env["HTTP_REFERER"] = "schmoogle.com"
      post :create, participant: { name: 'new participant', event_id: event.id }, format: :json
    end

    it { expect(response).to be_success }
    it { expect(Participant.last.name).to eq 'new participant' }
  end
end
