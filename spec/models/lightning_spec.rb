# frozen_string_literal: true
# == Schema Information
#
# Table name: lightnings
#
#  id         :integer          not null, primary key
#  name       :string
#  intensity  :integer
#  charge     :string
#  bolt_type  :string
#  strike_at  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Lightning, type: :model do
  # it_behaves_like 'real_model'
end
