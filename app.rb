require 'rubygems'
require 'mqtt'

# Publish example
MQTT::Client.connect('test.mosquitto.org') do |c|
  c.publish('test', 'message')
end

# Subscribe example
MQTT::Client.connect('test.mosquitto.org') do |c|
  # If you pass a block to the get method, then it will loop
  c.get('test') do |topic,message|
    puts "#{topic}: #{message}"
  end
end
