# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def story
    return unless PaperTrail.request.enabled_for_model?(self.class)
    PaperTrailScrapbook::LifeHistory.new(self).story
  end

  # This is used to help prevent unauthorized access to an object's history
  # Only people accessing with a history link generated by the application will
  # be able to access.
  def history_key
    salt = ENV.fetch('HISTORY_SALT', '4309679837y8eoryidfhg')

    sha2 = Digest::SHA2.new
    sha2.update "#{salt}#{id}#{self.class}"

    sha2.hexdigest
  end
end
