require 'rails_helper'

describe EventPlannerController do
  describe 'GET index' do
    before do

      get :index
    end

    it { expect(response).to be_success }
  end
end
