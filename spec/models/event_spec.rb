require 'rails_helper'

describe Event do
  describe "before_save" do
    let(:event) { FactoryGirl.build(:event) }
    subject { event.save! }

    it 'generates slug' do
      mock(event).generate_slug.once
      subject
    end
  end

  describe '#to_param' do
    let!(:event) { FactoryGirl.create(:event, slug: 'slug') }
    it { expect(event.to_param).to eq 'slug' }
  end

  describe "#generates_slug" do
    context 'when event already has a slug' do
      let!(:event) { FactoryGirl.create(:event, slug: 'slug') }

      before { event.generate_slug }
      it { expect(event.reload.slug).to eq 'slug' }
    end

    context 'when event does not have a slug' do
      let!(:event) { FactoryGirl.create(:event, slug: nil) }

      before { event.generate_slug }
      it { expect(event.reload.slug).to be_present }
    end
  end
end
