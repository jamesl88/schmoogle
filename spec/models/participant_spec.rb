require 'rails_helper'

describe Participant do
  describe "after_create" do
    let(:event) { FactoryGirl.create(:event) }
    let!(:activity) { FactoryGirl.create(:activity, event: event) }
    let(:participant) { FactoryGirl.build(:participant, event: event) }

    subject { participant.save! }

    it { expect{subject}.to change(Attendance, :count).by(1)}
  end

  describe "#add_attendances" do
    let(:event) { FactoryGirl.create(:event) }
    let!(:activity) { FactoryGirl.create(:activity, event: event) }
    let!(:participant) { FactoryGirl.create(:participant, event: event) }

    subject { participant.add_attendances }

    it { expect{subject}.to change(Attendance, :count).by(1)}
  end
end
