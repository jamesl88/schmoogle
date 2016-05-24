require 'rails_helper'

describe Activity do
  describe "after_create" do
    let(:event) { FactoryGirl.create(:event) }
    let!(:participant) { FactoryGirl.create(:participant, event: event) }
    let(:activity) { FactoryGirl.build(:activity, event: event) }

    subject { activity.save! }

    it { expect{subject}.to change(Attendance, :count).by(1)}
  end

  describe "#add_attendances" do
    let(:event) { FactoryGirl.create(:event) }
    let!(:activity) { FactoryGirl.create(:activity, event: event) }
    let!(:participant) { FactoryGirl.create(:participant, event: event) }

    subject { activity.add_attendances }

    it { expect{subject}.to change(Attendance, :count).by(1)}
  end
end
