APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), "..")) unless defined?(APP_ROOT)

require "rubygems"

# Use Bundler (preferred)
environment = File.expand_path("../../vendor/gems/environment", __FILE__)
if File.exist?("#{environment}.rb")
  require environment
end

require "bowline"