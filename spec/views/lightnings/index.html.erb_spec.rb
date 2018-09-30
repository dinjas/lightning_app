# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'lightnings/index', type: :view do
  before(:each) do
    assign(:lightnings, create_list(:lightning, 2))
  end

  it 'renders a list of lightnings' do
    render
  end
end
