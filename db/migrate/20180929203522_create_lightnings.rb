# frozen_string_literal: true

class CreateLightnings < ActiveRecord::Migration[5.2]
  def change
    create_table :lightnings do |t|
      t.string   :name
      t.integer  :intensity
      t.string   :charge
      t.string   :bolt_type
      t.datetime :strike_at

      t.timestamps
    end
  end
end
