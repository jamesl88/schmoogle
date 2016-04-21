require 'rails_helper'

describe EventsController do
  describe 'GET index' do
    before do
      get :index
    end

    it { expect(response).to be_success }
  end
end
