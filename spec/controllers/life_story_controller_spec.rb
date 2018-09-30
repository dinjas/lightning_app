# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LifeStoryController, type: :controller do
  let(:object) { create(:lightning) }
  let(:user) { create(:user) }

  # TODO: auto-generated
  describe '#history' do
    before do
      sign_in user
    end

    it 'GET history' do
      get :history,
          params:  { id:    object.to_param,
                     klass: object.class,
                     key:   object.history_key },
          format:  :json

      expect(response).to have_http_status(:ok)
    end
  end
end
