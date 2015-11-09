# Description:
#   Last calls for Cake coffee!
#
# Notes:
# - coffee me: replys whether Cake Coffee is open, closed or last calls (15 minutes before closing)
#  - coffee left: replys with time remaining till Cake Coffee closes that day  

moment = require 'moment-timezone'
https = require 'https'

module.exports = (robot) ->
  robot.respond /coffee me/i, (msg) ->
    now = moment(new Date()).tz('Europe/London').toDate() #current timezone
    theHour = () -> 
      if now.getDay() == 5
        now.getHours() + 1
      else 
        now.getHours()
    theMinute = now.getMinutes()
    
    if theHour() <= 16 && theMinute <= 45 #< 4:45pm
      msg.send "There is still time for coffee!"
    if theHour() == 16 && theMinute >= 46  
      msg.send "@Cornel, @Ani, @Andrew, last call for coffees! :bell:"
    if theHour() >= 17
      msg.send "Cake Coffee is CLOSED."

  robot.respond /coffee left/i, (msg) ->
    # Get current timestamp
    timestamp = Math.floor(new Date() / 1000)
    manchesterTimestamp = timestamp

    # Ask Google for Manchester offset and set the variable
    https.get 'https://maps.googleapis.com/maps/api/timezone/json?location=53.435849,-2.165621&timestamp=' + timestamp, (res) ->
      data = ''
      res.on 'data', (chunk) ->
        data += chunk.toString()
      res.on 'end', () ->
        manchesterTimestamp = timestamp + JSON.parse(data).dstOffset

    # Create date/time object from timestamp
    now = new Date(manchesterTimestamp * 1000)

    theHour = () -> 
      if now.getDay() == 5
        now.getHours() + 1 # Fridays we close an hour earlier
      else 
        now.getHours()
    theMinute = now.getMinutes()
    if 17 - theHour() <= 0
      msg.send "There's no coffee left! Boooooo!"
    else 
      msg.send "There's enough coffee to last us another " + (16 - theHour()) + " hour and " + (60 - theMinute) + " minutes today."
