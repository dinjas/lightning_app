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

FactoryBot.define do
  factory :lightning do
    name { "Lightning #{Time.zone.now.to_f}" }
    intensity { 5 }
    charge { 'Negative' }
    bolt_type { 'Cloud to Air' }
    strike_at { Time.zone.now.advance(years: 2) }
  end
end
