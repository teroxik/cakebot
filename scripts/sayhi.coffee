module.exports = (robot) ->
   robot.respond /say (.*) to (.*)/i, (msg) ->
     msg.send "@" + msg.match[2] + ": " + msg.match[1]
