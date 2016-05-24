require 'rails_helper'

describe EventsController do
  describe 'GET show' do
    let(:event) { FactoryGirl.create(:event) }
    before { get :show, id: event.to_param }

    it { expect(response).to be_success }
  end

  describe 'POST create' do
    context 'success' do
      before do
        post :create, event: { name: 'new event'}
      end

      it { expect(response).to redirect_to event_path(Event.last.slug) }
      it { expect(Event.last.name).to eq 'new event' }
    end

    context 'failed' do
      let!(:event) { FactoryGirl.create(:event) }

      before do
        request.env["HTTP_REFERER"] = "schmoogle.com"

        any_instance_of(Event) do |event|
          stub(event).save { false }
        end

        post :create, event: { name: 'new event'}
      end

      it { expect(response).not_to redirect_to event_path(Event.last.slug) }
    end
  end
end
