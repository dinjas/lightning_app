# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  let(:object) { create(:lightning) }

  describe '#history_link_for_object' do
    it 'works' do
      result = helper.history_link_for_object(object)

      expect(result).not_to be_nil
    end
  end
end
