# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :clear_flash
  before_action :set_paper_trail_whodunnit

  private

  def clear_flash
    flash.clear
  end
end
