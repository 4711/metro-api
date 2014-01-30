require File.join(File.dirname(__FILE__), 'app')
run Rack::Cascade.new [API]
