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


class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :validatable

  has_paper_trail

  validates :email, presence: true
  validates :name, presence: true

  alias_attribute :to_s, :name
end
