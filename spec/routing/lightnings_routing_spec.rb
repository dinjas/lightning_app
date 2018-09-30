# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LightningsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/lightnings').to route_to('lightnings#index')
    end
  end
end
