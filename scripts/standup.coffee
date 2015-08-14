# Description:
#  Generates Alerts before Standups
#
# Commands:
#   hubot alert:list - List all the alerts
#   hubot alert:add - Add an alert to the alerts collection in format roomName hhMM any text of the message
#   hubot alert:clear - Clears the alerts collection

cron = require('cron').CronJob
moment = require('moment')
room = 'Main'

registerJob = (expr, cb) ->
  new cron expr, cb, null, true

module.exports = (robot) ->
  getAlerts = -> robot.brain.get('alerts') || []
  clearAlerts = -> robot.brain.set('alerts', [])


  pattern = new RegExp('alert:add ' +
    "([\w. \W. \-_]+) " +
    "([01]?[0-9]|2[0-3])" +
    "([0-5][0-9])" +
    "(.*)", 'i')

  robot.respond pattern, (msg) ->
    alert = { room: msg.match[1], hour: msg.match[2], minutes: msg.match[3], text: msg.match[4] }
    alerts = getAlerts()
    alerts.push alert
    robot.brain.set 'alerts', alerts

    count = alerts.length

    registerJob "0 #{alert.minutes} #{alert.hour} * * * *", ->
      robot.send { room: alert.room }, alert.text

    text = "New alert has been added!\n"
    text += "The number of alerts is #{count}."
    msg.send text


  alertToText = (alert) ->
    "Room: #{alert.room}, HH: #{alert.hour}, mm: #{alert.minutes}, text: #{alert.text}"

  robot.respond /alert:list/, (msg) ->
    alerts = getAlerts()
    count = alerts.length
    text =
      if count is 0
        'You have no alerts'
      else
        "The number of alerts is #{count} ."

    alertsText = alerts.reduce((previousValue, currentValue, index, array) ->
          previousValue + alertToText(currentValue)
    )
    msg.send "#{text}\n" + alertsText


  robot.respond /alert:clear/, (msg) ->
    clearAlerts()
    msg.send 'All alerts have been cleared.'

