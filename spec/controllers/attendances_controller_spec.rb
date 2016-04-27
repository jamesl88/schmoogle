require 'rails_helper'

describe AttendancesController do
  describe 'PUT update' do
    let(:participant) { FactoryGirl.create(:participant, name: 'old name') }
    let!(:attendance) { FactoryGirl.create(:attendance, attending: false) }

    before do
      put :update, id: attendance.id, format: :json
    end

    it { expect(response.body).to eq AttendanceSerializer.new(attendance.reload).to_json }
    it { expect(attendance.reload.attending).to eq true }
  end
end
