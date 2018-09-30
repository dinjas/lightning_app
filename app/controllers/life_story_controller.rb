# frozen_string_literal: true

class LifeStoryController < ApplicationController
  before_action :authenticate_user!

  def history
    return fail_422 unless PaperTrail.request.enabled_for_model?(klass)

    obj = klass.find(obj_id)
    return fail_422 unless can_history?(obj)

    history = CGI.escapeHTML(obj.story).presence || 'No history available'

    render json: { name: "History for '#{obj}'", history: history }
  end

  private

  def fail_422
    head :unprocessable_entity
  end

  def obj_id
    Integer(params.fetch(:id))
  end

  def klass
    params.fetch(:klass).constantize
  end

  def can_history?(obj)
    obj.history_key.eql?(params.fetch(:key))
  end
end
