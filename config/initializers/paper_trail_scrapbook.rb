# frozen_string_literal: true

PaperTrailScrapbook.configure do |config|
  config.whodunnit_class = User

  config.invalid_whodunnit = proc do |id|
    "** missing #{id}**"
  end
end
