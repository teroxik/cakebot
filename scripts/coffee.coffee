# Description:
#   Last calls for Cake coffee!
#
# Notes:
#   

moment = require 'moment-timezone'

module.exports = (robot) ->
  robot.respond /coffee me/i, (msg) ->
    now = moment(new Date()).tz('Europe/London').toDate() #current timezone
    theHour = () -> 
      if now.getDay() == 5
        now.getHours() + 1
      else 
        now.getHours()
    theMinute = now.getMinutes()
    msg.send "start" + theHour() + " " + theMinute
    if theHour() <= 16 && theMinute <= 45 #< 4:45pm
      msg.send "There is still time for coffee!"
    if theHour() <= 17 
      msg.send "@Cornel, @Ani, @Andrew, last call for coffees! :bell:"
    else
      msg.send "Cake Coffee is CLOSED."

  robot.respond /coffee left/i, (msg) ->
    now = moment(new Date()).tz('Europe/London').toDate() #current timezone
    theHour = () -> 
      if now.getDay() == 5
        now.getHours() + 1
      else 
        now.getHours()
    theMinute = now.getMinutes()
    if 17 - theHour() <= 0
      msg.send "There's no coffee left! Boooooo!"
    else 
      msg.send "There's enough coffee to last us another " + (16 - theHour()) + " hour and " + theMinute + " minutes today."