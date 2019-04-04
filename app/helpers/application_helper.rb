# frozen_string_literal: true

module ApplicationHelper
  def history_link_for_object(object)
    link_to '#',
            class: 'scrapbook',
            title: 'History',
            data:  { id:    object.id,
                     klass: object.class.name,
                     key:   object.history_key } do
      fa_icon('book')
    end
  end

  def show_pts?
    params[:pts].present?
  end
end
