require 'logger'
require 'json'

Dir[File.dirname(__FILE__) + '/variety_format/**/*.rb'].each do |file|
  require file
end
