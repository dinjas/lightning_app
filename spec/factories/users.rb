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


FactoryBot.define do
  factory :user do
    name { "A user #{Time.zone.now.to_f}" }
    email { "user+#{Time.zone.now.to_f}@mail.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
