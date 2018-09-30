# frozen_string_literal: true

class LightningsController < ApplicationController
  layout 'application'

  before_action :authenticate_user!

  def index
    @lightnings = Lightning.all
  end
end
