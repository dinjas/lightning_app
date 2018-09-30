# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Lightnings', type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET /lightnings' do
    it 'works! (now write some real specs)' do
      get lightnings_path

      expect(response).to have_http_status(200)
    end
  end
end
