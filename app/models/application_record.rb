# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def story
    PaperTrailScrapbook::LifeHistory.new(self).story
  end

  def history_key
    salt = ENV.fetch('HISTORY_SALT', '4309679837y8eoryidfhg')

    sha2 = Digest::SHA2.new
    sha2.update "#{salt}#{id}#{self.class}"

    sha2.hexdigest
  end
end
