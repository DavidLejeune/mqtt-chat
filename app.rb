require 'rubygems'
require 'mqtt'





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




    def publish_message
      # Publish example
      MQTT::Client.connect('10.177.33.144') do |c|
        c.publish('test', 'message')
      end
  end

    def subscribe_message
        # Subscribe example
        MQTT::Client.connect('10.177.33.144') do |c|
          # If you pass a block to the get method, then it will loop
          c.get('test') do |topic,message|
            puts "#{topic}: #{message}"
          end
        end
  end






  show_intro
  Puts 'Enter your name'
