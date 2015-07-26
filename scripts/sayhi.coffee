module.exports = (robot) ->
   robot.respond /say (.*) to (.*)/i, (msg) ->
     msg.reply msg.match[2] + ": " + msg.match[1]
