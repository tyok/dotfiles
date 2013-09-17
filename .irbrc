require "irb/ext/save-history"
require "rubygems"

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

class Object
  def methods_nice
    (methods - Object.new.methods).sort
  end
end

if defined? Rails
  include Rails.application.routes.url_helpers
  default_url_options[:host] = "localhost"
end
