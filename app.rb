require 'rubygems'
require 'mqtt'

TOPIC = 'BABL'



def show_intro
  system "clear"


  #Startup screen
  puts '      ____              __        '
  puts '     / __ \\   ____ _   / /      ___ '
  puts '    / / / /  / __ `/  / /      / _ \\'
  puts '   / /_/ /  / /_/ /  / /___   /  __/'
  puts '  /_____/   \\__,_/  /_____/   \\___/ '
  puts ''
  puts '     +-+-+-+-+ +-+-+-+-+-+-+-+-+'
  puts '     |R|u|b|y| |t|e|r|m|i|n|a|l|'
  puts '     +-+-+-+-+ +-+-+-+-+-+-+-+-+'
  puts ''
  puts ' >> Author : David Lejeune'
  puts ''
  puts ' ###########################################'
  puts ' #            MQTT Chat Machine            #'
  puts ' ###########################################'
  puts ''
end




def publish_message(name , msg)

      # Publish example
      MQTT::Client.connect('10.177.33.144') do |c|
        c.publish(TOPIC, "#{name}: #{msg}")
      end
end

Thread.new do
        # Subscribe example
        MQTT::Client.connect('10.177.33.144') do |c|
          # If you pass a block to the get method, then it will loop
          c.get(TOPIC) do |topic,message|
            puts "#{topic}: #{message}"
          end
        end
end


def get_msg
  puts 'Enter your message : '
  @msg = gets.chomp
end



show_intro
puts 'Enter your name : '
@name = gets.chomp
get_msg




while @msg != "q" do
    publish_message(@name, @msg)
    get_msg
end
