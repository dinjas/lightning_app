# frozen_string_literal: true

require 'rails_helper'
require 'shared_model_stuff'

RSpec.describe ApplicationRecord, type: :model do
  it_behaves_like 'abstract_model'

  let(:lightning) { create(:lightning) }

  describe '#story' do
    it 'story' do
      result = lightning.story

      expect(result).not_to be_nil
    end
  end

  describe '#history_key' do
    it 'history_key' do
      result = lightning.history_key

      expect(result).not_to be_nil
    end
  end
end
