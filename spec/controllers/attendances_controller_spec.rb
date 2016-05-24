require 'rails_helper'

describe AttendancesController do
  describe 'PUT update' do
    let(:event) { FactoryGirl.create(:event) }
    let(:participant) { FactoryGirl.create(:participant, name: 'old name', event_id: event.id) }
    let(:activity) { FactoryGirl.create(:activity, event_id: event.id) }
    let!(:attendance) { FactoryGirl.create(:attendance, attending: false, activity: activity, participant: participant) }

    before do
      put :update, id: attendance.id, format: :json
    end

    it { expect(attendance.reload.attending).to eq true }
  end
end
