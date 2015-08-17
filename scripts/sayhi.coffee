# Notes - 
#   - say [MESSAGE] to [NAME]:
#     - Will send the text in MESSAGE to user NAME in the format "@NAME: MESSAGE"

module.exports = (robot) ->
   robot.respond /say (.*) to (.*)/i, (msg) ->
     msg.send "@" + msg.match[2] + ": " + msg.match[1]

