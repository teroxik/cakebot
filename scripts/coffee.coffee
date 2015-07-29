# Description:
#   Last calls for Cake coffee!
#
# Notes:
#   

schedule = require 'node-schedule'

module.exports = (robot) ->
  robot.respond /(coffee)/i, (msg) ->
    text = msg.message.text
    now = new DateTime()
    if now < 16:50pm
      msg.send "There is still time for coffee!"
    if now > 5pm
      msg.send "Cake Coffee is CLOSED."
    else
      msg.send "@Cornel, @Ani, @Andrew, last call for coffees! :bell:"

