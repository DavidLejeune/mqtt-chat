require 'rubygems'
require 'mqtt'

# Publish example
MQTT::Client.connect('10.177.33.144') do |c|
  c.publish('test', 'message')
end

# Subscribe example
MQTT::Client.connect('10.177.33.144') do |c|
  # If you pass a block to the get method, then it will loop
  c.get('test') do |topic,message|
    puts "#{topic}: #{message}"
  end
end
