# Description:
#   Last calls for Cake coffee!
#
# Notes:
#   

#schedule = require 'node-schedule'

module.exports = (robot) ->
  robot.respond /(coffee)/i, (msg) ->
    text = msg.message.text
    now = new Date()
    if now.getHours() <= 16 && now.getMinutes() <= 45 #< 4:50pm
      msg.send "There is still time for coffee!"
    if now.getHours > 17 # 5pm
      msg.send "Cake Coffee is CLOSED."
    if now.getHours() >= 16 && now.getMinutes() >= 45
      msg.send "@Cornel, @Ani, @Andrew, last call for coffees! :bell:"

