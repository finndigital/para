require "para/version"
require "compass"

module Para
  extension_path = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  Compass::Frameworks.register('para', path: extension_path)
end
