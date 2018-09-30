# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LightningsController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  # TODO: auto-generated
  describe '#index' do
    it 'GET index' do
      get :index

      expect(response).to have_http_status(:ok)
    end
  end
end
