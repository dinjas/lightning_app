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

class Lightning < ApplicationRecord
  CHARGES    = %w[Negative Positive].freeze
  BOLT_TYPES = %w[Anvil\ Crawler
                  Cloud\ to\ Air
                  Cloud\ to\ Ground
                  Ground\ to\ Cloud
                  Intracloud].freeze

  has_paper_trail

  validates :name, presence: true
  validates :charge, presence: true, inclusion: CHARGES
  validates :bolt_type, presence: true, inclusion: BOLT_TYPES
  validates :intensity, presence: true, inclusion: (1..10)
  validates :strike_at, presence: true

  alias_attribute :to_s, :name
end
