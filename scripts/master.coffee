module.exports = (robot) ->
   robot.respond /who am I/i, (msg) ->
     sender   = msg.message.user.name.toLowerCase()
     msg.reply "#{sender}"
