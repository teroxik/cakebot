# Description:
#  Generates Alerts before Standups
#
# Commands:
#   hubot alert:list - List all the alerts
#   hubot alert:add - Add an alert to the alerts collection
#   hubot alert:clear - Clears the alerts collection

cron = require('cron').CronJob
moment = require('moment')
room = 'Main'

registerJob = (expr, cb) ->
  new cron expr, cb, null, true



module.exports = (robot) ->
  getAlerts = -> robot.brain.get('alerts') || []
  clearAlerts = -> robot.brain.set('alerts', [])

  registerJob '0 0,5,10,15,20,25,30,35,40,45,50,55 * * * *', ->
    alerts = getAlerts()
    robot.send { room: room }, "Standup alerts are coming!!"


  robot.respond /alert:add (.+)/, (msg) ->
    alert = msg.match[1]
    alerts = getAlerts()
    alerts.push alert
    robot.brain.set 'alerts', alerts

    count = alerts.length
    text = "New alert has been added!\n"
    text += "The number of alerts is #{count}."
    msg.send text


  robot.respond /alert:list/, (msg) ->
    alerts = getAlerts()
    count = alerts.length
    text =
      if count is 0
        'You have no alerts'
      else
        "The number of alerts is #{count} ."

    msg.send "#{text}\n" + alerts.join "\n"


  robot.respond /alert:clear/, (msg) ->
    clearAlerts()
    msg.send 'All alerts have been cleared.'

