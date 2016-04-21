require 'rails_helper'

describe ParticipantsController do
  describe 'POST create' do
    before do
      request.env["HTTP_REFERER"] = "schmoogle.com"
      post :create, participant: { name: 'new participant'}
    end

    it { expect(response).to redirect_to "schmoogle.com" }
    it { expect(Participant.last.name).to eq 'new participant' }
  end

  describe 'PUT update' do
    let(:participant) { FactoryGirl.create(:participant, name: 'old name') }

    before do
      request.env["HTTP_REFERER"] = "schmoogle.com"
      put :update, id: participant.id, participant: { name: 'new name'}
    end

    it { expect(response).to redirect_to "schmoogle.com" }
    it { expect(participant.reload.name).to eq 'new name' }
  end

  describe 'DELETE destroy' do
    let!(:participant) { FactoryGirl.create(:participant, name: 'old name') }

    before do
      request.env["HTTP_REFERER"] = "schmoogle.com"
      delete :destroy, id: participant.id
    end

    it { expect(response).to redirect_to "schmoogle.com" }
    it { expect(User.count).to eq 0 }
  end
end
