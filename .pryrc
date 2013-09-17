###############################################################################
###############################################################################
# helper methods
###############################################################################

def launch_rails_console_if_is_rails_dir
  rails = File.join Dir.getwd, 'config', 'environment.rb'

  return unless File.exist?(rails) && ENV['SKIP_RAILS'].nil?

  require rails

  case Rails.version
  when /^2/
    require 'console_app'
    require 'console_with_helpers'
  when /^3/
    require 'rails/console/app'
    require 'rails/console/helpers'
  else
    warn "[WARN] cannot load Rails console commands (Not on Rails2 or Rails3?)"
  end

  extend Rails::ConsoleMethods if defined? Rails::ConsoleMethods
end

def print_with_awesomeness
  require 'awesome_print'

  options = { :indent => 2, :sorted_hash_keys => true }
  Pry.config.print = proc do |output, value|
    Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai options}", output)
  end

rescue LoadError => err
  puts "no awesome_print :("
end

def nice_methods
  Object.module_eval do
    def methods_nice
      (methods - Object.new.methods).sort
    end
  end
end

def url_helpers
  if defined? Rails
    include Rails.application.routes.url_helpers
    default_url_options[:host] = "localhost"
  end
end

###############################################################################
###############################################################################
# start config here
###############################################################################

Pry.config.history.file = "~/.irb_history"

# print_with_awesomeness
# launch_rails_console_if_is_rails_dir
nice_methods
url_helpers

# vim: ft=ruby
