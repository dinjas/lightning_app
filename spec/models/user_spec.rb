# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  email              :string           not null
#  name               :string           default(""), not null
#  encrypted_password :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#


require 'rails_helper'
require 'shared_model_stuff'

RSpec.describe User, type: :model do
  it_behaves_like 'real_model'
end
